# -*- coding: utf-8 -*-
"""
Created on Sun Mar 15 19:34:33 2020

@author: eakar
"""


import tkinter as tk
from functools import partial
import databasefile as dbb

class addStudent(tk.Frame):
    def __init__(self,parent,controller):

        tk.Frame.__init__(self,parent)

       

        lbl1 = tk.Label(self,text="Name")

        lbl2 = tk.Label(self,text="Surname")
        lbl3 = tk.Label(self,text="email")

        lbl4 = tk.Label(self,text="Phone")
        lbl5 = tk.Label(self,text="Tc")

        # lbl6 = tk.Label(self,text="username")
        # lbl7 = tk.Label(self,text="password")


        name = tk.StringVar()
        surname = tk.StringVar()
        email = tk.StringVar()
        phone = tk.StringVar()
        tc = tk.IntVar()
        # username = tk.StringVar()
        # password = tk.StringVar()



        check = tk.IntVar()
        ent1 = tk.Entry(self, textvariable=name)
        ent2 = tk.Entry(self, textvariable = surname)
        ent3 = tk.Entry(self, textvariable= email)
        ent4 = tk.Entry(self, textvariable = phone)
        ent5 = tk.Entry(self, textvariable= tc)
        # ent6 = tk.Entry(self, textvariable = username)
        # ent7 = tk.Entry(self, textvariable = password)
        # c = tk.Checkbutton(self,text = "Working?", variable = check, onvalue = 1,offvalue=0)



        log = partial(dbb.addTeacher,tc, name, surname, email, phone)


        btn = tk.Button(self,text="Login",command= log)
        lbl1.grid(row=0, sticky = tk.E)
        lbl2.grid(row=1,sticky=tk.E)
        lbl3.grid(row=2, sticky = tk.E)
        lbl4.grid(row=3,sticky= tk.E)
        lbl5.grid(row=4,sticky= tk.E)
        # lbl6.grid(row=5, sticky = tk.E)
        # lbl7.grid(row=6,sticky= tk.E)
        btn.grid(row=7,column=1)

        # entries
        ent1.grid(row=0,column=1)
        ent2.grid(row=1,column=1)
        ent3.grid(row=2,column=1)
        ent4.grid(row=3,column=1)
        ent5.grid(row=4,column=1)
        # ent6.grid(row=5,column=1)
        # ent7.grid(row=6,column=1)
        # c.grid(columnspan=2)





