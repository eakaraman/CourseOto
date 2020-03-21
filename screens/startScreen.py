
import sys
if "Tkinter" not in sys.modules:
    import tkinter as tk
# from tkinter.ttk import *

from PIL import Image,ImageTk

import mysql.connector
import databasefile as dbb
import dataView as dv
# from app import StartPage
import screens.adminScreen as adm
import screens.teacherScreen as ttc
import screens.studentScreen as std
import screens.teacherLogin as tlog

class StartPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self,parent)
        image =  Image.open("assets/teacher.png")
        image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
        self.teacher_pic = ImageTk.PhotoImage(image)
        
        image =  Image.open("assets/admin.png")
        image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
        self.admin_pic = ImageTk.PhotoImage(image)
        
        image =  Image.open("assets/student.png")
        image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
        self.student_pic = ImageTk.PhotoImage(image)
        
        teacher_lbl = tk.Label(self,text="Teacher")
        
        admin_lbl = tk.Label(self,text="Admin")
        
        student_lbl = tk.Label(self,text="Student")
        
        
        admin_btn = tk.Button(self ,command = lambda: controller.show_frame(adm.adminPage), image = self.admin_pic)
        admin_btn.grid(row=0, column=1)
        admin_lbl.grid(row=1,column=1)
        
        
        student_btn = tk.Button(self, command = lambda: controller.show_frame(std.studentPage),image = self.student_pic)
        student_btn.grid(row=0, column=2)
        
        student_lbl.grid(row=1, column=2)
        
        teacher_btn = tk.Button(self,command = lambda: controller.show_frame(tlog.teacherLogin), image = self.teacher_pic)
        teacher_btn.grid(row=0,column=0)
        teacher_lbl.grid(row=1, column=0)
        