# - Find WebP
# Find the WebP library 
# This module defines
#  WebP_INCLUDE_DIRS, where to find webp/decode.h
#  WebP_LIBRARIES, the libraries needed to use WEBP
#

find_path(WebP_INCLUDE_DIRS
    NAMES webp/decode.h
)
mark_as_advanced(WebP_INCLUDE_DIRS)

find_library(WebP_LIBRARY_RELEASE NAMES webp PATH_SUFFIXES lib)
find_library(WebP_LIBRARY_DEBUG NAMES webpd PATH_SUFFIXES lib)

find_library(WebPMUX_LIBRARY_RELEASE NAMES webpmux PATH_SUFFIXES lib)
find_library(WebPMUX_LIBRARY_DEBUG NAMES webpmuxd PATH_SUFFIXES lib)

include(SelectLibraryConfigurations)
select_library_configurations(WebP)
select_library_configurations(WebPMUX)

set(WebP_LIBRARIES ${WebPMUX_LIBRARY} ${WebP_LIBRARY})

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(WebP DEFAULT_MSG WebP_INCLUDE_DIRS WebP_LIBRARIES)
