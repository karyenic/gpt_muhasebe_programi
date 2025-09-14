from core.base_window import BaseWindow
from app.dashboard import Dashboard

class MuhasebeSistemi(BaseWindow):
    def __init__(self):
        super().__init__()
        self.title("GPT Muhasebe ProgramÄ±")
        self.geometry("1024x720")
        self.show_dashboard()

    def show_dashboard(self):
        dashboard = Dashboard(self)
        dashboard.pack(fill="both", expand=True)

if __name__ == "__main__":
    app = MuhasebeSistemi()
    app.mainloop()
