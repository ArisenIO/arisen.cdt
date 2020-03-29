file(GLOB HEADERS "*.hpp"
                  "*.h")

add_library(arisen
            arisenlib.cpp
            crypto.cpp
            ${HEADERS})

add_library(arisen_malloc
            malloc.cpp
            ${HEADERS})

add_library(arisen_dsm
            simple_malloc.cpp
            ${HEADERS})

add_library(arisen_cmem
            memory.cpp
            ${HEADERS})

add_native_library(native_arisen
                   arisenlib.cpp
                   crypto.cpp
                   malloc.cpp
                   ${HEADERS})

set_target_properties(arisen_malloc PROPERTIES LINKER_LANGUAGE C)

target_include_directories(arisen PUBLIC
                                 ${CMAKE_SOURCE_DIR}/libc/musl/include
                                 ${CMAKE_SOURCE_DIR}/libc/musl/src/internal
                                 ${CMAKE_SOURCE_DIR}/libc/musl/src/crypt
                                 ${CMAKE_SOURCE_DIR}/libc/musl/arch/rsn
                                 ${CMAKE_SOURCE_DIR}/libcxx/include
                                 ${CMAKE_SOURCE_DIR}
                                 ${CMAKE_SOURCE_DIR}/boost/include)

target_link_libraries( arisen c c++ )
add_dependencies( native_arisen arisen )

add_custom_command( TARGET arisen POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:arisen> ${BASE_BINARY_DIR}/lib )
add_custom_command( TARGET arisen_malloc POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:arisen_malloc> ${BASE_BINARY_DIR}/lib )
add_custom_command( TARGET arisen_dsm POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:arisen_dsm> ${BASE_BINARY_DIR}/lib )
add_custom_command( TARGET arisen_cmem POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:arisen_cmem> ${BASE_BINARY_DIR}/lib )
add_custom_command( TARGET native_arisen POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:native_arisen> ${BASE_BINARY_DIR}/lib )

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/../arisenlib DESTINATION ${BASE_BINARY_DIR}/include FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp")
