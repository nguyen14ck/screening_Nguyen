#!/bin/bash

source_file="src/1_print_array.cpp"
program_name="bin/1_print_array"
tem_file="logs/tem.txt"
output_file="logs/final_profile.txt"

# Compile with profiling enabled
g++ -pg $source_file -o $program_name

# Run the program
./$program_name

# Generate profile
gprof -b $program_name gmon.out > $tem_file
sed -i '1,7d' $tem_file
sed -i '/Call graph/,$d' $tem_file


# Extract the most called function
most_called_repeat=$(awk -v col="$4" '{ if ($col > max) { max = $col; line_number = NR; function_name=$7$8$9$10; times=$4} } END { printf "%s | Number-of-calls: %s",function_name,times }' "$tem_file")
most_called_cost=$(awk -v col="$3" '{ if ($col > max) { max = $col; line_number = NR; function_name=$7$8$9$10; cost=$3} } END { printf "%s   | Self-time: %s",function_name,cost }' "$tem_file")

# Display and save results
echo "Most called repeating: $most_called_repeat" | tee -a $output_file
echo "Most called duration: $most_called_cost" | tee -a  $output_file
echo ""
echo "Successfully saved profiling results to file: $output_file"
echo ""