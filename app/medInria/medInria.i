#ifndef MEDCORE_I
#define MEDCORE_I

%module medinria
%include "carrays.i"
%array_class(double, doubleArray);
%{

#include <QtDebug>
#include <QtCore>

#include "gui/toolboxes/medBrowserPacsHostToolBox.h"
#include "gui/toolboxes/medRegistrationAbstractToolBox.h"
#include "gui/toolboxes/medActionsToolBox.h"
#include "gui/toolboxes/medBrowserPacsSearchToolBox.h"
#include "gui/toolboxes/medSegmentationAbstractToolBox.h"
#include "gui/toolboxes/medToolBoxBody.h"
#include "gui/toolboxes/medToolBoxHeader.h"
#include "gui/toolboxes/medToolBox.h"
#include "gui/toolboxes/medCompositeDataSetImporterSelectorToolBox.h"
#include "gui/toolboxes/medFilteringAbstractToolBox.h"
#include "gui/toolboxes/medRegistrationSelectorToolBox.h"
#include "gui/toolboxes/medBrowserPacsNodesToolBox.h"
#include "gui/toolboxes/medDiffusionAbstractToolBox.h"
#include "gui/toolboxes/medSegmentationSelectorToolBox.h"
#include "gui/toolboxes/medToolBoxTab.h"
#include "gui/toolboxes/medDiffusionSelectorToolBox.h"
#include "gui/toolboxes/medFilteringSelectorToolBox.h"
#include "gui/toolboxes/medCompositeDataSetImporterAbstractToolBox.h"
#include "gui/medAbstractWorkspace.h"
#include "gui/lookUpTables/medClutEditor.h"
#include "gui/lookUpTables/medSaveLUTDialog.h"
#include "gui/lookUpTables/medXMLToLUTReader.h"
#include "gui/lookUpTables/medLUTToXMLWriter.h"
#include "gui/lookUpTables/medLoadLUTDialog.h"
#include "gui/medToolBoxContainer.h"
#include "gui/tests/medViewContainersTest.h"
#include "gui/tests/medViewContainerSplitterTest.h"
#include "gui/commonWidgets/medSliderSpinboxPair.h"
#include "gui/commonWidgets/medGroupBox.h"
#include "gui/commonWidgets/medButton.h"
#include "gui/commonWidgets/medStatusBar.h"
#include "gui/commonWidgets/medQuickAccessMenu.h"
#include "gui/commonWidgets/medDropSite.h"
#include "gui/commonWidgets/medHomepageButton.h"
#include "gui/commonWidgets/medListWidget.h"
#include "gui/commonWidgets/medProgressionStack.h"
#include "gui/medLayoutChooser.h"
#include "gui/viewContainers/medViewContainer.h"
#include "gui/viewContainers/medViewContainerSplitter.h"
#include "gui/viewContainers/medViewContainerManager.h"
#include "gui/factories/medToolBoxFactory.h"
#include "gui/factories/medWorkspaceFactory.h"
#include "gui/factories/medSettingsWidgetFactory.h"
#include "gui/medTabbedViewContainers.h"
#include "gui/medPacsSelector.h"
#include "gui/database/medDatabaseView.h"
#include "gui/database/medDatabaseCompactWidget.h"
#include "gui/database/medDatabasePreview.h"
#include "gui/database/medDatabaseEditItemDialog.h"
#include "gui/database/medDatabaseSearchPanel.h"
#include "gui/settingsWidgets/medSettingsEditor.h"
#include "gui/settingsWidgets/medDatabaseSettingsWidget.h"
#include "gui/settingsWidgets/medSettingsWidget.h"
#include "gui/settingsWidgets/medStartupSettingsWidget.h"
#include "gui/medLinkMenu.h"
#include "medSettingsManager.h"
#include "process/medAbstractDiffusionProcess.h"
#include "process/medRunnableProcess.h"
#include "process/medAbstractRegistrationProcess.h"
#include "process/medAbstractProcess.h"
#include "medGlobalDefs.h"
#include "tests/medQSSParserTest.h"
#include "tests/medDataManagerTest.h"
#include "medCoreExport.h"
#include "medAbstractDataSourceFactory.h"
#include "medViewEventFilter.h"
#include "medStyleSheetParser.h"
#include "medAbstractDataSource.h"
#include "medMessageController.h"
#include "views/medViewFactory.h"
#include "views/interactors/medAbstractLayeredViewInteractor.h"
#include "views/interactors/medAbstractImageViewInteractor.h"
#include "views/interactors/medAbstractViewInteractor.h"
#include "views/interactors/medAbstractInteractor.h"
#include "views/medAbstractLayeredView.h"
#include "views/navigators/medAbstractViewNavigator.h"
#include "views/navigators/medAbstractNavigator.h"
#include "views/navigators/medAbstractLayeredViewNavigator.h"
#include "views/navigators/medAbstractImageViewNavigator.h"
#include "views/medImageViewEnum.h"
#include "views/medAbstractImageView.h"
#include "views/medAbstractView.h"
#include "database/medAbstractDbController.h"
#include "database/medDatabaseNonPersistentController.h"
#include "database/medDatabaseModel.h"
#include "database/medDatabaseItem.h"
#include "database/medDatabaseImporter.h"
#include "database/medDatabaseNonPersistentItem.h"
#include "database/medDatabaseNonPersistentImporter.h"
#include "database/medDataManager.h"
#include "database/medDatabaseReader.h"
#include "database/medDatabaseController.h"
#include "database/medStorage.h"
#include "database/medDatabaseExporter.h"
#include "database/medAbstractDatabaseImporter.h"
#include "database/medDataIndex.h"
#include "database/medAbstractDatabaseItem.h"
#include "database/medDatabaseNonPersistentItem_p.h"
#include "database/medDatabaseRemover.h"
#include "database/medDatabaseProxyModel.h"
#include "medPluginManager.h"
#include "medJobItem.h"
#include "data/medAbstractMeshData.h"
#include "data/medAbstractTypedDiffusionModelImageData.h"
#include "data/medMetaDataKeys.h"
#include "data/medAbstractData.h"
#include "data/medAbstractTypedImageData.h"
#include "data/medDataReaderWriter.h"
#include "data/medAbstractFibersData.h"
#include "data/medAbstractMaskData.h"
#include "data/medAbstractDataFactory.h"
#include "data/medAbstractImageData.h"
#include "data/annotationData/medSeedPointAnnotationData.h"
#include "data/annotationData/medAnnotationData.h"
#include "data/annotationData/medImageMaskAnnotationData.h"
#include "data/medAttachedData.h"
#include "data/medAbstractDiffusionModelImageData.h"
#include "parameters/medAbstractParameter.h"
#include "parameters/tests/medBoolGroupParameterTest.h"
#include "parameters/tests/medBoolParameterTest.h"
#include "parameters/tests/medTriggerParameterTest.h"
#include "parameters/tests/medStringListParameterTest.h"
#include "parameters/tests/medAbstractParameterTest.h"
#include "parameters/tests/enCours/medIntParameterTest.h"
#include "parameters/tests/enCours/medDoubleParameterTest.h"
#include "parameters/tests/enCours/medParameterPoolTest.h"
#include "parameters/medVector3DParameter.h"
#include "parameters/medVector2DParameter.h"
#include "parameters/medViewParameterGroup.h"
#include "parameters/medLayerParameterGroup.h"
#include "parameters/medTimeLineParameter.h"
#include "parameters/medBoolGroupParameter.h"
#include "parameters/medPoolIndicator.h"
#include "parameters/medDoubleParameter.h"
#include "parameters/medTriggerParameter.h"
#include "parameters/medParameterPoolManager.h"
#include "parameters/medParameterGroupManager.h"
#include "parameters/medBoolParameter.h"
#include "parameters/medStringListParameter.h"
#include "parameters/medCompositeParameter.h"
#include "parameters/medAbstractParameterGroup.h"
#include "parameters/medDataListParameter.h"
#include "parameters/medParameterPool.h"
#include "parameters/medIntParameter.h"
#include "medJobManager.h"


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

// /////////////////////////////////////////////////////////////////
// Ignore rules for operators
// /////////////////////////////////////////////////////////////////

%ignore operator>>;
%ignore operator<<;
%ignore operator==;
%ignore operator[];
%ignore operator!=;
%ignore operator*=;
%ignore operator/=;
%ignore operator bool;
%ignore operator int;
%ignore operator float;
%ignore operator double;
%ignore operator double *;


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

%include "gui/toolboxes/medBrowserPacsHostToolBox.h"
%include "gui/toolboxes/medRegistrationAbstractToolBox.h"
%include "gui/toolboxes/medActionsToolBox.h"
%include "gui/toolboxes/medBrowserPacsSearchToolBox.h"
%include "gui/toolboxes/medSegmentationAbstractToolBox.h"
%include "gui/toolboxes/medToolBoxBody.h"
%include "gui/toolboxes/medToolBoxHeader.h"
%include "gui/toolboxes/medToolBox.h"
%include "gui/toolboxes/medCompositeDataSetImporterSelectorToolBox.h"
%include "gui/toolboxes/medFilteringAbstractToolBox.h"
%include "gui/toolboxes/medRegistrationSelectorToolBox.h"
%include "gui/toolboxes/medBrowserPacsNodesToolBox.h"
%include "gui/toolboxes/medDiffusionAbstractToolBox.h"
%include "gui/toolboxes/medSegmentationSelectorToolBox.h"
%include "gui/toolboxes/medToolBoxTab.h"
%include "gui/toolboxes/medDiffusionSelectorToolBox.h"
%include "gui/toolboxes/medFilteringSelectorToolBox.h"
%include "gui/toolboxes/medCompositeDataSetImporterAbstractToolBox.h"
%include "gui/medAbstractWorkspace.h"
%include "gui/lookUpTables/medClutEditor.h"
%include "gui/lookUpTables/medSaveLUTDialog.h"
%include "gui/lookUpTables/medXMLToLUTReader.h"
%include "gui/lookUpTables/medLUTToXMLWriter.h"
%include "gui/lookUpTables/medLoadLUTDialog.h"
%include "gui/medToolBoxContainer.h"
%include "gui/tests/medViewContainersTest.h"
%include "gui/tests/medViewContainerSplitterTest.h"
%include "gui/commonWidgets/medSliderSpinboxPair.h"
%include "gui/commonWidgets/medGroupBox.h"
%include "gui/commonWidgets/medButton.h"
%include "gui/commonWidgets/medStatusBar.h"
%include "gui/commonWidgets/medQuickAccessMenu.h"
%include "gui/commonWidgets/medDropSite.h"
%include "gui/commonWidgets/medHomepageButton.h"
%include "gui/commonWidgets/medListWidget.h"
%include "gui/commonWidgets/medProgressionStack.h"
%include "gui/medLayoutChooser.h"
%include "gui/viewContainers/medViewContainer.h"
%include "gui/viewContainers/medViewContainerSplitter.h"
%include "gui/viewContainers/medViewContainerManager.h"
%include "gui/factories/medToolBoxFactory.h"
%include "gui/factories/medWorkspaceFactory.h"
%include "gui/factories/medSettingsWidgetFactory.h"
%include "gui/medTabbedViewContainers.h"
%include "gui/medPacsSelector.h"
%include "gui/database/medDatabaseView.h"
%include "gui/database/medDatabaseCompactWidget.h"
%include "gui/database/medDatabasePreview.h"
%include "gui/database/medDatabaseEditItemDialog.h"
%include "gui/database/medDatabaseSearchPanel.h"
%include "gui/settingsWidgets/medSettingsEditor.h"
%include "gui/settingsWidgets/medDatabaseSettingsWidget.h"
%include "gui/settingsWidgets/medSettingsWidget.h"
%include "gui/settingsWidgets/medStartupSettingsWidget.h"
%include "gui/medLinkMenu.h"
%include "medSettingsManager.h"
%include "process/medAbstractDiffusionProcess.h"
%include "process/medRunnableProcess.h"
%include "process/medAbstractRegistrationProcess.h"
%include "process/medAbstractProcess.h"
%include "medGlobalDefs.h"
%include "tests/medQSSParserTest.h"
%include "tests/medDataManagerTest.h"
%include "medCoreExport.h"
%include "medAbstractDataSourceFactory.h"
%include "medViewEventFilter.h"
%include "medStyleSheetParser.h"
%include "medAbstractDataSource.h"
%include "medMessageController.h"
%include "views/medViewFactory.h"
%include "views/interactors/medAbstractLayeredViewInteractor.h"
%include "views/interactors/medAbstractImageViewInteractor.h"
%include "views/interactors/medAbstractViewInteractor.h"
%include "views/interactors/medAbstractInteractor.h"
%include "views/medAbstractLayeredView.h"
%include "views/navigators/medAbstractViewNavigator.h"
%include "views/navigators/medAbstractNavigator.h"
%include "views/navigators/medAbstractLayeredViewNavigator.h"
%include "views/navigators/medAbstractImageViewNavigator.h"
%include "views/medImageViewEnum.h"
%include "views/medAbstractImageView.h"
%include "views/medAbstractView.h"
%include "database/medAbstractDbController.h"
%include "database/medDatabaseNonPersistentController.h"
%include "database/medDatabaseModel.h"
%include "database/medDatabaseItem.h"
%include "database/medDatabaseImporter.h"
%include "database/medDatabaseNonPersistentItem.h"
%include "database/medDatabaseNonPersistentImporter.h"
%include "database/medDataManager.h"
%include "database/medDatabaseReader.h"
%include "database/medDatabaseController.h"
%include "database/medStorage.h"
%include "database/medDatabaseExporter.h"
%include "database/medAbstractDatabaseImporter.h"
%include "database/medDataIndex.h"
%include "database/medAbstractDatabaseItem.h"
%include "database/medDatabaseNonPersistentItem_p.h"
%include "database/medDatabaseRemover.h"
%include "database/medDatabaseProxyModel.h"
%include "medPluginManager.h"
%include "medJobItem.h"
%include "data/medAbstractMeshData.h"
%include "data/medAbstractTypedDiffusionModelImageData.h"
%include "data/medMetaDataKeys.h"
%include "data/medAbstractData.h"
%include "data/medAbstractTypedImageData.h"
%include "data/medDataReaderWriter.h"
%include "data/medAbstractFibersData.h"
%include "data/medAbstractMaskData.h"
%include "data/medAbstractDataFactory.h"
%include "data/medAbstractImageData.h"
%include "data/annotationData/medSeedPointAnnotationData.h"
%include "data/annotationData/medAnnotationData.h"
%include "data/annotationData/medImageMaskAnnotationData.h"
%include "data/medAttachedData.h"
%include "data/medAbstractDiffusionModelImageData.h"
%include "parameters/medAbstractParameter.h"
%include "parameters/tests/medBoolGroupParameterTest.h"
%include "parameters/tests/medBoolParameterTest.h"
%include "parameters/tests/medTriggerParameterTest.h"
%include "parameters/tests/medStringListParameterTest.h"
%include "parameters/tests/medAbstractParameterTest.h"
%include "parameters/tests/enCours/medIntParameterTest.h"
%include "parameters/tests/enCours/medDoubleParameterTest.h"
%include "parameters/tests/enCours/medParameterPoolTest.h"
%include "parameters/medVector3DParameter.h"
%include "parameters/medVector2DParameter.h"
%include "parameters/medViewParameterGroup.h"
%include "parameters/medLayerParameterGroup.h"
%include "parameters/medTimeLineParameter.h"
%include "parameters/medBoolGroupParameter.h"
%include "parameters/medPoolIndicator.h"
%include "parameters/medDoubleParameter.h"
%include "parameters/medTriggerParameter.h"
%include "parameters/medParameterPoolManager.h"
%include "parameters/medParameterGroupManager.h"
%include "parameters/medBoolParameter.h"
%include "parameters/medStringListParameter.h"
%include "parameters/medCompositeParameter.h"
%include "parameters/medAbstractParameterGroup.h"
%include "parameters/medDataListParameter.h"
%include "parameters/medParameterPool.h"
%include "parameters/medIntParameter.h"
%include "medJobManager.h"

#endif
#endif
