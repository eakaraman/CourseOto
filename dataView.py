# -*- coding: utf-8 -*-
"""
Created on Mon Mar 16 10:47:04 2020

@author: sezginmuslu
"""
from tkinter import *
from tkinter.ttk import *
import mysql.connector
import databasefile as dbb

def viewData():
   
    root = Tk()
    
    mydb = dbb.connecttodb()
    crs = mydb.cursor()
    que = "SELECT * FROM student"
    crs.execute(que)
    al = crs.fetchall()
    
    
    tv = Treeview(root)
    tv['columns'] = ('Name', 'Surname', 'email','phone')
    tv.heading("#0", text='Tc', anchor='w')
    tv.column("#0", anchor="w")
    tv.heading('Name', text='Name')
    tv.column('Name', anchor='center', width=100)
    tv.heading('Surname', text='Surname')
    tv.column('Surname', anchor='center', width=100)
    tv.heading('email', text='email')
    tv.column('email', anchor='center', width=100)
    tv.heading('phone', text='phone')
    tv.column('phone', anchor='center', width=100)
    tv.grid(sticky = (N,S,W,E))
    root.treeview = tv
    root.grid_rowconfigure(0, weight = 1)
    root.grid_columnconfigure(0, weight = 1)
    
    
    cpt = 0 # Counter representing the ID of your code.
    for row in al:
       # I suppose the first column of your table is ID
       tv.insert('', 'end', text=str(row[0]), values=(row[1], row[2], row[3],row[4]))
       cpt += 1 # increment the ID
    
    crs.close()
    mydb.close()
    
    root.mainloop()