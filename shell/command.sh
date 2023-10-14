# find
find . -type f -size -4096c  # find size smaller than 4096 bytes.
find . -type f -size +2k  # larger than 2*1024 bytes.
find . -type f -size +2M  # larger than 2 Megabytes.

