# ==========================
# setup_dashboard.ps1
# ==========================

# Proje yolu
$projectPath = "C:\YEDEK\gpt_muhasebe_programi"
$appPath = Join-Path $projectPath "app"
$dashboardPath = Join-Path $appPath "dashboard"
$basePath = $appPath

Write-Host "▶️ Dashboard kurulumu başlatılıyor..."

# Dashboard klasörünü kontrol et
if (-not (Test-Path $dashboardPath)) {
    New-Item -ItemType Directory -Path $dashboardPath | Out-Null
    Write-Host "📁 Dashboard klasörü oluşturuldu."
}

# __init__.py dosyası oluştur
Set-Content -Path (Join-Path $dashboardPath "__init__.py") -Value "from .dashboard import Dashboard" -Encoding UTF8

# dashboard.py dosyası oluştur
$dashboardPy = @"
import tkinter as tk

class Dashboard(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        label = tk.Label(self, text="📊 GPT Muhasebe Dashboard", font=("Arial", 18))
        label.pack(pady=50)
"@
Set-Content -Path (Join-Path $dashboardPath "dashboard.py") -Value $dashboardPy -Encoding UTF8

# main.py dosyası oluştur
$mainPy = @"
from tkinter import Tk
from app.dashboard import Dashboard

class MuhasebeSistemi(Tk):
    def __init__(self):
        super().__init__()
        self.title("GPT Muhasebe Programı")
        self.geometry("1024x720")
        self.show_dashboard()

    def show_dashboard(self):
        dashboard = Dashboard(self)
        dashboard.pack(fill="both", expand=True)

if __name__ == "__main__":
    app = MuhasebeSistemi()
    app.mainloop()
"@
Set-Content -Path (Join-Path $basePath "main.py") -Value $mainPy -Encoding UTF8

Write-Host "✅ Dashboard ve main.py dosyaları başarıyla oluşturuldu/güncellendi."
Write-Host "▶️ Program başlatılıyor..."
cd $projectPath
python .\app\main.py
