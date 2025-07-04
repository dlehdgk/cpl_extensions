oldprefix="infalpha-"
newprefix="infbeta-"

for file in "${oldprefix}"*; do
	cp "$file" "${newprefix}${file#${oldprefix}}"
done
