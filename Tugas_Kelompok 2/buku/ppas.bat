@echo off
SET THEFILE=e:\tugas\pralpro\pascal\buku\data_b~1.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  E:\Tugas\PRALPRO\Pascal\buku\rsrc.o -s   -b base.$$$ -o e:\tugas\pralpro\pascal\buku\data_b~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
