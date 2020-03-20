

import sys
if "Tkinter" not in sys.modules:
    import tkinter as tk
# from tkinter.ttk import *
from tkinter import messagebox
import mysql.connector
import databasefile as dbb
import dataView as dv
# from app import StartPage
import screens.startScreen as stc

    
class teacherLogin(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
       
        lbl1 = tk.Label(self,text="Name")
       
        
        lbl2 = tk.Label(self,text="Pass")
        username = tk.StringVar()
        password = tk.StringVar()
        
        ent1 = tk.Entry(self, textvariable=username)
        ent2 = tk.Entry(self, textvariable = password)
        
        lbl3 = tk.Label(self,text = "Teacher Login Page")
        
        
        btn1 = tk.Button(self,text="Login" ,command= lambda: self.log(username,password, controller))
        
        lbl1.grid(row=0, column=0)
        lbl2.grid(row=1,column=0)
        btn1.grid(row=2,column=1)
        ent1.grid(row=0,column=1)
        ent2.grid(row=1,column=1)

        lbl3.grid(row=3,column=0)
        

        btn = tk.Button(self,text = "Back to home", command= lambda: controller.show_frame(stc.StartPage))
        
        btn.grid(row = 3,column=3)
        
    
    def log(self, username,password,controller):
        if dbb.trylog(username.get(),password.get()):
            # tk.messagebox.showinfo( "You are in")
            controller.show_frame(dv.dataView)
        else:
            messagebox.showinfo( "Wrong")

  

        
        