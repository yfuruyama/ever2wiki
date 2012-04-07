#!/bin/sh


# create temporary file name
date=`date +%s`
tmp=tmp_$date

# create tmp file with clipboard contnts
pbpaste | cat > $tmp

# unorderd list conversion
sed -i -e 's/^   \* /-/' $tmp
sed -i -e 's/^      \* /--/' $tmp
sed -i -e 's/^        \* /---/' $tmp

# orderd list conversion
sed -i -e 's/^  [1-9]\. /+/' $tmp
sed -i -e 's/^    [1-9]\. /++/' $tmp
sed -i -e 's/^      [1-9]\. /+++/' $tmp

# paste contents to clipboard
pbcopy < $tmp

# delete temporary file
rm $tmp
rm $tmp-e
