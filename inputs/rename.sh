for file in inflation.*; do
	mv "$file" "infalpha.${file#inflation.}"
done
