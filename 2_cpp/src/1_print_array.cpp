#include <iostream>
#include <chrono>
#include <ctime>

#include <sys/resource.h>
#include <fstream>

using namespace std;
using namespace chrono;






void print_in_line(int arr[], int size)
{
    cout << "Array in a line: ";
    for (int i = 0; i < size; ++i) 
    {
        cout << arr[i] << " ";
    }
    cout << "\n\n";
}


void print_in_triangle(int arr[], int size, int num_rows)
{
    // Column to print
    int k = num_rows;

    // Element to print
    int index = 0;

    cout << "Array in a triangle:\n";
    for (int i = 1; i <= num_rows; i++) 
    {
        for (int j = 1; j <= num_rows; j++) 
        {
            // Print at this column
            if ((j >= k) && (index < size)) 
            {
                cout << arr[index] << " ";
                index++;
            }
            else
                cout << " ";
        }
        k--;
        cout << "\n";
    }

    cout << "\n";
}


void log_memory_usage() 
{
    struct rusage mem_usage;
    getrusage(RUSAGE_SELF, &mem_usage);
    cout << "Memory usage: " << mem_usage.ru_maxrss << " KB" << "\n";
}


int main() 
{
    // Start timing
    auto start_time = high_resolution_clock::now();
    clock_t cpu_start = clock();


    // Initialize array
    int num_rows = 4;
    int size = 10;
    int numbers[size];
    for (int i = 0; i < size; ++i) 
    {
        numbers[i] = i;
    }

    
    // Print array in a line
    cout << "\n";
    print_in_line(numbers, size);
    
    // Print array in a triangle
    print_in_triangle(numbers, size, num_rows);


    // Stop timing
    clock_t cpu_end = clock();
    auto end_time = high_resolution_clock::now();

    // Compute duration
    auto elapsed_time = duration_cast<milliseconds>(end_time - start_time);
    double cpu_time_used = (double)(cpu_end - cpu_start) / CLOCKS_PER_SEC;


    // Show on screen
    cout << "Elapsed time: " << elapsed_time.count() << " milliseconds" << endl;
    cout << "CPU time used: " << cpu_time_used << " seconds" << endl;
    log_memory_usage();
    cout << "\n";


    // Write to a file
    ofstream outfile("logs/final_profile.txt"); // Create an output file stream
    if (!outfile.is_open()) { // Check if the file opened successfully
        cerr << "Error opening file!" << endl;
        return 1;
    }
    streambuf *coutbuf = cout.rdbuf(); // Save the original cout buffer
    cout.rdbuf(outfile.rdbuf()); // Redirect cout to the file

    cout << "Elapsed time: " << elapsed_time.count() << " milliseconds" << endl;
    cout << "CPU time used: " << cpu_time_used << " seconds" << endl;
    log_memory_usage();
    cout << "\n";

    outfile.close(); // Close the file
    cout.rdbuf(coutbuf); // Restore the original cout buffer to screen
    

    return 0;
}

