# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zmengaa/BlockSci

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zmengaa/BlockSci/release

# Include any dependencies generated for this target.
include benchmark/CMakeFiles/blocksci_benchmark.dir/depend.make

# Include the progress variables for this target.
include benchmark/CMakeFiles/blocksci_benchmark.dir/progress.make

# Include the compile flags for this target's objects.
include benchmark/CMakeFiles/blocksci_benchmark.dir/flags.make

benchmark/CMakeFiles/blocksci_benchmark.dir/main.cpp.o: benchmark/CMakeFiles/blocksci_benchmark.dir/flags.make
benchmark/CMakeFiles/blocksci_benchmark.dir/main.cpp.o: ../benchmark/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object benchmark/CMakeFiles/blocksci_benchmark.dir/main.cpp.o"
	cd /home/zmengaa/BlockSci/release/benchmark && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/blocksci_benchmark.dir/main.cpp.o -c /home/zmengaa/BlockSci/benchmark/main.cpp

benchmark/CMakeFiles/blocksci_benchmark.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blocksci_benchmark.dir/main.cpp.i"
	cd /home/zmengaa/BlockSci/release/benchmark && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zmengaa/BlockSci/benchmark/main.cpp > CMakeFiles/blocksci_benchmark.dir/main.cpp.i

benchmark/CMakeFiles/blocksci_benchmark.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blocksci_benchmark.dir/main.cpp.s"
	cd /home/zmengaa/BlockSci/release/benchmark && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zmengaa/BlockSci/benchmark/main.cpp -o CMakeFiles/blocksci_benchmark.dir/main.cpp.s

# Object files for target blocksci_benchmark
blocksci_benchmark_OBJECTS = \
"CMakeFiles/blocksci_benchmark.dir/main.cpp.o"

# External object files for target blocksci_benchmark
blocksci_benchmark_EXTERNAL_OBJECTS =

benchmark/blocksci_benchmark: benchmark/CMakeFiles/blocksci_benchmark.dir/main.cpp.o
benchmark/blocksci_benchmark: benchmark/CMakeFiles/blocksci_benchmark.dir/build.make
benchmark/blocksci_benchmark: src/libblocksci.so
benchmark/blocksci_benchmark: benchmark/CMakeFiles/blocksci_benchmark.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable blocksci_benchmark"
	cd /home/zmengaa/BlockSci/release/benchmark && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/blocksci_benchmark.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
benchmark/CMakeFiles/blocksci_benchmark.dir/build: benchmark/blocksci_benchmark

.PHONY : benchmark/CMakeFiles/blocksci_benchmark.dir/build

benchmark/CMakeFiles/blocksci_benchmark.dir/clean:
	cd /home/zmengaa/BlockSci/release/benchmark && $(CMAKE_COMMAND) -P CMakeFiles/blocksci_benchmark.dir/cmake_clean.cmake
.PHONY : benchmark/CMakeFiles/blocksci_benchmark.dir/clean

benchmark/CMakeFiles/blocksci_benchmark.dir/depend:
	cd /home/zmengaa/BlockSci/release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zmengaa/BlockSci /home/zmengaa/BlockSci/benchmark /home/zmengaa/BlockSci/release /home/zmengaa/BlockSci/release/benchmark /home/zmengaa/BlockSci/release/benchmark/CMakeFiles/blocksci_benchmark.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : benchmark/CMakeFiles/blocksci_benchmark.dir/depend
