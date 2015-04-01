/*=========================================================================

 medInria

 Copyright (c) INRIA 2013 - 2014. All rights reserved.
 See LICENSE.txt for details.
 
  This software is distributed WITHOUT ANY WARRANTY; without even
  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
  PURPOSE.

=========================================================================*/

#pragma once

#include <itkVector.h>
#include <itkDataImage.h>
#include <itkDataImagePluginExport.h>

extern const char itkDataImageVectorUChar3Name[];

typedef itk::Vector<unsigned char,3>                                                           UCharVectorType;
typedef ITKDATAIMAGEPLUGIN_EXPORT itkDataImage<3,UCharVectorType,itkDataImageVectorUChar3Name> itkDataImageVectorUChar3;
