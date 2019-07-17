@echo off
REM 声明采用UTF-8编码
chcp 65001

rem 进入到exe所在路径
%~d0
rem cd %~dp0

echo 请输入kfb文件所在文件夹路径,如D:\work\kfb_data_dir
set OP1=
set /p OP1=kfb文件夹路径：

rem 将kfb文件夹下的文件名保存到临时txt文件中
dir /b %OP1% > %~dp0\temp_kfb_name_list.txt

if not exist temp_kfb_name_list.txt goto end

echo --------------------------------------------
echo 请输入svs文件所在文件夹路径,如D:\work\svs_data_dir
set OP2=
set /p OP2=svs文件夹路径：
echo --------------------------------------------

rem 读取文件第一列
rem type是显示文件内容的命令
for /f "delims=." %%a in (%~dp0\temp_kfb_name_list.txt) do (
    echo %%a.kfb to %%a.svs
	%~dp0\KFbioConverter.exe %OP1%\%%a.kfb %OP2%\%%a.svs 4
	echo --------------------------------------------
)
del %~dp0\temp_kfb_name_list.txt
echo #############  Successfully convert kfb to svs  #############
pause