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
include external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/depend.make

# Include the progress variables for this target.
include external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/progress.make

# Include the compile flags for this target's objects.
include external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/flags.make

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/accounting.cpp.o: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/flags.make
external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/accounting.cpp.o: ../external/bitcoin-api-cpp/src/test/accounting.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/accounting.cpp.o"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tests.dir/accounting.cpp.o -c /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/accounting.cpp

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/accounting.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tests.dir/accounting.cpp.i"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/accounting.cpp > CMakeFiles/tests.dir/accounting.cpp.i

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/accounting.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tests.dir/accounting.cpp.s"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/accounting.cpp -o CMakeFiles/tests.dir/accounting.cpp.s

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/general.cpp.o: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/flags.make
external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/general.cpp.o: ../external/bitcoin-api-cpp/src/test/general.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/general.cpp.o"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tests.dir/general.cpp.o -c /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/general.cpp

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/general.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tests.dir/general.cpp.i"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/general.cpp > CMakeFiles/tests.dir/general.cpp.i

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/general.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tests.dir/general.cpp.s"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/general.cpp -o CMakeFiles/tests.dir/general.cpp.s

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/main.cpp.o: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/flags.make
external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/main.cpp.o: ../external/bitcoin-api-cpp/src/test/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/main.cpp.o"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tests.dir/main.cpp.o -c /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/main.cpp

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tests.dir/main.cpp.i"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/main.cpp > CMakeFiles/tests.dir/main.cpp.i

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tests.dir/main.cpp.s"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/main.cpp -o CMakeFiles/tests.dir/main.cpp.s

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/mining.cpp.o: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/flags.make
external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/mining.cpp.o: ../external/bitcoin-api-cpp/src/test/mining.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/mining.cpp.o"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tests.dir/mining.cpp.o -c /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/mining.cpp

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/mining.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tests.dir/mining.cpp.i"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/mining.cpp > CMakeFiles/tests.dir/mining.cpp.i

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/mining.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tests.dir/mining.cpp.s"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/mining.cpp -o CMakeFiles/tests.dir/mining.cpp.s

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/node.cpp.o: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/flags.make
external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/node.cpp.o: ../external/bitcoin-api-cpp/src/test/node.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/node.cpp.o"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tests.dir/node.cpp.o -c /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/node.cpp

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tests.dir/node.cpp.i"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/node.cpp > CMakeFiles/tests.dir/node.cpp.i

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tests.dir/node.cpp.s"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/node.cpp -o CMakeFiles/tests.dir/node.cpp.s

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/rawtransaction.cpp.o: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/flags.make
external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/rawtransaction.cpp.o: ../external/bitcoin-api-cpp/src/test/rawtransaction.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/rawtransaction.cpp.o"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tests.dir/rawtransaction.cpp.o -c /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/rawtransaction.cpp

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/rawtransaction.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tests.dir/rawtransaction.cpp.i"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/rawtransaction.cpp > CMakeFiles/tests.dir/rawtransaction.cpp.i

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/rawtransaction.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tests.dir/rawtransaction.cpp.s"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/rawtransaction.cpp -o CMakeFiles/tests.dir/rawtransaction.cpp.s

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/wallet.cpp.o: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/flags.make
external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/wallet.cpp.o: ../external/bitcoin-api-cpp/src/test/wallet.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/wallet.cpp.o"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tests.dir/wallet.cpp.o -c /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/wallet.cpp

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/wallet.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tests.dir/wallet.cpp.i"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/wallet.cpp > CMakeFiles/tests.dir/wallet.cpp.i

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/wallet.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tests.dir/wallet.cpp.s"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test/wallet.cpp -o CMakeFiles/tests.dir/wallet.cpp.s

# Object files for target tests
tests_OBJECTS = \
"CMakeFiles/tests.dir/accounting.cpp.o" \
"CMakeFiles/tests.dir/general.cpp.o" \
"CMakeFiles/tests.dir/main.cpp.o" \
"CMakeFiles/tests.dir/mining.cpp.o" \
"CMakeFiles/tests.dir/node.cpp.o" \
"CMakeFiles/tests.dir/rawtransaction.cpp.o" \
"CMakeFiles/tests.dir/wallet.cpp.o"

# External object files for target tests
tests_EXTERNAL_OBJECTS =

external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/accounting.cpp.o
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/general.cpp.o
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/main.cpp.o
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/mining.cpp.o
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/node.cpp.o
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/rawtransaction.cpp.o
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/wallet.cpp.o
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/build.make
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/bitcoinapi/libbitcoinapi.so.0.1.0
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: /usr/lib64/libcurl.so
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: /usr/local/lib64/libjsoncpp.so
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: /usr/local/lib64/libjsonrpccpp-common.so
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: /usr/local/lib64/libjsonrpccpp-client.so
external/bitcoin-api-cpp/src/test/bitcoinapi_tests: external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zmengaa/BlockSci/release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX executable bitcoinapi_tests"
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/build: external/bitcoin-api-cpp/src/test/bitcoinapi_tests

.PHONY : external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/build

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/clean:
	cd /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test && $(CMAKE_COMMAND) -P CMakeFiles/tests.dir/cmake_clean.cmake
.PHONY : external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/clean

external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/depend:
	cd /home/zmengaa/BlockSci/release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zmengaa/BlockSci /home/zmengaa/BlockSci/external/bitcoin-api-cpp/src/test /home/zmengaa/BlockSci/release /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test /home/zmengaa/BlockSci/release/external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : external/bitcoin-api-cpp/src/test/CMakeFiles/tests.dir/depend

