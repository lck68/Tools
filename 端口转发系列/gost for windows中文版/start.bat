@echo off

:start
cls
title gostһ��-windows��
echo Gostһ��-windows��-���ű�����Ҫ����ԱȨ��
echo  ˵�˻��棬���������԰棬ͨ���׶�
echo ======================================
echo             �˵� ��ѡ��
echo 1.��Ϊ���ܷ��Ͷˣ�A�ˣ�ͨ��Ϊ�����������������
echo 2.��Ϊ���ܽ��նˣ�B�ˣ�ͨ��Ϊ���ڻ�������������
echo 3.�鿴����gost��������
echo 4.�ر�gost���̣�Kill all��
echo ======================================
echo ���������ѡ��:
set /p xuanze= 
if /i "%xuanze%"=="1" cls&goto start1
if /i "%xuanze%"=="2" cls&goto start2
if /i "%xuanze%"=="3" cls&goto start3
if /i "%xuanze%"=="4" cls&goto start4
goto :start
:start1
cls
echo ���ܷ��Ͷˣ�A�ˣ�
echo ��ѡ��������
echo [1]ws
echo [2]wss
echo [3]h2
echo [4]kcp
echo [5]tcp
set /p lx=
if %lx%==1 set lx=ws
if %lx%==2 set lx=wss
if %lx%==3 set lx=h2
if %lx%==4 set lx=kcp
if %lx%==5 set lx=tcp
echo ������Ҫת�����Ǹ����ӵ�ip������Ǳ�������127.0.0.1��
echo ���磺����-������ת���ձ����ӣ��Ǿ����ձ����ӵ�ip��������漰��ǰ�������������127.0.0.1.
set /p ip=
echo ������Ҫ���ܵı����Ķ˿ڡ�
set /p remoteport=
echo �����һ���˿ڣ����������ʹ�á�
set /p localport=
echo �Ƿ���ʾ�������ڣ�1��0��
set /p ck=
echo �����ɹ������û�����������ֶ�����
echo �������� gost -L relay+%lx%://:%localport%/%ip%:%remoteport%
if %ck%==0 echo CreateObject("WScript.Shell").Run "gost -L relay+%lx%://:%localport%/%ip%:%remoteport%",0 >qidongs.vbs
if %ck%==0 cscript.exe /e:vbscript qidongs.vbs >nul
if %ck%==0 del qidongs.vbs
if %ck%==1 start gost -L relay+%lx%://:%localport%/%ip%:%remoteport%
pause
goto :start

:start2
cls
echo ���ܽ��նˣ�B�ˣ�
echo ��ѡ��������
echo [1]ws
echo [2]wss
echo [3]h2
echo [4]kcp
echo [5]tcp
set /p lx=
if %lx%==1 set lx=ws
if %lx%==2 set lx=wss
if %lx%==3 set lx=h2
if %lx%==4 set lx=kcp
if %lx%==5 set lx=tcp
echo ����ܷ��Ͷ�A�ˡ���ip��
set /p ip=
echo ������ʹ�õĶ˿ڡ��Ժ����A��ʱ�����ñ���ip+����˿ڡ�
set /p localport=
echo ����֮ǰ�ڡ����ܷ��Ͷ�A�ˡ��������Ǹ��˿ڡ�
set /p remoteport=
echo �Ƿ���ʾ�������ڣ�1��0��
set /p ck=
echo �����ɹ������û�����������ֶ�����
echo �������� gost -L udp://:%localport% -L tcp://:%localport% -F relay+%lx%://%ip%:%remoteport%
if %ck%==1 start gost -L udp://:%localport% -L tcp://:%localport% -F relay+%lx%://%ip%:%remoteport%
if %ck%==0 echo CreateObject("WScript.Shell").Run "gost -L udp://:%localport% -L tcp://:%localport% -F relay+%lx%://%ip%:%remoteport%",0 >qidongc.vbs
if %ck%==0 cscript.exe /e:vbscript qidongc.vbs >nul
if %ck%==0 del qidongc.vbs
pause
goto :start
:start3
cls
tasklist |findstr gost.exe
pause
goto :start

:start4
cls
taskkill /f /im gost.exe
��̨��ǰ̨gost�����ر�
goto :start

pause
