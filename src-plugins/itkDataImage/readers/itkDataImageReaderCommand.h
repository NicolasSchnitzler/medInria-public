/*=========================================================================

 medInria

 Copyright (c) INRIA 2013 - 2014. All rights reserved.
 See LICENSE.txt for details.
 
  This software is distributed WITHOUT ANY WARRANTY; without even
  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
  PURPOSE.

=========================================================================*/

#include <itkCommand.h>

class dtkAbstractDataReader;

namespace itk {

  class DataImageReaderCommand: public itk::Command {
  public:

    typedef DataImageReaderCommand         Self;
    typedef itk::Command                        Superclass;
    typedef itk::SmartPointer<Self>        Pointer;
    typedef itk::SmartPointer<const Self>  ConstPointer;
    
    itkTypeMacro( DataImageReaderCommand, itk::Command );
    itkNewMacro (Self);
    
    void Execute(itk::Object *caller, const itk::EventObject &event);
    void Execute(const itk::Object *caller, const itk::EventObject &event);
    
    void SetDataImageReader (dtkAbstractDataReader* reader)
    { m_Reader = reader; }

  protected:
    DataImageReaderCommand(){ m_Reader = 0; };
    virtual ~DataImageReaderCommand(){};
    
  private:
    dtkAbstractDataReader* m_Reader;
  };
}
