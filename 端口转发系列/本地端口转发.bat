@echo off
setlocal  ::�����￪ʼ���������ԱȨ��
set uac=~uac_permission_tmp_%random%
md "%SystemRoot%\system32\%uac%" 2>nul
if %errorlevel%==0 ( rd "%SystemRoot%\system32\%uac%" >nul 2>nul ) else (
    echo set uac = CreateObject^("Shell.Application"^)>"%temp%\%uac%.vbs"
    echo uac.ShellExecute "%~s0","","","runas",1 >>"%temp%\%uac%.vbs"
    echo WScript.Quit >>"%temp%\%uac%.vbs"
    "%temp%\%uac%.vbs" /f
    del /f /q "%temp%\%uac%.vbs" & exit )
endlocal  :: ������������������ԱȨ��
:mulu
cls
title �˿�ת�����
echo ====================
echo ��Ҫ�ù���ԱȨ������
echo ����:           
echo ���Ӷ˿ڷ�Χӳ��
echo ====================
echo 1.���Ӷ˿�ת��
echo 2.ɾ���˿�ת��
echo 3.��ѯ�˿�ת��
echo ====================
echo 4.��ն˿�ת������
echo 5.����windows�˿�ת������
echo ====================
echo ��������
echo 6.���Ӷ˿ڷ�Χӳ��
echo 7.ɾ���˿ڷ�Χӳ��
echo 8.�˳��ű�
echo ====================
set /p xuanze= 
if /i "%xuanze%"=="1" cls&goto zhuanfa
if /i "%xuanze%"=="2" cls&goto shanchu
if /i "%xuanze%"=="3" cls&goto chaxun
if /i "%xuanze%"=="4" cls&goto qingkong
if /i "%xuanze%"=="5" cls&goto kaiqifw
if /i "%xuanze%"=="6" cls&goto fanwei1
if /i "%xuanze%"=="7" cls&goto fanwei2
if /i "%xuanze%"=="7" cls&goto tuichu
goto :mulu
:zhuanfa
 cls
 
 echo ���뱻ת����ip/����
 set ip=0
 set/p ip=
 
 echo ������Ҫת���Ķ˿�
 set needpoint=0
 set/p needpoint=
if 1%needpoint% NEQ +1%needpoint% echo ����������������̱ &pause&goto :mulu
if %needpoint% GEQ 65535 (
echo �˿�����ô������̱
echo �������65535
pause
goto :mulu
)

 echo ��Ҫת�����������ٶ˿�
 set topoint=0
 set/p topoint=
if 1%topoint% NEQ +1%topoint% echo ����������������̱ &pause&goto :mulu
if %topoint% GEQ 65535 (
echo �˿�����ô������̱
echo �������65535
pause
goto :mulu
)
 cls
 netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=%topoint% connectaddress=%ip% connectport=%needpoint%
 echo ������� 
 pause 
goto :mulu

:shanchu
 cls
 echo ����ת����Ķ˿�
 set/p point=%point%
 cls
 netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=%point%
 echo ���ɾ��
 pause
goto :mulu

:chaxun
 cls
 netsh interface portproxy show v4tov4
 pause
goto :mulu

:kaiqifw
cls
net start iphlpsvc
echo �����ɹ�
pause
goto :mulu

:fanwei1
echo ��Χת���˿ڽ�֧�ֱ����˿ڵ���Զ�̶˿�
echo ���뱻ת����ip/����
set/p ip=
echo ������Ҫת���Ķ˿ڷ�Χ����ʼ��
set/p star=
echo ������Ҫת���Ķ˿ڷ�Χ��������
set/p stop=
if %stop% LEQ %star% (
echo �벻Ҫ��������
pause
goto :mulu
)
if %stop% GEQ 65535 (
echo �˿�����ô������̱
echo �������65535
pause
goto :mulu
)
set /a stop+=1
:xh1
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=%star% connectaddress=%ip% connectport=%star%
echo ������%star%�˿ڵ�ӳ�䵽%ip%
set /a star+=1
if %star%==%stop% (
echo �������
pause
goto :mulu
)
goto :xh1

:fanwei2
 cls
echo ������Ҫɾ���Ķ˿ڷ�Χ����ʼ��
set/p star=
echo ������Ҫɾ���Ķ˿ڷ�Χ��������
set/p stop=
if %stop% LEQ %star% (
echo �벻Ҫ��������
pause
goto :mulu
)
if %stop% GEQ 65535 (
echo �˿�����ô������̱
echo �������65535
pause
goto :mulu
)
set /a stop+=1
:xh2
 netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=%star%
echo ɾ����%star%�˿ڵ�ӳ��
set /a star+=1
if %star%==%stop% (
echo ɾ�����
pause
goto :mulu
)
goto :xh2
pause

echo ���ɾ��
pause
goto :mulu

:tuichu
exit

:qingkong
netsh interface portproxy reset
echo ������
pause
goto :mulu

%0