#
# Find gtkmm libraries
#   On Windows, we first check if vcpkg is installed. If it is,
#    we query whether it has glibmm listed under its installed
#    packages. If so we can query it for include and library
#    locations. If vcpkg is not installed or it does not listed
#    glibmm we check the GLIBMM_ROOT variable and if it is set
#    we attempt to find glibmm from there.
#   On linux and mac we query pkgconfig for the location of
#    glibmm and its dependencies

if(WIN32)
  windows_find_library(GTKMM "gtkmm.dll" "glib;sigc++")
  set(GTKMM3_LIBRARIES ${GTKMM_LIBRARIES})
else()
  find_package(PkgConfig REQUIRED)
  pkg_check_modules(GTKMM3 REQUIRED gtkmm-3.0)
  include_directories(${GTKMM3_INCLUDE_DIRS})
  link_directories(${GTKMM3_LIBRARY_DIRS})
  add_definitions(${GTKMM3_CFLAGS_OTHER})
endif()
