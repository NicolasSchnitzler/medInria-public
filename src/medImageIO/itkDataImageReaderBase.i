 %module itkDataImagePlugin
 %{
 /* Includes the header in the wrapper code */
 #include "itkDataImageReaderBase"
 %}
 
 /* Parse the header file to generate wrappers */
 %include "itkDataImageReaderBase"
