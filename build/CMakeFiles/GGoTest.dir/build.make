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
include CMakeFiles/GGoTest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/GGoTest.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/GGoTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/GGoTest.dir/flags.make

CMakeFiles/GGoTest.dir/GGo/GGo.cpp.o: CMakeFiles/GGoTest.dir/flags.make
CMakeFiles/GGoTest.dir/GGo/GGo.cpp.o: /root/workspace/GGoSeverFrame/GGo/GGo.cpp
CMakeFiles/GGoTest.dir/GGo/GGo.cpp.o: CMakeFiles/GGoTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/GGoTest.dir/GGo/GGo.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GGoTest.dir/GGo/GGo.cpp.o -MF CMakeFiles/GGoTest.dir/GGo/GGo.cpp.o.d -o CMakeFiles/GGoTest.dir/GGo/GGo.cpp.o -c /root/workspace/GGoSeverFrame/GGo/GGo.cpp

CMakeFiles/GGoTest.dir/GGo/GGo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GGoTest.dir/GGo/GGo.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/GGo.cpp > CMakeFiles/GGoTest.dir/GGo/GGo.cpp.i

CMakeFiles/GGoTest.dir/GGo/GGo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GGoTest.dir/GGo/GGo.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/GGo.cpp -o CMakeFiles/GGoTest.dir/GGo/GGo.cpp.s

CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.o: CMakeFiles/GGoTest.dir/flags.make
CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/LogSystem.cpp
CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.o: CMakeFiles/GGoTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.o -MF CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.o.d -o CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/LogSystem.cpp

CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/LogSystem.cpp > CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.i

CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/LogSystem.cpp -o CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.s

CMakeFiles/GGoTest.dir/GGo/src/config.cpp.o: CMakeFiles/GGoTest.dir/flags.make
CMakeFiles/GGoTest.dir/GGo/src/config.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/config.cpp
CMakeFiles/GGoTest.dir/GGo/src/config.cpp.o: CMakeFiles/GGoTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/GGoTest.dir/GGo/src/config.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GGoTest.dir/GGo/src/config.cpp.o -MF CMakeFiles/GGoTest.dir/GGo/src/config.cpp.o.d -o CMakeFiles/GGoTest.dir/GGo/src/config.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/config.cpp

CMakeFiles/GGoTest.dir/GGo/src/config.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GGoTest.dir/GGo/src/config.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/config.cpp > CMakeFiles/GGoTest.dir/GGo/src/config.cpp.i

CMakeFiles/GGoTest.dir/GGo/src/config.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GGoTest.dir/GGo/src/config.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/config.cpp -o CMakeFiles/GGoTest.dir/GGo/src/config.cpp.s

CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.o: CMakeFiles/GGoTest.dir/flags.make
CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/mutex.cpp
CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.o: CMakeFiles/GGoTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.o -MF CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.o.d -o CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/mutex.cpp

CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/mutex.cpp > CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.i

CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/mutex.cpp -o CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.s

CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.o: CMakeFiles/GGoTest.dir/flags.make
CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/thread.cpp
CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.o: CMakeFiles/GGoTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.o -MF CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.o.d -o CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/thread.cpp

CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/thread.cpp > CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.i

CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/thread.cpp -o CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.s

CMakeFiles/GGoTest.dir/GGo/src/util.cpp.o: CMakeFiles/GGoTest.dir/flags.make
CMakeFiles/GGoTest.dir/GGo/src/util.cpp.o: /root/workspace/GGoSeverFrame/GGo/src/util.cpp
CMakeFiles/GGoTest.dir/GGo/src/util.cpp.o: CMakeFiles/GGoTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/GGoTest.dir/GGo/src/util.cpp.o"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GGoTest.dir/GGo/src/util.cpp.o -MF CMakeFiles/GGoTest.dir/GGo/src/util.cpp.o.d -o CMakeFiles/GGoTest.dir/GGo/src/util.cpp.o -c /root/workspace/GGoSeverFrame/GGo/src/util.cpp

CMakeFiles/GGoTest.dir/GGo/src/util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GGoTest.dir/GGo/src/util.cpp.i"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/workspace/GGoSeverFrame/GGo/src/util.cpp > CMakeFiles/GGoTest.dir/GGo/src/util.cpp.i

CMakeFiles/GGoTest.dir/GGo/src/util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GGoTest.dir/GGo/src/util.cpp.s"
	/opt/rh/devtoolset-8/root/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/workspace/GGoSeverFrame/GGo/src/util.cpp -o CMakeFiles/GGoTest.dir/GGo/src/util.cpp.s

# Object files for target GGoTest
GGoTest_OBJECTS = \
"CMakeFiles/GGoTest.dir/GGo/GGo.cpp.o" \
"CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.o" \
"CMakeFiles/GGoTest.dir/GGo/src/config.cpp.o" \
"CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.o" \
"CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.o" \
"CMakeFiles/GGoTest.dir/GGo/src/util.cpp.o"

# External object files for target GGoTest
GGoTest_EXTERNAL_OBJECTS =

/root/workspace/GGoSeverFrame/bin/GGoTest: CMakeFiles/GGoTest.dir/GGo/GGo.cpp.o
/root/workspace/GGoSeverFrame/bin/GGoTest: CMakeFiles/GGoTest.dir/GGo/src/LogSystem.cpp.o
/root/workspace/GGoSeverFrame/bin/GGoTest: CMakeFiles/GGoTest.dir/GGo/src/config.cpp.o
/root/workspace/GGoSeverFrame/bin/GGoTest: CMakeFiles/GGoTest.dir/GGo/src/mutex.cpp.o
/root/workspace/GGoSeverFrame/bin/GGoTest: CMakeFiles/GGoTest.dir/GGo/src/thread.cpp.o
/root/workspace/GGoSeverFrame/bin/GGoTest: CMakeFiles/GGoTest.dir/GGo/src/util.cpp.o
/root/workspace/GGoSeverFrame/bin/GGoTest: CMakeFiles/GGoTest.dir/build.make
/root/workspace/GGoSeverFrame/bin/GGoTest: CMakeFiles/GGoTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/root/workspace/GGoSeverFrame/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable /root/workspace/GGoSeverFrame/bin/GGoTest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/GGoTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/GGoTest.dir/build: /root/workspace/GGoSeverFrame/bin/GGoTest
.PHONY : CMakeFiles/GGoTest.dir/build

CMakeFiles/GGoTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/GGoTest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/GGoTest.dir/clean

CMakeFiles/GGoTest.dir/depend:
	cd /root/workspace/GGoSeverFrame/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/workspace/GGoSeverFrame /root/workspace/GGoSeverFrame /root/workspace/GGoSeverFrame/build /root/workspace/GGoSeverFrame/build /root/workspace/GGoSeverFrame/build/CMakeFiles/GGoTest.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/GGoTest.dir/depend

