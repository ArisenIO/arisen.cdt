add_custom_command( TARGET ArisenClang POST_BUILD COMMAND mkdir -p ${CMAKE_BINARY_DIR}/bin )
macro( arisen_clang_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/arisen_llvm/bin)
   add_custom_command( TARGET ArisenClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( arisen_clang_install )

macro( arisen_clang_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/arisen_llvm/bin)
   add_custom_command( TARGET ArisenClang POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   add_custom_command( TARGET ArisenClang POST_BUILD COMMAND cd ${CMAKE_BINARY_DIR}/bin && ln -sf ${file} ${symlink} )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_INSTALL_PREFIX}/bin)")
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink ${CDT_INSTALL_PREFIX}/bin/${file} ${CMAKE_INSTALL_PREFIX}/bin/${symlink})")
endmacro( arisen_clang_install_and_symlink )

macro( arisen_tool_install file )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET ArisenTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
endmacro( arisen_tool_install )

macro( arisen_tool_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/tools/bin)
   add_custom_command( TARGET ArisenTools POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy ${BINARY_DIR}/${file} ${CMAKE_BINARY_DIR}/bin/ )
   install(FILES ${BINARY_DIR}/${file}
      DESTINATION ${CDT_INSTALL_PREFIX}/bin
      PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_INSTALL_PREFIX}/bin)")
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink ${CDT_INSTALL_PREFIX}/bin/${file} ${CMAKE_INSTALL_PREFIX}/bin/${symlink})")
endmacro( arisen_tool_install_and_symlink )

macro( arisen_cmake_install_and_symlink file symlink )
   set(BINARY_DIR ${CMAKE_BINARY_DIR}/modules)
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_INSTALL_PREFIX}/lib/cmake/arisen.cdt)")
   install(CODE "execute_process( COMMAND ${CMAKE_COMMAND} -E create_symlink ${CDT_INSTALL_PREFIX}/lib/cmake/arisen.cdt/${file} ${CMAKE_INSTALL_PREFIX}/lib/cmake/arisen.cdt/${symlink})")
endmacro( arisen_cmake_install_and_symlink )

macro( arisen_libraries_install)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/lib)
   execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/include)
   install(DIRECTORY ${CMAKE_BINARY_DIR}/lib/ DESTINATION ${CDT_INSTALL_PREFIX}/lib)
   install(DIRECTORY ${CMAKE_BINARY_DIR}/include/ DESTINATION ${CDT_INSTALL_PREFIX}/include)
endmacro( arisen_libraries_install )

arisen_clang_install_and_symlink(llvm-ranlib arisen-ranlib)
arisen_clang_install_and_symlink(llvm-ar arisen-ar)
arisen_clang_install_and_symlink(llvm-nm arisen-nm)
arisen_clang_install_and_symlink(llvm-objcopy arisen-objcopy)
arisen_clang_install_and_symlink(llvm-objdump arisen-objdump)
arisen_clang_install_and_symlink(llvm-readobj arisen-readobj)
arisen_clang_install_and_symlink(llvm-readelf arisen-readelf)
arisen_clang_install_and_symlink(llvm-strip arisen-strip)

arisen_clang_install(opt)
arisen_clang_install(llc)
arisen_clang_install(lld)
arisen_clang_install(ld.lld)
arisen_clang_install(ld64.lld)
arisen_clang_install(clang-7)
arisen_clang_install(wasm-ld)

arisen_tool_install_and_symlink(arisen-pp arisen-pp)
arisen_tool_install_and_symlink(arisen-wast2wasm arisen-wast2wasm)
arisen_tool_install_and_symlink(arisen-wasm2wast arisen-wasm2wast)
arisen_tool_install_and_symlink(arisen-cc arisen-cc)
arisen_tool_install_and_symlink(arisen-cpp arisen-cpp)
arisen_tool_install_and_symlink(arisen-ld arisen-ld)
arisen_tool_install_and_symlink(arisen-abigen arisen-abigen)
arisen_tool_install_and_symlink(arisen-abidiff arisen-abidiff)
arisen_tool_install_and_symlink(arisen-init arisen-init)

arisen_clang_install(../lib/LLVMArisenApply${CMAKE_SHARED_LIBRARY_SUFFIX})
arisen_clang_install(../lib/LLVMArisenSoftfloat${CMAKE_SHARED_LIBRARY_SUFFIX})
arisen_clang_install(../lib/arisen_plugin${CMAKE_SHARED_LIBRARY_SUFFIX})

arisen_cmake_install_and_symlink(arisen.cdt-config.cmake arisen.cdt-config.cmake)
arisen_cmake_install_and_symlink(ArisenWasmToolchain.cmake ArisenWasmToolchain.cmake)
arisen_cmake_install_and_symlink(ArisenCDTMacros.cmake ArisenCDTMacros.cmake)

arisen_libraries_install()
