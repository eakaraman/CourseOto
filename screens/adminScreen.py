import sys
if "Tkinter" not in sys.modules:
    import tkinter as tk
# from tkinter.ttk import *
import mysql.connector
from PIL import Image,ImageTk
import dataView as dv
import screens.startScreen as stc
import screens.addStudent as addstd

class adminPage(tk.Frame):
    def __init__(self,parent,controller):
        tk.Frame.__init__(self,parent)
        # lbl = tk.Label(self,text = "Teacher", font = ("Verdana",55))
        # lbl.pack() 
        image =  Image.open("assets/student.png")
        image = image.resize((150, 150), Image.ANTIALIAS)
        self.student_pic = ImageTk.PhotoImage(image)

         
        image2 =  Image.open("assets/teacher.png")
        image2 = image2.resize((150, 150), Image.ANTIALIAS)
        self.teacher_pic = ImageTk.PhotoImage(image2)
        

        student_btn = tk.Button(self, text = "Show Students",command = lambda: controller.show_frame(dv.dataView),image = self.student_pic, compound = "left")
        student_btn.grid(row=0, column=0)

        addStudent = tk.Button(self, text = "Add Student",command = lambda: controller.show_frame(addstd.addStudent),image = self.student_pic, compound = "left")
        addStudent.grid(row=0, column=1)

        addTeacher = tk.Button(self, text = "Add Teacher",command = lambda: controller.show_frame(addstd.addStudent),image = self.teacher_pic, compound = "left")
        addTeacher.grid(row=0, column=1)
