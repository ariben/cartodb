#!/bin/bash
# Jesus Vazquez
truncate -s 0 specfull.txt
cat Makefile | grep -v 'spec/lib/varnish_spec.rb'| \
grep -v 'spec/models/asset_spec.rb'| \
grep -v 'services/user-mover/spec/user_mover_spec.rb'| \
grep -v 'require ./spec/rspec_configuration.rb'| \
grep 'rb'| sed -e 's/^\s*//' -e '/^$/d' | sed '/^#/ d' | sed 's/\\//' | sed 's/\s.*$//' > temp.txt

i=6001;
while read -r line
do
  echo "$line $i" >> specfull.txt;
  i=$((i+1))
done < temp.txt

echo "# Speclist has been created"
