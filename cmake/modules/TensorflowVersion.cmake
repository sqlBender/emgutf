SET(TENSORFLOW_VERSION_FILE "${TENSORFLOW_SOURCE_DIR}/tensorflow/core/public/version.h")
file(STRINGS "${TENSORFLOW_VERSION_FILE}" TENSORFLOW_VERSION_PARTS REGEX "#define TF_[A-Z]+_VERSION[ ]+" )

string(REGEX REPLACE ".+TF_MAJOR_VERSION[ ]+([0-9]+).*" "\\1" TENSORFLOW_VERSION_MAJOR "${TENSORFLOW_VERSION_PARTS}")
string(REGEX REPLACE ".+TF_MINOR_VERSION[ ]+([0-9]+).*" "\\1" TENSORFLOW_VERSION_MINOR "${TENSORFLOW_VERSION_PARTS}")
string(REGEX REPLACE ".+TF_PATCH_VERSION[ ]+([0-9]+).*" "\\1" TENSORFLOW_VERSION_PATCH "${TENSORFLOW_VERSION_PARTS}")

file(STRINGS "${TENSORFLOW_VERSION_FILE}" TENSORFLOW_VERSION_PARTS REGEX "#define TF_VERSION_SUFFIX[ ]+" )
string(REGEX REPLACE ".+TF_VERSION_SUFFIX[ ]+\"+([-a-z0-9]+)\"+.*" "\\1" TENSORFLOW_VERSION_SUFFIX "${TENSORFLOW_VERSION_PARTS}")
#MESSAGE(STATUS "TENSOTFLOW_VERSION_PARTS:${TENSORFLOW_VERSION_PARTS}")
#MESSAGE(STATUS "TENSOTFLOW_VERSION_SUFFIX:${TENSORFLOW_VERSION_SUFFIX}")

set(TENSORFLOW_VERSION "${TENSORFLOW_VERSION_MAJOR}.${TENSORFLOW_VERSION_MINOR}.${TENSORFLOW_VERSION_PATCH}")

set(TENSORFLOW_SOVERSION "${TENSORFLOW_VERSION_MAJOR}.${TENSORFLOW_VERSION_MINOR}")
set(TENSORFLOW_LIBVERSION "${TENSORFLOW_VERSION_MAJOR}.${TENSORFLOW_VERSION_MINOR}.${TENSORFLOW_VERSION_PATCH}")

# create a dependency on version file
# we never use output of the following command but cmake will rerun automatically if the version file changes
configure_file("${TENSORFLOW_VERSION_FILE}" "${CMAKE_BINARY_DIR}/junk/version.junk" COPYONLY)
