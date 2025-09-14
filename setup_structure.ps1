# Klasör ana dizini
$basePath = "C:\YEDEK\gpt_muhasebe_programi"

# Klasör yapısını oluştur
$folders = @(
    "$basePath\app",
    "$basePath\app\auth",
    "$basePath\app\dashboard",
    "$basePath\app\modules",
    "$basePath\app\modules\stok",
    "$basePath\app\modules\cari",
    "$basePath\app\modules\fatura",
    "$basePath\app\modules\banka",
    "$basePath\app\modules\raporlama",
    "$basePath\core",
    "$basePath\veriler",
    "$basePath\assets",
    "$basePath\tests"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
    }
}

# Boş dosyalar oluştur
New-Item -Path "$basePath\app\main.py" -ItemType File -Force | Out-Null
New-Item -Path "$basePath\core\database.py" -ItemType File -Force | Out-Null
New-Item -Path "$basePath\core\base_window.py" -ItemType File -Force | Out-Null
New-Item -Path "$basePath\core\utils.py" -ItemType File -Force | Out-Null
New-Item -Path "$basePath\requirements.txt" -ItemType File -Force | Out-Null
New-Item -Path "$basePath\README.md" -ItemType File -Force | Out-Null
New-Item -Path "$basePath\setup.ps1" -ItemType File -Force | Out-Null

# __init__.py dosyaları
Get-ChildItem -Path $basePath -Recurse -Directory | ForEach-Object {
    New-Item -Path "$($_.FullName)\__init__.py" -ItemType File -Force | Out-Null
}

Write-Host "✅ Klasör yapısı başarıyla oluşturuldu: $basePath"
