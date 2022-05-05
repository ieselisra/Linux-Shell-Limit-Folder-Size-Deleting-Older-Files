#!/bin/bash

# Start
echo "---------------------------------------------------"
echo ">>            Folder Size Limiter v1            <<"
echo "---------------------------------------------------"

# Change the Path for your desired folder
directory=/opt/data/packages/

# Set here the Maximal allowed size in Kb (Now 1,1Gb)
max_size='1100000'



## Nothing more to change ---- Script Start
# Calculate size of the $directory in Kb (-ks) [-mb for Megabytes]
size=$(du -ks $directory | awk '{print $1}')

#Check if $directory size > $max_size
if [ $size -gt $max_size ];
then
  # Show feedback
  echo "$directory actual size: $size . Max Size allowed is: $max_size"
  echo "Deleting older files"
  
  #Delete oldest regular file in loop till $directory size < $max_size
  while [[ $size > $max_size ]]; do
    #statements
    find $directory -type f -printf '%T+ %p\n'| sort | head -n 1 | xargs rm -f
    size=$(du -ks $directory | awk '{print $1}')
  done
  size2=$(du -ks $directory | awk '{print $1}')
  echo "Done! New size: $size2"
else
echo "$directory size doesn't exceed the max allowed size (actual: $size Kb, Max: $max_size Kb)"
fi
echo "---------------------------------------------------"
