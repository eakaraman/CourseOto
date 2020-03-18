import tkinter as tk
from functools import partial
import databasefile as dbb
# import pandas as pd
import dataView as dv


def log(username, password, check):
    if dbb.trylog(username.get(),password.get()):
        # tk.messagebox.showinfo( "You are in")
        root.destroy()
        dv.viewData()
    else:
        tk.messagebox.showinfo( "Wrong")
    


root = tk.Tk()
root.geometry('400x150')
root.title('tkinter deneme')

lbl1 = tk.Label(root,text="Name")

lbl2 = tk.Label(root,text="Pass")
username = tk.StringVar()
password = tk.StringVar()
check = tk.IntVar()
ent1 = tk.Entry(root, textvariable=username)
ent2 = tk.Entry(root, textvariable = password)
c = tk.Checkbutton(root,text = "Keep Me Loggedin", variable = check, onvalue = 1,offvalue=0)

log = partial(log, username, password, check)

btn = tk.Button(root,text="Login", command=log)
root.bind("<Return>", log)
lbl1.grid(row=0, sticky = tk.E)
lbl2.grid(row=1,sticky= tk.E)
btn.grid(row=2,column=1)
ent1.grid(row=0,column=1)
ent2.grid(row=1,column=1)
c.grid(columnspan=2)



root.mainloop()
