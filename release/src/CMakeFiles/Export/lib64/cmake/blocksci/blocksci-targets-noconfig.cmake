#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "blocksci" for configuration ""
set_property(TARGET blocksci APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(blocksci PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib64/libblocksci.so"
  IMPORTED_SONAME_NOCONFIG "libblocksci.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS blocksci )
list(APPEND _IMPORT_CHECK_FILES_FOR_blocksci "${_IMPORT_PREFIX}/lib64/libblocksci.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
