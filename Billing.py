import mysql.connector as mysql
import tkinter.messagebox as MessageBox
from tkinter import *

def insert():
    id = e_id.get()
    name = e_name.get()
    num = e_num.get()
    add = e_add.get()
    print(id)
    if(id == "" or name == "" or num == "" or add == ""):
        MessageBox.showinfo("Insert status", "All fields are required")
    else:
        con = mysql.connect(host="localhost", user="root",
                            password="hars8296", database="restaurant")
        cursor = con.cursor()
        cursor.execute("insert into customer values('"+id +
                       "','"+name+"','"+num+"','"+add+"')")
        cursor.execute("commit")
        e_id.delete(0, 'end')
        e_add.delete(0, 'end')
        e_num.delete(0, 'end')
        e_name.delete(0, 'end')
        MessageBox.showinfo("Insert status", "New customer added Successfully")
        cursor.execute("select MAX(customer_id) from customer")
        rows1 = cursor.fetchall()
        e_idf.delete(0, 'end')
        e_idf.insert(0, rows1[0][0])
        con.close()

def fetch():
    if(e_numf.get() == ""):
        MessageBox.showerror("Fetch Status", "Enter Phone")
    else:
        con = mysql.connect(host="localhost", user="root",
                            password="hars8296", database="restaurant")
        cursor = con.cursor()
        cursor.execute("select * from customer where phno='"+e_numf.get()+"'")
        rows = cursor.fetchall()
        cursor.execute("select MAX(customer_id) from customer")
        rows1 = cursor.fetchall()
        if(len(rows) == 0):
            e_idf.delete(0, 'end')
            e_idf.insert(0, "New Customer")
            e_id.delete(0, 'end')
            e_id.insert(0, rows1[0][0]+1)
            newnum = e_numf.get()
            e_num.insert(0, newnum)
        else:
            e_idf.delete(0, 'end')
            e_idf.insert(0, rows[0][0])
        con.close()

def generateid():
    con = mysql.connect(host="localhost", user="root",
                        password="hars8296", database="restaurant")
    cursor = con.cursor()
    cidc = e_idf.get()
    if len(cidc) == 0:
        MessageBox.showerror("Fetch Status", "Enter Valid Customer Id")

    else:

        cursor.execute("select MAX(bill_id) from bill")
        rows = cursor.fetchall()
        e_bid.delete(0, 'end')
        e_bid.insert(0, rows[0][0]+1)
        e_billid.delete(0, 'end')
        e_billid.insert(0, rows[0][0]+1)
        val = (e_bid.get())
        m = '0'
        cursor.execute("insert into bill values('"+val+"','"+m+"')")
        L=e_idf.get()
        e_custid.insert(0,L)
        cursor.execute("commit")
        con.close()

def AddItems():
    r = e_custid.get()
    m = e_meal.get()
    s = e_billid.get()
    q = e_quant.get()
    con = mysql.connect(host="localhost", user="root",
                        password="hars8296", database="restaurant")
    cursor = con.cursor()
    cursor.execute("insert into orders values('" +
                   r+"','"+m+"','"+s+"','"+q+"')")
    cursor.execute("commit")
    con.close()
    e_meal.delete(0, 'end')
    e_quant.delete(0, 'end')

def generateprice():
    con = mysql.connect(host="localhost", user="root",
                        password="hars8296", database="restaurant")
    cursor = con.cursor()
    cursor.execute("select MAX(bill_id) from bill")
    rows2 = cursor.fetchall()
    val = str(rows2[0][0])
    cursor.execute("call up('"+val+"')")
    cursor.execute("commit")
    cursor.execute("select price from bill where bill_id='"+val+"'")
    rows3 = cursor.fetchall()
    e_aid.delete(0, 'end')
    e_aid.insert(0, rows3[0][0])
    e_billid.delete(0, 'end')
    e_custid.delete(0, 'end')

def clear():
    e_aid.delete(0, 'end')
    e_idf.delete(0, 'end')
    e_numf.delete(0, 'end')
    e_bid.delete(0, 'end')

root = Tk()
root.title('Bill System')
root.geometry("900x700")

head = Label(root, text='New customer Details')
head.place(x=20, y=30)
id = Label(root, text='ID')
id.place(x=20, y=60)
name = Label(root, text='NAME')
name.place(x=220, y=60)
num = Label(root, text='NUMBER')
num.place(x=420, y=60)
add = Label(root, text='ADDRESS')
add.place(x=620, y=60)
e_id = Entry()
e_id.place(x=20, y=90)
e_name = Entry()
e_name.place(x=220, y=90)
e_num = Entry()
e_num.place(x=420, y=90)
e_add = Entry()
e_add.place(x=620, y=90)
insert = Button(root, text="Insert", command=insert)
insert.place(x=20, y=130)

head1 = Label(root, text='Fetch Customer ID')
head1.place(x=20, y=170)
numf = Label(root, text='NUMBER')
numf.place(x=20, y=200)
idf = Label(root, text='ID')
idf.place(x=220, y=200)
e_numf = Entry()
e_numf.place(x=20, y=230)
e_idf = Entry()
e_idf.place(x=220, y=230)
fetch = Button(root, text="Fetch", command=fetch)
fetch.place(x=20, y=270)

head2 = Label(root, text='Generate Bill ID for Customer')
head2.place(x=20, y=310)
gen = Button(root, text="Generate", command=generateid)
gen.place(x=20, y=340)
e_bid = Entry()
e_bid.place(x=220, y=340)

head3 = Label(root, text='Add items ')
head3.place(x=20, y=380)
custid = Label(root, text='CUSTOMER ID')
custid.place(x=20, y=410)
meal = Label(root, text='MEAL ID')
meal.place(x=220, y=410)
billid = Label(root, text='BILL ID')
billid.place(x=420, y=410)
quant = Label(root, text="QUANTITY")
quant.place(x=620, y=410)
e_custid = Entry()
e_custid.place(x=20, y=440)
e_meal = Entry()
e_meal.place(x=220, y=440)
e_billid = Entry()
e_billid.place(x=420, y=440)
e_quant = Entry()
e_quant.place(x=620, y=440)
gen2 = Button(root, text="Add items", command=AddItems)
gen2.place(x=20, y=480)

head4 = Label(root, text='Price for Customer')
head4.place(x=20, y=530)
gen4 = Button(root, text="Amount To Pay", command=generateprice)
gen4.place(x=20, y=560)
e_aid = Entry()
e_aid.place(x=220, y=560)
gen5 = Button(root, text="Clear", command=clear)
gen5.place(x=420, y=560)

root.mainloop()
