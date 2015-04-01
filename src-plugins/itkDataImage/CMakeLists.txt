################################################################################
#
# medInria
#
# Copyright (c) INRIA 2013 - 2014. All rights reserved.
# See LICENSE.txt for details.
# 
#  This software is distributed WITHOUT ANY WARRANTY; without even
#  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#  PURPOSE.
#
################################################################################

project(itkDataImagePlugin)

## #############################################################################
## Setup version numbering
## #############################################################################

set(${PROJECT_NAME}_VERSION ${MEDINRIA_VERSION})

string(TOUPPER ${PROJECT_NAME} PROJECT_NAME_UP)
add_definitions(-D${PROJECT_NAME_UP}_VERSION="${${PROJECT_NAME}_VERSION}")


## #############################################################################
## Resolve dependencies
## #############################################################################

find_package(dtk REQUIRED)
include(${dtk_USE_FILE})
include(dtkPlugin)

find_package(ITK REQUIRED)
include(${ITK_USE_FILE})

if (ITK_USE_SYSTEM_GDCM)
  add_definitions(-DITK_USE_SYSTEM_GDCM)
endif()

find_package(DCMTK REQUIRED)
if (APPLE)
  include(FixDCMTKMacInstall)
  FixDCMTKMacInstall()
endif()

find_package(VTK REQUIRED)
include(${VTK_USE_FILE})


# This is a CMake example for Python

FIND_PACKAGE(SWIG REQUIRED)
INCLUDE(${SWIG_USE_FILE})

FIND_PACKAGE(PythonLibs)
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

SET(CMAKE_SWIG_FLAGS "")

SET_SOURCE_FILES_PROPERTIES(itkDataImage.i PROPERTIES CPLUSPLUS ON)

## #############################################################################
## List Sources
## #############################################################################

list_source_files(${PROJECT_NAME}
  . # current dir
  datas
  interactors
  navigators
  readers
  writers
  )

## #############################################################################
## include directorie.
## #############################################################################

list_header_directories_to_include(${PROJECT_NAME}
  ${${PROJECT_NAME}_HEADERS}
  )

include_directories(${${PROJECT_NAME}_INCLUDE_DIRS}
  ${MEDINRIA_INCLUDE_DIRS}
  )
  

  
foreach(DIR_TO_INCLUDE ${${PROJECT_NAME}_INCLUDE_DIRS})
	SET_SOURCE_FILES_PROPERTIES(itkDataImage.i PROPERTIES SWIG_FLAGS "-I${DIR_TO_INCLUDE}")
endforeach(DIR_TO_INCLUDE)

SWIG_ADD_MODULE(itkDataImage python itkDataImage.i ${${PROJECT_NAME}_SOURCES})
SWIG_LINK_LIBRARIES(itkDataImage ${PYTHON_LIBRARIES})
## #############################################################################
## Precompile headers
## #############################################################################

if(MEDINRIA_USE_PRECOMPILED_HEADERS)
  add_precompiled_header(${PROJECT_NAME}_PCH
    ${MEDPLUGINSPCH_H}
    ${MEDPLUGINSPCH_CPP}
    ${${PROJECT_NAME}_SOURCES}
    )
endif()


## #############################################################################
## add library
## #############################################################################

# Due to the large number of template functions, windows needs an extra compile flag.
# Currently this only affects x64/debug builds, but enabling this flag for others does no harm.
if (MSVC)
    set(bigobjFile itkDataImage.cpp)
    get_source_file_property(bigobjFile_COMPILE_FLAGS ${bigobjFile} COMPILE_FLAGS)
    if(${bigobjFile_COMPILE_FLAGS} STREQUAL NOTFOUND)
        set_source_files_properties(${bigobjFile}
          PROPERTIES COMPILE_FLAGS
          "/bigobj"
          )
    else()
        set_source_files_properties(${bigobjFile}
          PROPERTIES COMPILE_FLAGS
         "${bigobjFile_COMPILE_FLAGS} /bigobj"
         )
    endif()

  #Prevent compiler warnings about valid std::copy.
  if(MSVC)
      add_definitions(-D_SCL_SECURE_NO_WARNINGS)
  endif()

endif()

add_library(${PROJECT_NAME} SHARED
  ${${PROJECT_NAME}_PCH}
  ${${PROJECT_NAME}_CFILES}
  )


## #############################################################################
## Link
## #############################################################################

target_link_libraries(${PROJECT_NAME}
  ${QT_LIBRARIES}
  dtkCore
  dtkLog
  ITKIOBioRad
  ITKIOBMP
  ITKIOGDCM
  ITKIOGIPL
  ITKIOHDF5
  ITKIOJPEG
  ITKIOLSM
  ITKIOMeta
  ITKIONIFTI
  ITKIONRRD
  ITKIOPhilipsREC
  ITKIOPNG
  ITKIOStimulate
  ITKIOVTK
  ITKStatistics
  ${ITKReview_LIBRARIES} #TODO Get rid of this ASAP
  medCore
  medImageIO
  medLog
  medVtkInria
  QVTK
  vtkCommon
  vtkRendering
  vtkVolumeRendering
  )
  
SWIG_LINK_LIBRARIES(itkDataImage ${PYTHON_LIBRARIES})
SWIG_LINK_LIBRARIES(itkDataImage	 ${QT_LIBRARIES})
SWIG_LINK_LIBRARIES(itkDataImage	  dtkCore	)
SWIG_LINK_LIBRARIES(itkDataImage	  dtkLog	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOBioRad	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOBMP	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOGDCM	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOGIPL	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOHDF5	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOJPEG	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOLSM	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOMeta	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIONIFTI	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIONRRD	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOPhilipsREC	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOPNG	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOStimulate	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKIOVTK	)
SWIG_LINK_LIBRARIES(itkDataImage	  ITKStatistics	)
SWIG_LINK_LIBRARIES(itkDataImage	  ${ITKReview_LIBRARIES} )
SWIG_LINK_LIBRARIES(itkDataImage	  medCore	)
SWIG_LINK_LIBRARIES(itkDataImage	  medImageIO	)
SWIG_LINK_LIBRARIES(itkDataImage	  medLog	)
SWIG_LINK_LIBRARIES(itkDataImage	  medVtkInria	)
SWIG_LINK_LIBRARIES(itkDataImage	  QVTK	)
SWIG_LINK_LIBRARIES(itkDataImage	  vtkCommon	)
SWIG_LINK_LIBRARIES(itkDataImage	  vtkRendering	)
SWIG_LINK_LIBRARIES(itkDataImage	  vtkVolumeRendering	)


# needed because of link  with medImageIO
if(APPLE)
  FixDCMTKMacLink(${PROJECT_NAME} ${DCMTK_LIBRARIES})  
endif(APPLE)

## #############################################################################
## Install rules
## #############################################################################

set_plugin_install_rules(${PROJECT_NAME})


## #############################################################################
## Build tests
## #############################################################################

if(MEDINRIA_BUILD_TESTS)
  #add_subdirectory(tests)
endif()

