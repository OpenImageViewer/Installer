@echo off
echo.
echo ---------------------------------------------
echo ^| Open image viewer NSIS installer compiler ^| 
echo ---------------------------------------------
IF "%4"=="" goto BAD_PARAM

set NSISPath=%1
set OutputFolder=%2
set DevFolder=%3
set BuildFolder=%4
set OutputProgramPath=%OutputFolder%\program
set OutputInstallerPath=%OutputFolder%\installer
set IconsPath="%DevFolder%\OIViewer"


rem  copy program
xcopy /Y /D /S /I %BuildFolder%\Resources %OutputProgramPath%\Resources
xcopy /Y /D %BuildFolder%\OIViewer.exe %OutputProgramPath%
xcopy /Y /D %BuildFolder%\oiv.dll %OutputProgramPath%
xcopy /Y /D %BuildFolder%\turbojpeg.dll.dll %OutputProgramPath%
xcopy /Y /D %BuildFolder%\libpng16.dll %OutputProgramPath%
xcopy /Y /D %BuildFolder%\FreeImage.dll %OutputProgramPath%

rem copy i cons
xcopy /Y /D /I  "%IconsPath%\oivIcon.ico" %OutputInstallerPath%\

rem copy license
xcopy /Y /D /I License.rtf %OutputInstallerPath%

rem copy installer script
xcopy /Y /D /I oivNsisSCript.nsi %OutputInstallerPath%

rem Create install package
%NSISPath% "%OutputInstallerPath%\oivNsisSCript.nsi"
goto END

:BAD_PARAM
echo.
type Readme.txt
echo.
echo.

:END

