
import sys
if "Tkinter" not in sys.modules:
    import tkinter as tk
# from tkinter.ttk import *
import mysql.connector
import databasefile as dbb
import dataView as dv
# from app import StartPage
import screens.startScreen as stc


class studentPage(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        lbl = tk.Label(self,text = "Student", font = ("Verdana",55))
        lbl.pack()  

        btn = tk.Button(self,text = "Back to home", command= lambda: controller.show_frame(stc.StartPage))
        btn.pack()
         