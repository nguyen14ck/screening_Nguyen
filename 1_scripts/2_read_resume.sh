#!/bin/bash


# Input file
input_file="./Nguyen_Resume.pdf"
tem_file="./Nguyen_Resume.txt"



# Output file
directory="."
output_file="${directory}/2_resume_info.txt"


# Convert pdf to text file
pdftotext $input_file $tem_file


# Count number of lines
echo "==============================================" > $output_file
echo "### Counting" >> $output_file
echo "==============================================" >> $output_file
line_count=$(wc -l $tem_file | awk '{print $1}')
echo "Number of lines: $line_count" >> $output_file
echo "" >> $output_file
echo "" >> $output_file


# Extract the first and last line
echo "==============================================" >> $output_file
echo "### The first line and last line:" >> $output_file
echo "==============================================" >> $output_file
first_line=$(head -n 1 "$tem_file")
last_line=$(tail -n 1 "$tem_file")
echo "$first_line" >> $output_file
echo "$last_line" >> $output_file
echo "" >> $output_file
echo "" >> $output_file

# Extract the second word of each line
echo "==============================================" >> $output_file
echo "### The second word of each line:" >> $output_file
echo "==============================================" >> $output_file
awk '{print $2}' "$tem_file" >> "$output_file"


echo ""
echo "Successfully saved resume information to file:"
echo "$output_file"
echo ""
