# -*- coding: utf-8 -*-
"""
Created on Sun Mar 15 19:34:33 2020

@author: eakar
"""

#%%


import tkinter as tk
from functools import partial
import databasefile as dbb


root = tk.Tk()
root.geometry('350x750')
root.title('tkinter deneme')

lbl1 = tk.Label(root,text="Name")

lbl2 = tk.Label(root,text="Surname")
lbl3 = tk.Label(root,text="email")

lbl4 = tk.Label(root,text="Phone")
lbl5 = tk.Label(root,text="Tc")

lbl6 = tk.Label(root,text="username")
lbl7 = tk.Label(root,text="password")


name = tk.StringVar()
surname = tk.StringVar()
email = tk.StringVar()
phone = tk.StringVar()
tc = tk.IntVar()
username = tk.StringVar()
password = tk.StringVar()



check = tk.IntVar()
ent1 = tk.Entry(root, textvariable=name)
ent2 = tk.Entry(root, textvariable = surname)
ent3 = tk.Entry(root, textvariable= email)
ent4 = tk.Entry(root, textvariable = phone)
ent5 = tk.Entry(root, textvariable= tc)
ent6 = tk.Entry(root, textvariable = username)
ent7 = tk.Entry(root, textvariable = password)
c = tk.Checkbutton(root,text = "Working?", variable = check, onvalue = 1,offvalue=0)



log = partial(dbb.addTeacher,tc, name, surname, email, phone, username, password, check)


btn = tk.Button(root,text="Login",command= log)
lbl1.grid(row=0, sticky = tk.E)
lbl2.grid(row=1,sticky=tk.E)
lbl3.grid(row=2, sticky = tk.E)
lbl4.grid(row=3,sticky= tk.E)
lbl5.grid(row=4,sticky= tk.E)
lbl6.grid(row=5, sticky = tk.E)
lbl7.grid(row=6,sticky= tk.E)
btn.grid(row=7,column=1)

# entries
ent1.grid(row=0,column=1)
ent2.grid(row=1,column=1)
ent3.grid(row=2,column=1)
ent4.grid(row=3,column=1)
ent5.grid(row=4,column=1)
ent6.grid(row=5,column=1)
ent7.grid(row=6,column=1)
c.grid(columnspan=2)



# dbb.addTeacher(tc.get(), name.get(), surname.get(), email.get(), phone.get(), username.get(), password.get())


root.mainloop()

