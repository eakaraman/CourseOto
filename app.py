# -*- coding: utf-8 -*-

import sys
if "Tkinter" not in sys.modules:
    import tkinter as tk
from functools import partial
import databasefile as dbb
# import pandas as pd
from PIL import Image,ImageTk
import dataView as dv
# from "./screens/teacherScreen" import teacherPage 
import screens.teacherScreen as ttc
import screens.adminScreen as adm
import screens.startScreen as stc
import screens.studentScreen as std
import screens.teacherLogin as tlog
import screens.addStudent as addstd

class app(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        container = tk.Frame(self)
        self.geometry("500x500")
        container.pack(side = "top", fill = "both", expand= True)
        
        self.frames = {}
        for F in (stc.StartPage, ttc.teacherPage, adm.adminPage, std.studentPage, dv.dataView, tlog.teacherLogin, addstd.addStudent):
            frame = F(container,self)
        
            self.frames[F] = frame

            frame.grid(row = 0, column = 0, sticky= "nsew")

        
        
        
        self.show_frame(stc.StartPage)
        
    def show_frame(self,cont):
        frame = self.frames[cont]
        self.geometry("1366x768")
        frame.tkraise()
        
        
 
app = app()
app.mainloop()
    
    