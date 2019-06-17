# https://stackoverflow.com/questions/44740414/cmake-check-if-pylint-is-installed

# - Find Pylint
# Find the Pylint executable and extract the version number
#
# OUTPUT Variables
#
#   PYLINT_FOUND
#       True if the pylint package was found
#   PYLINT_EXECUTABLE
#       The pylint executable location
#   PYLINT_VERSION
#       A string denoting the version of pylint that has been found

find_program ( PYLINT_EXECUTABLE NAMES pylint pylint-3 PATHS /usr/bin )

if ( PYLINT_EXECUTABLE )
  execute_process ( COMMAND ${PYLINT_EXECUTABLE} --version OUTPUT_VARIABLE PYLINT_VERSION_RAW ERROR_QUIET )
  if (PYLINT_VERSION_RAW)
    string ( REGEX REPLACE "^pylint ([0-9]+.[0-9]+.[0-9]+),.*" "\\1" PYLINT_VERSION ${PYLINT_VERSION_RAW})
  else ()
    set ( PYLINT_VERSION "unknown" )
  endif()
endif ()

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS ( Pylint DEFAULT_MSG PYLINT_EXECUTABLE )

mark_as_advanced ( PYLINT_EXECUTABLE PYLINT_VERSION )
