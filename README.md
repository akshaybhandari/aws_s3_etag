# aws_s3_etag

Ruby script to calculate Etag/S3 MD5 sum for very big files uploaded using multipart S3 API

# Description

Calculates the Etag/S3 MD5 Sum of a file, using the same algorithm that S3 uses on multipart uploaded files. Specially usefull on files uploaded using multipart S3 API. You can check file integrity comparing S3 Etag with the value returned by this script.

# Usage
```
Usage : ruby aws_s3_etag.rb <file_path> <chunk_size>

- file_path : Calculate Etag of this file
- chunk_size : Multipart chunk size in MB
```

# Example

* Use 8 MB chunk size

    ~> ruby aws_s3_etag.rb myfile.txt 8

# References

[This answer explains about the algorithm for s3 ETag calculation](https://stackoverflow.com/a/19896823)</br>
[Bash implementation for the same](https://github.com/antespi/s3md5)</br>
[Python implementation for the same](https://github.com/tlastowka/calculate_multipart_etag)</br>

