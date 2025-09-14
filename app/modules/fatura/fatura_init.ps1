# fatura_init.ps1
# Fatura modülünü test amaçlı açmak için script

Write-Host "Fatura modülü başlatılıyor..." -ForegroundColor Cyan

# Çalışma dizinini proje ana klasörüne ayarla
Set-Location "C:\YEDEK\gpt_muhasebe_programi"

# Ana uygulamayı çalıştır (main.py giriş noktası)
python .\app\main.py

Write-Host "Fatura modülü başlatıldı." -ForegroundColor Yellow
Pause
