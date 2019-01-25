@echo off
SET WIX_DIR=
SET SCRIPT_PATH=
SET SCRIPT_NAME=OIV_AppData
SET MSI_NAME=OIV_AppData

"%WIX_DIR%\candle.exe" -nologo "%SCRIPT_PATH%\%SCRIPT_NAME%.wxs" -out "%SCRIPT_PATH%\%SCRIPT_NAME%.wixobj"  -ext WixUIExtension
"%WIX_DIR%\light.exe" -nologo "%SCRIPT_PATH%\%SCRIPT_NAME%.wixobj" -out "%SCRIPT_PATH%\%MSI_NAME%.msi"  -ext WixUIExtension