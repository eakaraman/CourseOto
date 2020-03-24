import sys
if "Tkinter" not in sys.modules:
    import tkinter as tk
# from tkinter.ttk import *
import mysql.connector
from PIL import Image,ImageTk
import dataView as dv
import screens.startScreen as stc
import screens.addStudent as addstd

class teacherPage(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        # lbl = tk.Label(self,text = "Teacher", font = ("Verdana",55))
        # lbl.pack() 
        image =  Image.open("assets/student.png")
        image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
        self.student_pic = ImageTk.PhotoImage(image)

        

        student_btn = tk.Button(self, text = "Show Students",command = lambda: controller.show_frame(dv.dataView),image = self.student_pic, compound = "left")
        student_btn.grid(row=0, column=0)

        addstudent = tk.Button(self, text = "Add Students",command = lambda: controller.show_frame(addstd.addStudent),image = self.student_pic, compound = "left")
        addstudent.grid(row=0, column=1)

