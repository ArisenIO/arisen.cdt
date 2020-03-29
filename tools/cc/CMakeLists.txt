configure_file(${CMAKE_CURRENT_SOURCE_DIR}/arisen-cc.cpp.in ${CMAKE_BINARY_DIR}/arisen-cc.cpp)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/arisen-cpp.cpp.in ${CMAKE_BINARY_DIR}/arisen-cpp.cpp)

add_tool(arisen-cc)
add_tool(arisen-cpp)
