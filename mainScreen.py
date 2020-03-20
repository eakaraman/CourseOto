#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Mar 18 13:09:25 2020

@author: enes
"""
#import for pyimage doesnt exist problem
import sys
if "Tkinter" not in sys.modules:
    import tkinter as tk
from functools import partial
import databasefile as dbb
# import pandas as pd
from PIL import Image,ImageTk



class Screen:
    def __init__(self,root,xy,title, master= None):
        root.master = master
        root.geometry(xy)
       
        root.title(title) 




# bütün windowları aynı kodda birleştir diğer dosyalr sadece func için kullan
root = tk.Tk()
mainSc = Screen(root,'650x250','Main Screen')
# root = tk.Tk()
# root.geometry('650x250')
# root.title('tkinter deneme')


image =  Image.open("./teacher.png")
image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
teacher_pic = ImageTk.PhotoImage(image)

image =  Image.open("./admin.png")
image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
admin_pic = ImageTk.PhotoImage(image)

image =  Image.open("./student.png")
image = image.resize((150, 150), Image.ANTIALIAS) ## The (250, 250) is (height, width)
student_pic = ImageTk.PhotoImage(image)


teacher_lbl = tk.Label(root,text="Teacher")

admin_lbl = tk.Label(root,text="Admin")

student_lbl = tk.Label(root,text="Student")

# lbl2 = tk.Label(root,text="Pass")
# username = tk.StringVar()
# password = tk.StringVar()
# check = tk.IntVar()
# ent1 = tk.Entry(root, textvariable=username)
# ent2 = tk.Entry(root, textvariable = password)
# c = tk.Checkbutton(root,text = "Keep Me Loggedin", variable = check, onvalue = 1,offvalue=0)

# llog = partial(login.log, username, password, check)

admin_btn = tk.Button(root ,image = admin_pic)
admin_btn.grid(row=0, column=1)
admin_lbl.grid(row=1,column=1)


student_btn = tk.Button(root,image = student_pic)
student_btn.grid(row=0, column=2)

student_lbl.grid(row=1, column=2)

teacher_btn = tk.Button(root,image = teacher_pic)
teacher_btn.grid(row=0,column=0)
teacher_lbl.grid(row=1, column=0)

# lbl2.grid(row=1,sticky= tk.E)

# ent1.grid(row=0,column=1)
# ent2.grid(row=1,column=1)
# c.grid(columnspan=2)



root.mainloop()


