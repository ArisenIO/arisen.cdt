include(ExternalProject)
# if no cdt root is given use default path
if(ARISEN_CDT_ROOT STREQUAL "" OR NOT ARISEN_CDT_ROOT)
   find_package(arisen.cdt)
endif()

ExternalProject_Add(
   multi_index_example_project
   SOURCE_DIR ${CMAKE_SOURCE_DIR}/src
   BINARY_DIR ${CMAKE_BINARY_DIR}/multi_index_example
   CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${ARISEN_CDT_ROOT}/lib/cmake/arisen.cdt/ArisenWasmToolchain.cmake
   UPDATE_COMMAND ""
   PATCH_COMMAND ""
   TEST_COMMAND ""
   INSTALL_COMMAND ""
   BUILD_ALWAYS 1
)