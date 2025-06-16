for file in pactldesidesy5.*; do
	mv "$file" "nu-pactdesidesy5.${file#pactldesidesy5.}"
done
