fullfile=$1

### Get filename without extension
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

find /var/cache/apt/archives/ -type f | grep -v "/lock" > ${filename}.lst

echo "${filename}.lst created."