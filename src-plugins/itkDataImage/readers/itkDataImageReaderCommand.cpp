/*=========================================================================

 medInria

 Copyright (c) INRIA 2013 - 2014. All rights reserved.
 See LICENSE.txt for details.
 
  This software is distributed WITHOUT ANY WARRANTY; without even
  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
  PURPOSE.

=========================================================================*/

#include <cstddef> // For ITK 3.20 that does not define correctly ptrdiff_t

#include <itkDataImageReaderCommand.h>

#include <itkImageIOBase.h>

#include <dtkCore/dtkAbstractDataReader.h>

namespace itk
{
    void DataImageReaderCommand::Execute (itk::Object *caller, const itk::EventObject &event)
    {
        itk::ImageIOBase *po = dynamic_cast<itk::ImageIOBase *>(caller);

        if (!po)
            return;
        
        if(typeid(event) == typeid(itk::ProgressEvent))
        {
            if (m_Reader)
                m_Reader->setProgress((int)(po->GetProgress()*100.0));
        }
    }
        
    void DataImageReaderCommand::Execute (const itk::Object *caller, const itk::EventObject &event)
    {
        itk::ImageIOBase *po = dynamic_cast<itk::ImageIOBase *>(const_cast<itk::Object *>(caller) );
        if (! po)
            return;
        
        if( typeid(event) == typeid ( itk::ProgressEvent  )  )
        {
            if (m_Reader)
                m_Reader->setProgress ( (int)(po->GetProgress()*100.0) );
        }
    }
}
