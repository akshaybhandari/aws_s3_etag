require 'digest'
require 'optparse'

def get_file_part_hash(file_path, blocksize)
  line = 0
  file_hash = ''
  File.open(file_path) do |file|
    while (buffer = file.read(blocksize))
      line += 1
      file_hash += Digest::MD5.digest(buffer)
    end
    file_hash = Digest::MD5.hexdigest(file_hash)
  end
  [file_hash, line]
end

def get_s3_etag(file_path, chunk_size)
  blocksize = chunk_size * 1024 * 1024
  file_hash = ''
  if ::File.size(file_path) > blocksize
    file_hash, line = get_file_part_hash(file_path, blocksize)
  else
    line = 1
    file_hash = Digest::MD5.file(file_path)
  end
  return file_hash if line == 1
  file_hash + '-' + line.to_s
end

if ARGV.length != 2
  puts "Usage: ruby aws_s3_etag.rb <file_path> <chunk_size>"
  exit 1
else
  file_path = ARGV[0]
  chunk_size = ARGV[1].to_i
end

puts get_s3_etag(file_path, chunk_size)
