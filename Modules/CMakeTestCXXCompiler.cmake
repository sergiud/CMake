# This file is used by EnableLanguage in cmGlobalGenerator to
# determine that that selected C++ compiler can actually compile
# and like the most basic of programs.   If not, a fatel error
# is set and cmake stops processing commands and will not generate
# any makefiles or projects.
MESSAGE(STATUS "Check for working CXX compiler: ${CMAKE_CXX_COMPILER}")
WRITE_FILE(${CMAKE_BINARY_DIR}/CMakeTmp/testCXXCompiler.cxx "int main(){return 0;}")
TRY_COMPILE(CMAKE_CXX_COMPILER_WORKS ${CMAKE_BINARY_DIR} 
          ${CMAKE_BINARY_DIR}/CMakeTmp/testCXXCompiler.cxx
          OUTPUT_VARIABLE OUTPUT)
IF(NOT CMAKE_CXX_COMPILER_WORKS)
 MESSAGE(STATUS "Check for working CXX compiler: ${CMAKE_CXX_COMPILER} -- broken")
 MESSAGE(FATAL_ERROR "The C++ compiler \"${CMAKE_CXX_COMPILER}\" "
                     "is not able to compile a simple tests program.\nIt fails "
                     "with the following output:\n ${OUTPUT}\n\n"
                     "CMake will not be able to correctly generate this project.")
ELSE(NOT CMAKE_CXX_COMPILER_WORKS)
  MESSAGE(STATUS "Check for working CXX compiler: ${CMAKE_CXX_COMPILER} -- works")
ENDIF(NOT CMAKE_CXX_COMPILER_WORKS)
