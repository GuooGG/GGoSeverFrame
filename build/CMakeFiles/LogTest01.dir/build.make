# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /root/cmake/cmake-3.27.0-linux-x86_64/bin/cmake

# The command to remove a file.
RM = /root/cmake/cmake-3.27.0-linux-x86_64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/workspace/GGoSeverFrame

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/workspace/GGoSeverFrame/build

# Include any dependencies generated for this target.
include CMakeFiles/LogTest01.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/LogTest01.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/LogTest01.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LogTest01.dir/flags.make

CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.o: CMakeFiles/LogTest01.dir/flags.make
CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.o: /root/workspace/GGoSeverFrame/Test/LogTest01.cpp
CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.o: CMakeFiles/LogTest01.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.o -MF CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.o.d -o CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.o -c /root/workspace/GGoSeverFrame/Test/LogTest01.cpp

CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/Test/LogTest01.cpp > CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.i

CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/Test/LogTest01.cpp -o CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.s

CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.o: CMakeFiles/LogTest01.dir/flags.make
CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/LogSystem.cpp
CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.o: CMakeFiles/LogTest01.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.o -MF CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.o.d -o CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/LogSystem.cpp

CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/LogSystem.cpp > CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.i

CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/LogSystem.cpp -o CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.s

CMakeFiles/LogTest01.dir/GGo/src/config.cpp.o: CMakeFiles/LogTest01.dir/flags.make
CMakeFiles/LogTest01.dir/GGo/src/config.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/config.cpp
CMakeFiles/LogTest01.dir/GGo/src/config.cpp.o: CMakeFiles/LogTest01.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/LogTest01.dir/GGo/src/config.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/LogTest01.dir/GGo/src/config.cpp.o -MF CMakeFiles/LogTest01.dir/GGo/src/config.cpp.o.d -o CMakeFiles/LogTest01.dir/GGo/src/config.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/config.cpp

CMakeFiles/LogTest01.dir/GGo/src/config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/LogTest01.dir/GGo/src/config.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/config.cpp > CMakeFiles/LogTest01.dir/GGo/src/config.cpp.i

CMakeFiles/LogTest01.dir/GGo/src/config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/LogTest01.dir/GGo/src/config.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/config.cpp -o CMakeFiles/LogTest01.dir/GGo/src/config.cpp.s

CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.o: CMakeFiles/LogTest01.dir/flags.make
CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/mutex.cpp
CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.o: CMakeFiles/LogTest01.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.o -MF CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.o.d -o CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/mutex.cpp

CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/mutex.cpp > CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.i

CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/mutex.cpp -o CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.s

CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.o: CMakeFiles/LogTest01.dir/flags.make
CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/thread.cpp
CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.o: CMakeFiles/LogTest01.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.o -MF CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.o.d -o CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/thread.cpp

CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/thread.cpp > CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.i

CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/thread.cpp -o CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.s

CMakeFiles/LogTest01.dir/GGo/src/util.cpp.o: CMakeFiles/LogTest01.dir/flags.make
CMakeFiles/LogTest01.dir/GGo/src/util.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/util.cpp
CMakeFiles/LogTest01.dir/GGo/src/util.cpp.o: CMakeFiles/LogTest01.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/LogTest01.dir/GGo/src/util.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/LogTest01.dir/GGo/src/util.cpp.o -MF CMakeFiles/LogTest01.dir/GGo/src/util.cpp.o.d -o CMakeFiles/LogTest01.dir/GGo/src/util.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/util.cpp

CMakeFiles/LogTest01.dir/GGo/src/util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/LogTest01.dir/GGo/src/util.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/util.cpp > CMakeFiles/LogTest01.dir/GGo/src/util.cpp.i

CMakeFiles/LogTest01.dir/GGo/src/util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/LogTest01.dir/GGo/src/util.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/util.cpp -o CMakeFiles/LogTest01.dir/GGo/src/util.cpp.s

# Object files for target LogTest01
LogTest01_OBJECTS = \
"CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.o" \
"CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.o" \
"CMakeFiles/LogTest01.dir/GGo/src/config.cpp.o" \
"CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.o" \
"CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.o" \
"CMakeFiles/LogTest01.dir/GGo/src/util.cpp.o"

# External object files for target LogTest01
LogTest01_EXTERNAL_OBJECTS =

/root/workspace/GGoSeverFrame/bin/LogTest01: CMakeFiles/LogTest01.dir/Test/LogTest01.cpp.o
/root/workspace/GGoSeverFrame/bin/LogTest01: CMakeFiles/LogTest01.dir/GGo/src/LogSystem.cpp.o
/root/workspace/GGoSeverFrame/bin/LogTest01: CMakeFiles/LogTest01.dir/GGo/src/config.cpp.o
/root/workspace/GGoSeverFrame/bin/LogTest01: CMakeFiles/LogTest01.dir/GGo/src/mutex.cpp.o
/root/workspace/GGoSeverFrame/bin/LogTest01: CMakeFiles/LogTest01.dir/GGo/src/thread.cpp.o
/root/workspace/GGoSeverFrame/bin/LogTest01: CMakeFiles/LogTest01.dir/GGo/src/util.cpp.o
/root/workspace/GGoSeverFrame/bin/LogTest01: CMakeFiles/LogTest01.dir/build.make
/root/workspace/GGoSeverFrame/bin/LogTest01: CMakeFiles/LogTest01.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable /root/workspace/GGoSeverFrame/bin/LogTest01"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LogTest01.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LogTest01.dir/build: /root/workspace/GGoSeverFrame/bin/LogTest01
.PHONY : CMakeFiles/LogTest01.dir/build

CMakeFiles/LogTest01.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LogTest01.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LogTest01.dir/clean

CMakeFiles/LogTest01.dir/depend:
	cd /root/workspace/GGoSeverFrame/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/workspace/GGoSeverFrame /root/workspace/GGoSeverFrame /root/workspace/GGoSeverFrame/build /root/workspace/GGoSeverFrame/build /root/workspace/GGoSeverFrame/build/CMakeFiles/LogTest01.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/LogTest01.dir/depend

