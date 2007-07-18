/.* => .* \(.*\)/ {
	print $3
	next
}

/.* \(.*\)/ {
	print $1
	next
}

