@echo off
setlocal enabledelayedexpansion

REM Đặt thư mục chứa các file cần upload
set DIRECTORY_TO_UPLOAD="E:\CÔNG VIỆC"

REM Địa chỉ web server Flask của bạn
set SERVER_URL=http://10.38.18.11:9000/upload

REM Duyệt qua tất cả các file trong thư mục và thư mục con
for /r %DIRECTORY_TO_UPLOAD% %%f in (*) do (
    echo Uploading file: "%%f"
    curl -X POST -F "file=@%%f" %SERVER_URL%
)

echo All files have been uploaded!
