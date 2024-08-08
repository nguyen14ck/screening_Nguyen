#!/bin/bash

# Directory to list files
directory="."

# Output file
output_file="${directory}/1_system_info.txt"

# Get number of cpus
num_cpus=$(nproc)
echo "Number of cpus: $num_cpus" > $output_file
echo "" >> $output_file


# Get free space of current drive
available_space=$(df -h --total --output=source,avail|grep ^total | awk '{print $2}')
echo "Available disk space: $available_space" >> $output_file
echo "" >> $output_file


# Get memory usage
used_mem=$(free -m | grep -m 1 "Mem:" | awk '{print $3}')
echo "Used memory: $used_mem MB" >> $output_file

echo ""
echo "Successfully saved system information to file:"
echo "$output_file"
echo ""






