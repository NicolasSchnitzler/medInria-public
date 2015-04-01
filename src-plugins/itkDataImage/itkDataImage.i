#ifndef ITKDATAIMAGEPLUGIN_I
#define ITKDATAIMAGEPLUGIN_I

%module itkDataImage
%import "../../../../dtk/src/dtkCore/dtkCore.i"
%include "carrays.i"
%array_class(double, doubleArray);

#undef Q_OBJECT
#undef signals
#undef slots

#define Q_OBJECT
#define signals public
#define slots

%{
#include <QtDebug>
#include <QtCore>
#include <itkObject.h>
#include "../../../../dtk/src/dtkCore/dtkAbstractData.h"
#include "../../../../dtk/src/dtkCore/dtkAbstractProcess.h"
#include "../../../../dtk/src/dtkCore/dtkPluginManager.h"
#include "../../../src/medCore/data/medAbstractData.h"
#include "../../../src/medCore/database/medDataIndex.h"
#include "../../../src/medCore/data/medAbstractImageData.h"
#include "../../../src/medImageIO/itkDataImageReaderBase.h"
#include "../../../src/medCore/data/medAbstractTypedImageData.h"
#include "../../../../dtk/src/dtkCore/dtkAbstractDataReader.h"
#undef MED_DATA_INTERFACE_NO_MOC
#define MED_DATA_INTERFACE_NO_MOC(A, B)

#include "interactors/medVtkViewItkDataImageInteractor.h"
#include "interactors/medVtkViewItkDataImage4DInteractor.h"
#include "interactors/medVtkViewItkVectorFieldInteractor.h"
#include "itkDataImagePluginExport.h"
#include "navigators/medVtkViewItkDataImageNavigator.h"
#include "readers/itkGDCMDataImageReader.h"
#include "readers/itkNiftiDataImageReader.h"
#include "readers/itkPhilipsRECDataImageReader.h"
#include "readers/itkNrrdDataImageReader.h"
#include "readers/itkGISDataImageReader.h"
#include "readers/itkJPEGDataImageReader.h"
#include "readers/itkMetaDataImageReader.h"
#include "readers/itkTIFFDataImageReader.h"
#include "readers/itkDataImageReaderCommand.h"
#include "readers/itkVTKDataImageReader.h"
#include "readers/itkPNGDataImageReader.h"
#include "readers/itkGiplDataImageReader.h"
#include "readers/itkDCMTKDataImageReader.h"
#include "readers/itkBMPDataImageReader.h"
#include "writers/itkGiplDataImageWriter.h"
#include "writers/itkVTKDataImageWriter.h"
#include "writers/itkNiftiDataImageWriter.h"
#include "writers/itkMetaDataImageWriter.h"
#include "writers/itkGISDataImageWriter.h"
#include "writers/itkNrrdDataImageWriter.h"
#include "itkDataImagePlugin.h"
#include "datas/itkDataImage.h"

#include "datas/itkDataImageUChar3.h"
#include "datas/itkDataImageVectorUChar3.h"
#include "datas/itkDataImageDouble3.h"
#include "datas/itkDataImageUInt3.h"
#include "datas/itkDataImageInt4.h"
#include "datas/itkDataImageShort3.h"
#include "datas/itkDataImageDouble4.h"
#include "datas/itkDataImageFloat4.h"
#include "datas/itkDataImageVectorFloat3.h"
//#include "datas/itkDataImageRGBA3.h"
#include "datas/itkDataImageUChar4.h"
#include "datas/itkDataImageFloat3.h"
#include "datas/itkDataImageUInt4.h"
#include "datas/itkDataImageShort4.h"
#include "datas/itkDataImageUShort4.h"
#include "datas/itkDataImageULong3.h"
#include "datas/itkDataImageInt3.h"
#include "datas/itkDataImageLong3.h"
#include "datas/itkDataImageUShort3.h"
#include "datas/itkDataImageVectorDouble3.h"
//#include "datas/itkDataImageRGB3.h"
#include "datas/itkDataImageChar4.h"
#include "datas/itkDataImageChar3.h"
#include "datas/itkDataImageLong4.h"
#include "datas/itkDataImageULong4.h"

#include <string>
%}
// /////////////////////////////////////////////////////////////////
// Preprocessing setup
// /////////////////////////////////////////////////////////////////

#pragma SWIG nowarn=389, 401, 509, 801, 472, 362, 503, 516, 842, 845

// /////////////////////////////////////////////////////////////////
// Macro undefinition
// /////////////////////////////////////////////////////////////////

#undef Q_OBJECT
#undef signals
#undef slots

#define Q_OBJECT
#define signals public
#define slots

#undef  Q_PROPERTY(Type type MODE mode)
#define Q_PROPERTY(Type type MODE mode)

#undef  Q_DECLARE_INTERFACE(IFace, IId)
#define Q_DECLARE_INTERFACE(IFace, IId)

#undef  Q_DECLARE_METATYPE(Type type)
#define Q_DECLARE_METATYPE(Type type)

#undef  DTKCORE_EXPORT
#define DTKCORE_EXPORT

#undef  DTK_DEPRECATED
#define DTK_DEPRECATED

#undef ITKDATAIMAGEPLUGIN_EXPORT
#define ITKDATAIMAGEPLUGIN_EXPORT

#undef MEDIMAGEIO_EXPORT
#define MEDIMAGEIO_EXPORT

#undef MEDCORE_EXPORT
#define MEDCORE_EXPORT

#undef Q_INTERFACES
#define Q_INTERFACES(A)

#undef MED_DATA_INTERFACE_NO_MOC
#define MED_DATA_INTERFACE_NO_MOC(A, B)

%ignore attachedDataAdded( medAttachedData * );
%ignore attachedDataRemoved( medAttachedData * );
%ignore dataModified(medAbstractData *);


// /////////////////////////////////////////////////////////////////
// Wrapper input
// /////////////////////////////////////////////////////////////////
%include "datas/itkDataImage.h"
%include "interactors/medVtkViewItkDataImageInteractor.h"
%include "interactors/medVtkViewItkDataImage4DInteractor.h"
%include "interactors/medVtkViewItkVectorFieldInteractor.h"
//%include "itkDataImagePluginExport.h"
%include "navigators/medVtkViewItkDataImageNavigator.h"
%include "readers/itkGDCMDataImageReader.h"
%include "readers/itkNiftiDataImageReader.h"
%include "readers/itkPhilipsRECDataImageReader.h"
%include "readers/itkNrrdDataImageReader.h"
%include "readers/itkGISDataImageReader.h"
%include "readers/itkJPEGDataImageReader.h"
%include "readers/itkMetaDataImageReader.h"
%include "readers/itkTIFFDataImageReader.h"
//%include "readers/itkDataImageReaderCommand.h"
%include "readers/itkVTKDataImageReader.h"
%include "readers/itkPNGDataImageReader.h"
%include "readers/itkGiplDataImageReader.h"
//%include "readers/itkDCMTKDataImageReader.h"
%include "readers/itkBMPDataImageReader.h"
%include "writers/itkGiplDataImageWriter.h"
%include "writers/itkVTKDataImageWriter.h"
%include "writers/itkNiftiDataImageWriter.h"
%include "writers/itkMetaDataImageWriter.h"
%include "writers/itkGISDataImageWriter.h"
%include "writers/itkNrrdDataImageWriter.h"
%include "itkDataImagePlugin.h"
%include "datas/itkDataImageUChar3.h"
%include "datas/itkDataImageVectorUChar3.h"
%include "datas/itkDataImageDouble3.h"
%include "datas/itkDataImageUInt3.h"
%include "datas/itkDataImageInt4.h"
%include "datas/itkDataImageShort3.h"
%include "datas/itkDataImageDouble4.h"
%include "datas/itkDataImageFloat4.h"
%include "datas/itkDataImageVectorFloat3.h"
//%include "datas/itkDataImageRGBA3.h"
%include "datas/itkDataImageUChar4.h"
%include "datas/itkDataImageFloat3.h"
%include "datas/itkDataImageUInt4.h"
%include "datas/itkDataImageShort4.h"
%include "datas/itkDataImageUShort4.h"
%include "datas/itkDataImageULong3.h"
%include "datas/itkDataImageInt3.h"
%include "datas/itkDataImageLong3.h"
%include "datas/itkDataImageUShort3.h"
%include "datas/itkDataImageVectorDouble3.h"
//%include "datas/itkDataImageRGB3.h"
%include "datas/itkDataImageChar4.h"
%include "datas/itkDataImageChar3.h"
%include "datas/itkDataImageLong4.h"
%include "datas/itkDataImageULong4.h"
#undef  MED_DATA_INTERFACE_NO_MOC


//%include "../../../../dtk/src/dtkCore/dtkAbstractData.h"
%include "../../../src/medCore/data/medAbstractData.h"
//#define MED_DATA_INTERFACE_NO_MOC(A, B)
%include "../../../src/medCore/data/medAbstractImageData.h"
%include "../../../src/medImageIO/itkDataImageReaderBase.h"
%include "../../../src/medCore/data/medAbstractTypedImageData.h"
//%include "../../../../dtk/src/dtkCore/dtkAbstractDataReader.h"

// /////////////////////////////////////////////////////////////////
// Typemaps
// /////////////////////////////////////////////////////////////////

#ifdef SWIGPYTHON

%typecheck(SWIG_TYPECHECK_STRING) char * {
  $1 = PyString_Check($input) ? 1 : 0;
}

%typemap(typecheck)       QString  = char *;
%typemap(typecheck) const QString& = char *;

// Python -> C++

%typemap(in) QString {
    if (PyString_Check($input)) {
         $1 = QString(PyString_AsString($input));
     } else {
         qDebug("QString expected");
     }
}

%typemap(in) const QString& {
    if (PyString_Check($input)) {
         char *t = PyString_AsString($input);
         $1 = new QString(t);
     } else {
         qDebug("QString expected");
     }
}

%typemap(in) QStringList {
    if (PyList_Check($input)) {
        int i = 0;
        int end = PyList_Size($input);
        for(i;i!=end; ++i) {
            $1 << QString(PyString_AsString(PyList_GET_ITEM($input, i)));
            }
        }
    else {
        qDebug("QStringList expected");
    }
}

%typemap(in) const QStringList& {
    if (PyList_Check($input)) {
        int i = 0;
        int end = PyList_Size($input);
        $1 = new QStringList;
        for(i;i!=end; ++i) {
            char *t = PyString_AsString(PyList_GET_ITEM($input, i));
            (*$1) << QString(t);
            }
        }
    else {
        qDebug("QStringList expected");
    }
}


// C++ -> Python

%typemap(out) QString {
    $result = PyString_FromString($1.toAscii().constData());
}

%typemap(out) const QString& {
    $result = PyString_FromString($1.toAscii().constData());
}

%define %QList_typemapsPtr(DATA_TYPE)

%typemap(out) QList<DATA_TYPE> {
  $result = PyList_New($1.size());
  int i = 0;
  QList<DATA_TYPE>::iterator it = $1.begin();
  QList<DATA_TYPE>::iterator end = $1.end();
  for(;it!=end; ++it, ++i)  {
    PyObject* obj = SWIG_NewPointerObj((*it), $descriptor(DATA_TYPE), 0|0);
    PyList_SET_ITEM($result, i, obj);
  }
}

%enddef // %QList_typemapsPtr()

%QList_typemapsPtr(dtkPlugin *)

%define %QList_typemaps(DATA_TYPE)

%typemap(out) QList<DATA_TYPE> {
  $result = PyList_New($1.size());
  int i = 0;
  QList<DATA_TYPE>::iterator it = $1.begin();
  QList<DATA_TYPE>::iterator end = $1.end();
  for(;it!=end; ++it, ++i)  {
    DATA_TYPE *newItem = new DATA_TYPE(*it);
    PyObject* obj = SWIG_NewPointerObj(newItem, $descriptor(DATA_TYPE*), 0|0);
    PyList_SET_ITEM($result, i, obj);
  }
}

%enddef // %QList_typemaps()

%typemap(out) QStringList {
    $result = PyList_New($1.size());
    int i = 0;
    QStringList::iterator it = $1.begin();
    QStringList::iterator end = $1.end();
    for(;it!=end; ++it, ++i) {
        PyObject* st = PyString_FromString((*it).toAscii().constData());
        PyList_SET_ITEM($result, i, st);
  }
}

%typemap(out) QList<QString> {
    $result = PyList_New($1.size());
    int i = 0;
    QStringList::iterator it = $1.begin();
    QStringList::iterator end = $1.end();
    for(;it!=end; ++it, ++i) {
        PyObject* st = PyString_FromString((*it).toAscii().constData());
        PyList_SET_ITEM($result, i, st);
  }
}

template <class T1, class T2>
class QPair
{
public:
    T1 first;
    T2 second;
};

%define %QPair_typemaps(DATA_TYPE_1, DATA_TYPE_2)

%typemap(out) QPair<DATA_TYPE_1, DATA_TYPE_2> {
  $result = PyTuple_New(2);
  PyObject* obj1 = SWIG_NewPointerObj(*$1.first, $descriptor(DATA_TYPE_1), 0|0);
  PyObject* obj2 = SWIG_NewPointerObj(*$1.second, $descriptor(DATA_TYPE_2), 0|0);
  PyTuple_SET_ITEM($result, 0, obj1);
  PyTuple_SET_ITEM($result, 1, obj2);
}

%enddef // %QPair_typemaps()

%template(QPairStrStrList) QPair<QString, QStringList>;

%template(medAbstractTypedImageDataUChar3)          medAbstractTypedImageData<	3	,	unsigned char	>;
%template(medAbstractTypedImageDataVectorUChar3)	medAbstractTypedImageData<	3	,	itk::Vector<unsigned char,3>	>;
//%template(medAbstractTypedImageDataDouble3)         medAbstractTypedImageData<	3	,	double >;
%template(medAbstractTypedImageDataUInt3)			medAbstractTypedImageData<	3	,	unsigned Int 	>;
%template(medAbstractTypedImageDataInt4)			medAbstractTypedImageData<	4	,	int 	>;
%template(medAbstractTypedImageDataShort3)          medAbstractTypedImageData<	3	,	short 	>;
%template(medAbstractTypedImageDataDouble4)         medAbstractTypedImageData<	4	,	double 	>;
%template(medAbstractTypedImageDataFloat4)          medAbstractTypedImageData<	4	,	float 	>;
%template(medAbstractTypedImageDataVectorFloat3)	medAbstractTypedImageData<	3	,	itk::Vector<float,3>	>;
//%template(medAbstractTypedImageDataRGBA3)			medAbstractTypedImageData<	3	,	RGBA 	,medAbstractTypedImageDataRGBA3Name>;
%template(medAbstractTypedImageDataUChar4)          medAbstractTypedImageData<	4	,	unsigned char 	>;
%template(medAbstractTypedImageDataFloat3)          medAbstractTypedImageData<	3	,	float 	>;
%template(medAbstractTypedImageDataUInt4)			medAbstractTypedImageData<	4	,	unsigned Int >;
%template(medAbstractTypedImageDataShort4)          medAbstractTypedImageData<	4	,	short 	>;
%template(medAbstractTypedImageDataUShort4)         medAbstractTypedImageData<	4	,	unsigned Short 	>;
%template(medAbstractTypedImageDataULong3)          medAbstractTypedImageData<	3	,	unsigned Long >;
%template(medAbstractTypedImageDataInt3)			medAbstractTypedImageData<	3	,	int 	>;
%template(medAbstractTypedImageDataLong3)			medAbstractTypedImageData<	3	,	long >;
%template(medAbstractTypedImageDataUShort3)         medAbstractTypedImageData<	3	,	unsigned Short 	>;
%template(medAbstractTypedImageDataVectorDouble3)	medAbstractTypedImageData<	3	,	itk::Vector<double,3> 	>;
//%template(medAbstractTypedImageDataRGB3)			medAbstractTypedImageData<	3	,	RGB 	>;
%template(medAbstractTypedImageDataChar4)			medAbstractTypedImageData<	3	,	char >;
%template(medAbstractTypedImageDataChar3)			medAbstractTypedImageData<	4	,	char >;
%template(medAbstractTypedImageDataLong4)			medAbstractTypedImageData<	4	,	long 	>;
%template(medAbstractTypedImageDataULong4)          medAbstractTypedImageData<	4	,	unsigned Long >;

%template(medItkDataImageUChar3) 		itkDataImage<	3	,	unsigned char	,	itkDataImageUChar3Name>;
%template(medItkDataImageVectorUChar3)	itkDataImage<	3	,	itk::Vector<unsigned char,3>	,	itkDataImageVectorUChar3Name 	>;
%template(medItkDataImageDouble3)		itkDataImage<	3	,	double 	,	itkDataImageDouble3Name 	>;
%template(medItkDataImageUInt3)			itkDataImage<	3	,	unsigned Int 	,	itkDataImageUInt3Name 	>;
%template(medItkDataImageInt4)			itkDataImage<	4	,	int 	,itkDataImageInt4Name>;
%template(medItkDataImageShort3)		itkDataImage<	3	,	short 	,itkDataImageShort3Name>;
%template(medItkDataImageDouble4)		itkDataImage<	4	,	double 	,itkDataImageDouble4Name>;
%template(medItkDataImageFloat4)		itkDataImage<	4	,	float 	,itkDataImageFloat4Name>;
%template(medItkDataImageVectorFloat3)	itkDataImage<	3	,	itk::Vector<float,3>	,itkDataImageVectorFloat3Name>;
//%template(medItkDataImageRGBA3)			itkDataImage<	3	,	RGBA 	,itkDataImageRGBA3Name>;
%template(medItkDataImageUChar4)		itkDataImage<	4	,	unsigned char 	,itkDataImageUChar4Name>;
%template(medItkDataImageFloat3)		itkDataImage<	3	,	float 	,itkDataImageFloat3Name>;
%template(medItkDataImageUInt4)			itkDataImage<	4	,	unsigned Int 	,itkDataImageUInt4Name>;
%template(medItkDataImageShort4)		itkDataImage<	4	,	short 	,itkDataImageShort4Name>;
%template(medItkDataImageUShort4)		itkDataImage<	4	,	unsigned Short 	,itkDataImageUShort4Name>;
%template(medItkDataImageULong3)		itkDataImage<	3	,	unsigned Long 	,itkDataImageULong3Name>;
%template(medItkDataImageInt3)			itkDataImage<	3	,	int 	,itkDataImageInt3Name>;
%template(medItkDataImageLong3)			itkDataImage<	3	,	long 	,itkDataImageLong3Name>;
%template(medItkDataImageUShort3)		itkDataImage<	3	,	unsigned Short 	,itkDataImageUShort3Name>;
%template(medItkDataImageVectorDouble3)	itkDataImage<	3	,	itk::Vector<double,3> 	,itkDataImageVectorDouble3Name>;
//%template(medItkDataImageRGB3)			itkDataImage<	3	,	RGB 	,itkDataImageRGB3Name>;
%template(medItkDataImageChar4)			itkDataImage<	3	,	char 	,itkDataImageChar4Name>;
%template(medItkDataImageChar3)			itkDataImage<	4	,	char 	,itkDataImageChar3Name>;
%template(medItkDataImageLong4)			itkDataImage<	4	,	long 	,itkDataImageLong4Name>;
%template(medItkDataImageULong4)		itkDataImage<	4	,	unsigned Long 	,itkDataImageULong4Name>;

%extend itkDataImagePlugin
{
	dtkAbstractDataFactory* fact()
	{
		return dtkAbstractDataFactory::instance();
	}
}

%QPair_typemaps(QString, QStringList)

%QList_typemaps(dtkAbstractDataFactory::dtkAbstractDataTypeHandler)

#elif SWIGTCL

// Tcl -> C++

%typemap(in) QString {
    $1 = QString(Tcl_GetString($input));
}

%typemap(in) const QString& {
    char *t = Tcl_GetString($input);
    $1 = new QString(t);
}

// C++ -> Tcl

%typemap(out) QString {
    Tcl_SetStringObj($result, $1.toAscii().constData(), $1.size());
}

%typemap(out) const QString& {
    Tcl_SetStringObj($result, $1.toAscii().constData(), $1.size());
}

#elif SWIGCSHARP

// /////////////////////////////////////////////////////////////////
// 
// /////////////////////////////////////////////////////////////////


// %typemap(typecheck)       QString  = char *;
// %typemap(typecheck) const QString& = char *;

// // C# -> C++

// %typemap(in) QString {
//     QString $1_str((char *)$input);
//     $1 = &$1_str;
// }

// %typemap(in) const QString& {
//     QString $1_str((char *)$input);
//     $1 = &$1_str;
// }

// // C++ -> C#

// %typemap(out) QString {
//     $result = SWIG_csharp_string_callback($1.toAscii().constData());
// }

// %typemap(out) const QString & {
//     $result = SWIG_csharp_string_callback($1.toAscii().constData());
// }

%typemap(ctype) QString "char *"
%typemap(imtype) QString "string"
%typemap(cstype) QString "string"
%typemap(csdirectorin) QString "$iminput"
%typemap(csdirectorout) QString "$cscall"

%typemap(in, canthrow=1) QString 
%{
    if (!$input) {
        SWIG_CSharpSetPendingExceptionArgument(SWIG_CSharpArgumentNullException, "null string", 0);
        return $null;
    }
    $1 = QString($input);
%}

%typemap(out) QString
%{ 
    $result = SWIG_csharp_string_callback($1.toAscii().constData());
%}

%typemap(directorout, canthrow=1) QString 
%{ if (!$input) {
    SWIG_CSharpSetPendingExceptionArgument(SWIG_CSharpArgumentNullException, "null string", 0);
    return $null;
   }
   $result = string($input); %}

%typemap(directorin) QString %{ $input = SWIG_csharp_string_callback($1.toAscii().constData()); %}

%typemap(csin) QString "$csinput"
%typemap(csout, excode=SWIGEXCODE) QString {
    string ret = $imcall;$excode
    return ret;
  }

%typemap(csvarin, excode=SWIGEXCODE2) QString %{
    set {
      $imcall;$excode
    } %}
%typemap(csvarout, excode=SWIGEXCODE2) QString %{
    get {
      string ret = $imcall;$excode
      return ret;
    } %}

%typemap(typecheck) QString = char *;

%typemap(throws, canthrow=1) QString
%{ SWIG_CSharpSetPendingException(SWIG_CSharpApplicationException, $1.c_str());
   return $null; %}


%typemap(ctype) const QString & "char *"
%typemap(imtype) const QString & "string"
%typemap(cstype) const QString & "string"
%typemap(csdirectorin) const QString & "$iminput"
%typemap(csdirectorout) const QString & "$cscall"

%typemap(in, canthrow=1) const QString &
%{ if (!$input) {
    SWIG_CSharpSetPendingExceptionArgument(SWIG_CSharpArgumentNullException, "null string", 0);
    return $null;
   }
   QString $1_str($input);
   $1 = &$1_str; %}
%typemap(out) const QString & %{ $result = SWIG_csharp_string_callback($1->toAscii().constData()); %}

%typemap(csin) const QString & "$csinput"
%typemap(csout, excode=SWIGEXCODE) const QString & {
    string ret = $imcall;$excode
    return ret;
  }

%typemap(directorout, canthrow=1, warning=SWIGWARN_TYPEMAP_THREAD_UNSAFE_MSG) const QString &
%{ if (!$input) {
    SWIG_CSharpSetPendingExceptionArgument(SWIG_CSharpArgumentNullException, "null string", 0);
    return $null;
   }
   /* possible thread/reentrant code problem */
   static string $1_str;
   $1_str = $input;
   $result = &$1_str; %}

%typemap(directorin) const QString & %{ $input = SWIG_csharp_string_callback($1.toAscii().constData()); %}

%typemap(csvarin, excode=SWIGEXCODE2) const QString & %{
    set {
      $imcall;$excode
    } %}
%typemap(csvarout, excode=SWIGEXCODE2) const QString & %{
    get {
      string ret = $imcall;$excode
      return ret;
    } %}

%typemap(typecheck) const QString & = char *;

%typemap(throws, canthrow=1) const QString &
%{ SWIG_CSharpSetPendingException(SWIG_CSharpApplicationException, $1.c_str());
   return $null; %}

#endif



#endif

