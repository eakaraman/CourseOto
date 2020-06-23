

import mysql.connector
import pandas as pd

def connecttodb():
    
    try:
        mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="",
        db="deneme"
        )
        return mydb
        
    
    except mysql.connector.Error as e:
        print("*****************failed {}".format(e))
        
    #finally:
    #    if mydb.is_connected():
    #        mydb.close()
    #        print("closed")


def adduser(id,username,pwd):

    try:
        mydb = connecttodb()
        mycursor = mydb.cursor()
        que = "INSERT INTO users2 (id,username,pwd) VALUES (%s,%s,%s)"
        tpl = (id,username,pwd)
        mycursor.execute(que,tpl)
        mydb.commit()
        mycursor.close()
        mydb.close()
    except mysql.connector.Error as e:
        print("failed {}".format(e))



df = pd.DataFrame()
def selecttodf():
    try:
        mydb = connecttodb()
        mycursor = mydb.cursor()
        mycursor.execute("SELECT * FROM users2")
        table_rows = mycursor.fetchall()
        df = pd.DataFrame(table_rows)
        mycursor.close()
        mydb.close()
        return df
    except mysql.connector.Error as e:
        print("failed {}".format(e))
        
            

def trylogteacher(username,password):
    try:
        que = "SELECT id,login,password FROM teacher_account WHERE login = %s AND password = %s "
        mydb = connecttodb()
        mycursor = mydb.cursor()
        tpl = (username,password)
        mycursor.execute(que,tpl)
        tt = mycursor.fetchall()
        mycursor.close()
        mydb.close()
        if len(tt)>0:
            return True
        else:
            return False
    except mysql.connector.Error as e:
        print("failed {}".format(e)) 

# df = selecttodf()
# tttttt = trylog('qwe','qwe')
def trylogadmin(username,password):
    try:
        que = "SELECT id,login,password FROM admin WHERE login = %s AND password = %s "
        mydb = connecttodb()
        mycursor = mydb.cursor()
        tpl = (username,password)
        mycursor.execute(que,tpl)
        tt = mycursor.fetchall()
        mycursor.close()
        mydb.close()
        if len(tt)>0:
            return True
        else:
            return False
    except mysql.connector.Error as e:
        print("failed {}".format(e)) 

def trylogstudent(username,password):
    try:
        que = "SELECT id,login,password FROM student_account WHERE login = %s AND password = %s "
        mydb = connecttodb()
        mycursor = mydb.cursor()
        tpl = (username,password)
        mycursor.execute(que,tpl)
        tt = mycursor.fetchall()
        mycursor.close()
        mydb.close()
        if len(tt)>0:
            return True
        else:
            return False
    except mysql.connector.Error as e:
        print("failed {}".format(e)) 

def addTeacher(name,surname, email,phone, login,password,tc):
    try:
        print(name.get())
        que = "INSERT INTO teacher (name,surname,email,phone,tc) VALUES (%s,%s,%s,%s,%s)"
        que2 =  "INSERT INTO teacher_account (login,password) VALUES (%s,%s)"
        mydb = connecttodb()
        curs= mydb.cursor()
        tpl = (name.get(),surname.get(),email.get(),phone.get(),tc.get())
        curs.execute(que,tpl)

        tpl2 = (login.get(),password.get())

        curs.execute(que2,tpl2)
        mydb.commit()
        curs.close()
        mydb.close()
    except mysql.connector.Error as e:
        print("failed |||| {}".format(e)) 

def addStudent(name,surname, email,phone, login,password,tc):
    try:
        print(name.get())
        que = "INSERT INTO student (name,surname,email,phone,tc) VALUES (%s,%s,%s,%s,%s)"
        que2 =  "INSERT INTO student_account (login,password) VALUES (%s,%s)"
        mydb = connecttodb()
        curs= mydb.cursor()
        tpl = (name.get(),surname.get(),email.get(),phone.get(),tc.get())
        curs.execute(que,tpl)

        tpl2 = (login.get(),password.get())

        curs.execute(que2,tpl2)
        mydb.commit()
        curs.close()
        mydb.close()
    except mysql.connector.Error as e:
        print("failed |||| {}".format(e)) 


        


# def addTeacher(id,name,surname, email,phone):
#     try:
#         print(id.get())
#         print(name.get())
#         que = "INSERT INTO student (tc,name,surname,email,phone) VALUES (%s,%s,%s,%s,%s)"
#         # que2 =  "INSERT INTO teacher_account (id,working,login,password) VALUES (%s,%s,%s,%s)"
#         mydb = connecttodb()
#         curs= mydb.cursor()
#         tpl = (id.get(),name.get(),surname.get(),email.get(),phone.get())
#         # tpl2 = (id.get(),working.get(),login.get(),password.get())
#         curs.execute(que,tpl)
#         # curs.execute(que2,tpl2)
#         mydb.commit()
#         curs.close()
#         mydb.close()
#     except mysql.connector.Error as e:
#         print("failed |||| {}".format(e)) 










        