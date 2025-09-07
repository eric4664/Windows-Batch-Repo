@echo off
setlocal enabledelayedexpansion

:: 設定檔案路徑與預期的 SHA256 雜湊值
set "filePath=C:\Users\erich\Desktop\NAC\NAC check fail3.png"
set "expectedHash=6128d2381a8c99fa3a34da8eccf37c9d94d63aefb8fa52bcb3c9f218da6f0f15"

:: 初始化行計數器
set "lineCount=0"

:: 執行 certutil 並擷取第二行（雜湊值）
for /f "usebackq delims=" %%A in (`certutil -hashfile "%filePath%" SHA256`) do (
    set /a lineCount+=1
    if !lineCount! equ 2 (
        set "actualHash=%%A"
    )
)

:: 移除空白
set "actualHash=%actualHash: =%"

:: 顯示結果
echo expected hash: %expectedHash%
echo actual   hash: %actualHash%

:: 比對
if /i "%actualHash%"=="%expectedHash%" (
    echo hash match
) else (
    echo hash not match
)

pause