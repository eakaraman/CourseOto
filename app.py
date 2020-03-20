# -*- coding: utf-8 -*-

import sys
if "Tkinter" not in sys.modules:
    import tkinter as tk
from functools import partial
import databasefile as dbb
# import pandas as pd
from PIL import Image,ImageTk
import dataView as dv

class app(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        container = tk.Frame(self)
        self.geometry("1366x768")
        container.pack(side = "top", fill = "both", expand= True)
        
        self.frames = {}
        for F in (StartPage, teacherPage, adminPage, studentPage, dv.dataView):
            frame = F(container,self)
        
            self.frames[F] = frame

            frame.grid(row = 0, column = 0, sticky= "nsew")

        
        
        
        self.show_frame(StartPage)
        
    def show_frame(self,cont):
        frame = self.frames[cont]
        frame.tkraise()
        
        
        
        
class StartPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self,parent)
        image =  Image.open("./teacher.png")
        image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
        self.teacher_pic = ImageTk.PhotoImage(image)
        
        image =  Image.open("./admin.png")
        image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
        self.admin_pic = ImageTk.PhotoImage(image)
        
        image =  Image.open("./student.png")
        image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
        self.student_pic = ImageTk.PhotoImage(image)
        
        teacher_lbl = tk.Label(self,text="Teacher")
        
        admin_lbl = tk.Label(self,text="Admin")
        
        student_lbl = tk.Label(self,text="Student")
        
        
        admin_btn = tk.Button(self ,command = lambda: controller.show_frame(adminPage), image = self.admin_pic)
        admin_btn.grid(row=0, column=1)
        admin_lbl.grid(row=1,column=1)
        
        
        student_btn = tk.Button(self, command = lambda: controller.show_frame(studentPage),image = self.student_pic)
        student_btn.grid(row=0, column=2)
        
        student_lbl.grid(row=1, column=2)
        
        teacher_btn = tk.Button(self,command = lambda: controller.show_frame(teacherPage), image = self.teacher_pic)
        teacher_btn.grid(row=0,column=0)
        teacher_lbl.grid(row=1, column=0)
        
    
class teacherPage(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        # lbl = tk.Label(self,text = "Teacher", font = ("Verdana",55))
        # lbl.pack() 
        lbl1 = tk.Label(self,text="Name")
        
        lbl2 = tk.Label(self,text="Pass")
        username = tk.StringVar()
        password = tk.StringVar()
        
        ent1 = tk.Entry(self, textvariable=username)
        ent2 = tk.Entry(self, textvariable = password)
        
        
        
        
        btn1 = tk.Button(self,text="Login" ,command= lambda: self.log(username,password, controller))
        
        lbl1.grid(row=0, column=0)
        lbl2.grid(row=1,column=0)
        btn1.grid(row=2,column=1)
        ent1.grid(row=0,column=1)
        ent2.grid(row=1,column=1)
        

        btn = tk.Button(self,text = "Back to home", command= lambda: controller.show_frame(StartPage))
        
        btn.grid(row = 3,column=3)
        
    
    def log(self, username,password,controller):
        if dbb.trylog(username.get(),password.get()):
            # tk.messagebox.showinfo( "You are in")
            controller.show_frame(dv.dataView)
        else:
            tk.messagebox.showinfo( "Wrong")
    
    
class adminPage(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        lbl = tk.Label(self,text = "Admin", font = ("Verdana",55))
        lbl.pack()  

        btn = tk.Button(self,text = "Back to home", command= lambda: controller.show_frame(StartPage))
        btn.pack()
        

class studentPage(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        lbl = tk.Label(self,text = "Student", font = ("Verdana",55))
        lbl.pack()  

        btn = tk.Button(self,text = "Back to home", command= lambda: controller.show_frame(StartPage))
        btn.pack()
           


def btn():
    print('den')      
app = app()
app.mainloop()
    
    