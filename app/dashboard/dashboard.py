import tkinter as tk
from tkinter import ttk

class Dashboard(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.create_widgets()

    def create_widgets(self):
        label = ttk.Label(self, text="GPT Muhasebe ProgramÄ± - Ana Panel", font=("Arial", 16))
        label.pack(pady=20)

        modules = [
            ("Cari Hesaplar", self.open_cari),
            ("Stok YÃ¶netimi", self.open_stok),
            ("Fatura Ä°ÅŸlemleri", self.open_fatura),
            ("Banka Ä°ÅŸlemleri", self.open_banka),
            ("Raporlama", self.open_raporlama),
        ]

        for mod_name, command in modules:
            btn = ttk.Button(self, text=mod_name, command=command)
            btn.pack(pady=5, ipadx=10, ipady=5)

    def open_cari(self):
        print("Cari Hesaplar modÃ¼lÃ¼ aÃ§Ä±lÄ±yor...")

    def open_stok(self):
        print("Stok YÃ¶netimi modÃ¼lÃ¼ aÃ§Ä±lÄ±yor...")

    def open_fatura(self):
        print("Fatura modÃ¼lÃ¼ aÃ§Ä±lÄ±yor...")

    def open_banka(self):
        print("Banka modÃ¼lÃ¼ aÃ§Ä±lÄ±yor...")

    def open_raporlama(self):
        print("Raporlama modÃ¼lÃ¼ aÃ§Ä±lÄ±yor...")
