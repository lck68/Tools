::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCqDJNFjPsfn+Z6ytYN42O9hxTLcCdR9Hg0CZ7ubqDgDeobV5qeLNPQa5EKqcI4otg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
cls
mode con cols=200 lines=100

title ��ѡ�����ļ�
echo ===============================================
echo =                                             =
echo =              ��ӭʹ��LCKҡ����              =
echo =                                             =
echo ===============================================
echo.
echo   �������������н����б�����
echo ====================================
dir "../config/*.ini" /b
echo ====================================
echo.
echo   ���������뽱���ļ��������硰1.ini������
set xz=1.ini
echo ====================================
set /p xz=
echo ====================================
del main.ini >nul
cd ../
copy .\config\%xz% .\bin\ >nul
ren .\bin\%xz% main.ini >nul
echo ����ɣ���ǰ�����ļ�Ϊ%xz%��
echo ====================================
pause