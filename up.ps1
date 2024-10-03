# Đặt thư mục chứa các file cần upload
$directoryToUpload = "E:\Công việc"

# Địa chỉ web server Flask của bạn
$serverUrl = "http://10.38.18.11:9000/upload"

# Duyệt qua tất cả các file trong thư mục và thư mục con
Get-ChildItem -Recurse -Path $directoryToUpload | ForEach-Object {
    $file = $_
    Write-Host "Uploading file: $($file.FullName)"
    
    # Gửi file lên server với form-data
    $formData = @{
        file = Get-Item -Path $file.FullName
    }

    # Gửi yêu cầu POST với file
    Invoke-RestMethod -Uri $serverUrl -Method Post -Form $formData
}

Write-Host "All files have been uploaded!"
