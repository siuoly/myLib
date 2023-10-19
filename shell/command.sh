# find
find . -type f -size -4096c  # find size smaller than 4096 bytes.
find . -type f -size +2k  # larger than 2*1024 bytes.
find . -type f -size +2M  # larger than 2 Megabytes.

# zip, unzip
unzip "*.zip" -d dir  # unzip all file to <dir>, quote is need for *
unzip -O big5 file.zip  # unzip traditional chinese archive 繁體中文解壓縮

