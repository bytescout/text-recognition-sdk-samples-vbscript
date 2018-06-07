'*******************************************************************************************'
'                                                                                           '
' Download Free Evaluation Version From:     https://bytescout.com/download/web-installer   '
'                                                                                           '
' Also available as Web API! Free Trial Sign Up: https://secure.bytescout.com/users/sign_up '
'                                                                                           '
' Copyright © 2017-2018 ByteScout Inc. All rights reserved.                                 '
' http://www.bytescout.com                                                                  '
'                                                                                           '
'*******************************************************************************************'


' Create and activate TextRecognizer object
Set textRecognizer = CreateObject("ByteScout.TextRecognition.TextRecognizer")
textRecognizer.RegistrationName = "demo"
textRecognizer.RegistrationKey = "demo"

inputDocument = "..\..\bad-quality.png"
outputDocument = "result.txt"

' Load document (image or PDF)
textRecognizer.LoadDocument(inputDocument)

' Set the location of "tessdata" folder containing language data files
textRecognizer.OCRLanguageDataFolder = "c:\Program Files\ByteScout Text Recognition SDK\tessdata"
			
' Set OCR language.
' "eng" for english, "deu" for German, "fra" for French, "spa" for Spanish etc - according to files in "tessdata" folder.
' Find more language files at https://github.com/tesseract-ocr/tessdata/tree/3.04.00
textRecognizer.OCRLanguage = "eng"


' Add error corrections that will be applied after the recognition.
textRecognizer.Corrections.Add "Tut ", "Test "
textRecognizer.Corrections.Add "Recog\w{1,}on", "Recognition", True


' Recognize text from all pages and save it to file
textRecognizer.SaveText(outputDocument)

WScript.Echo "Extracted text saved to " + outputDocument

Set recognizer = Nothing

