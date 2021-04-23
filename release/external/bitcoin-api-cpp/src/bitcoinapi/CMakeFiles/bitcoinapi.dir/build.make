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
include external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/depend.make

# Include the progress variables for this target.
include external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/progress.make

# Include the compile flags for this target's objects.
include external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/flags.make

external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.o: external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/flags.make
external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.o: ../external/bitcoin-api-cpp/src/bitcoinapi/bitcoinapi.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.o"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/bitcoinapi && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.o -c /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/bitcoinapi/bitcoinapi.cpp

external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.i"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/bitcoinapi && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/bitcoinapi/bitcoinapi.cpp > CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.i

external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.s"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/bitcoinapi && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/bitcoinapi/bitcoinapi.cpp -o CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.s

# Object files for target bitcoinapi
bitcoinapi_OBJECTS = \
"CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.o"

# External object files for target bitcoinapi
bitcoinapi_EXTERNAL_OBJECTS =

external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0: external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/bitcoinapi.cpp.o
external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0: external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/build.make
external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0: /usr/lib64/libcurl.so
external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0: /usr/local/lib64/libjsoncpp.so
external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0: /usr/local/lib64/libjsonrpccpp-common.so
external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0: /usr/local/lib64/libjsonrpccpp-client.so
external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0: external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libbitcoinapi.so"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/bitcoinapi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bitcoinapi.dir/link.txt --verbose=$(VERBOSE)
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/bitcoinapi && $(CMAKE_COMMAND) -E cmake_symlink_library libbitcoinapi.so.0.1.0 libbitcoinapi.so.0 libbitcoinapi.so

external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0: external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0
	@$(CMAKE_COMMAND) -E touch_nocreate external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0

external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so: external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0
	@$(CMAKE_COMMAND) -E touch_nocreate external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so

# Rule to build all files generated by this target.
external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/build: external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so

.PHONY : external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/build

external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/clean:
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/bitcoinapi && $(CMAKE_COMMAND) -P CMakeFiles/bitcoinapi.dir/cmake_clean.cmake
.PHONY : external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/clean

external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/depend:
	cd /home/zmengaa/BlockSci/release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zmengaa/BlockSci /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/bitcoinapi /home/zmengaa/BlockSci/release /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/bitcoinapi /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : external/bitcoin-api-cpp/src/bitcoinapi/CMakeFiles/bitcoinapi.dir/depend
