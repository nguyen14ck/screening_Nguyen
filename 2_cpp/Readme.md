### This project was written on Linux using Visual Studio Code.

The configuration files in folder ".vscode" support Build, Run/Debug on Linux and Windows.

The memory usage log function uses the library "<sys/resource.h>" which is only for Linux.

### Folder content

Folder bin: contains binary files after building

Folder logs: contains output log files

### Build and run the program

```
g++ src/1_print_array.cpp -o bin/1_print_array & bin/1_print_array
```

### Run script to build, run the program, and save the log file

```
./2_profiling.sh
```
