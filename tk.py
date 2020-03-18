# -*- coding: utf-8 -*-

import tkinter as tk
import tkinter.messagebox
def helloCallBack():
   tk.messagebox.showinfo( "Hello Python", "a.get()")


top = tk.Tk()

tFrame = tk.Frame(top)
tFrame.pack()
bFrame = tk.Frame(top)
bFrame.pack(side=tk.BOTTOM)

ent = tk.Entry(tFrame, bd=5)
w = tk.Button(tFrame,text = "hello" , command=helloCallBack)
label = tk.Label(bFrame, text = "Deneme")

label.pack(side = tk.RIGHT)
ent.pack(side = tk.LEFT)
w.pack(side = tk.LEFT)
top.mainloop()