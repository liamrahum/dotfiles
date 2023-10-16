#!/usr/bin/env sh

for i in {1..70}
do
	cliphist list | cliphist delete
done
