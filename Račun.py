import mysql.connector
from tkinter import *
import tkinter.messagebox as MessageBox
import datetime
import Image
import PIL
import time
from PIL import ImageTk,Image
root = Tk()
root.title('Kafić')
root.iconbitmap('D:\Documents\Faks\BP2\Project_Kafana\kafic.ico')
#Konobar
    #KFrame = Frame(root)
    #KFrame.pack()
    #button_k= Button(KFrame, text="Konobar")
    #button_k.pack(fill=X)
def submit():

    # unesi u tablicu
    id=entry.get();
    ime=entry_i.get();
    prezime=entry_p.get();
    oib=entry_o.get();
    if(ime=="" or prezime=="" or oib==""):
        MessageBox.showinfo("Status", "Morate unijeti sva polja")
    else:
        mydb=mysql.connector.connect(host="localhost", user="root", passwd="password")
        c = mydb.cursor()
        c.execute("USE kafić");
        c.execute("INSERT INTO Konobar VALUES (default,'"+ ime +"','"+ prezime +"','"+ oib +"', NULL)")

        mydb.commit();
        MessageBox.showinfo("Status", "Uspješno ste unijeli u bazu");
        mydb.close();
    # ocisti text boxes
        entry_i.delete(0, END);
        entry_p.delete(0, END);
        entry_o.delete(0, END)
        show()
def read():
    entry_i.delete(0, END);
    entry_p.delete(0, END);
    entry_o.delete(0, END)
    entry.delete(0,END)
    if (entry_id.get() == ""):
        MessageBox.showinfo("Update status", "Morate unijeti ID")
    else:
        mydb = mysql.connector.connect(host="localhost", user="root", passwd="passowrd")
        c = mydb.cursor()
        c.execute("USE kafić");
        c.execute("Select * from konobar where idKonobar='" + entry_id.get() + "'")
        rows=c.fetchall()

        for row in rows:
            entry.insert(0,row[0])
            entry_i.insert(0,row[1])
            entry_p.insert(0,row[2])
            entry_o.insert(0,row[3])

        mydb.commit();

        mydb.close();
        # ocisti text boxes
        entry_id.delete(0, END);
        show()

def update():
    id=entry.get()
    ime=entry_i.get()
    prezime = entry_p.get()
    oib = entry_o.get()
    if (ime == "" or prezime == "" or oib == "" or id==""):
        MessageBox.showinfo("Morate unijeti sva polja")
    else:
        mydb = mysql.connector.connect(host="localhost", user="root", passwd="password")
        c = mydb.cursor()
        c.execute("USE kafić");
        c.execute("UPDATE konobar set Ime='"+ime+"', Prezime='"+prezime+"',OIB='"+oib+"' where idKonobar='"+id+"'")

        mydb.commit();
        MessageBox.showinfo("Status", "Uspješno ste ažurirali bazu");
        mydb.close();
        # ocisti text boxes
        entry_id.delete(0, END);
        show()

def delete():
    if (entry_id.get()==""):
        MessageBox.showinfo("Delete status", "Morate unijeti ID")
    else:
        mydb=mysql.connector.connect(host="localhost", user="root", passwd="password")
        c = mydb.cursor()
        c.execute("USE kafić");
        c.execute("DELETE from konobar where idKonobar='"+entry_id.get()+"'")

        mydb.commit();
        MessageBox.showinfo("Status", "Uspješno ste obrisali id iz baze");
        mydb.close();
    # ocisti text boxes
        entry_id.delete(0, END);
        show()

def show():
    mydb = mysql.connector.connect(host="localhost", user="root", passwd="password")
    c = mydb.cursor()
    c.execute("USE kafić");
   # c.execute("Select * from konobar")
    entry.insert(INSERT,datetime.datetime.now())

   # rows = c.fetchall()
    list.delete(0, list.size())
    list.insert((list.size()+1),"Stavke računa")
    list.insert((list.size()+1), "2 x Kava s mlijekom 10 kn")
    list.insert((list.size()+1), "2 x Red Bull 25 kn")
  #  for row in rows:
      #  insertData=str(row[0])+' '+row[1]+' '+row[2]+' '+row[3]
      #  list.insert(list.size()+1, insertData)

    c.execute("Select * from konobar")
    rows = c.fetchall()
    list2.delete(0, list2.size())
    list2.insert((list2.size() + 1), "Konobari")
    for row in rows:
      insertData=str(row[0])+' '+row[1]+' '+row[2]
      list2.insert(list2.size()+1, insertData)
    c.close()
def obavijest():
    MessageBox.showinfo("Obavijest", "Ispis!")


label_k = Label(root, text="Račun", font="bold")
label_k.grid(row=0,column=0, columnspan=2)

l_id=Label(root,text="Vrijeme")
l_id.grid(row=1, column=0)
entry = Text(root, width=10, height=2, bg="lightgrey", fg="black")
entry.grid(row=1, column=1)

l_ime=Label(root,text="Konobar")
l_ime.grid(row=2, column=0)
entry_i = Entry(root)
entry_i.grid(row=2, column=1)

l_prezime=Label(root,text="Stol")
l_prezime.grid(row=3, column=0)
entry_p = Entry(root)
entry_p.grid(row=3, column=1)

l_OIB=Label(root,text="Način plaćanja")
l_OIB.grid(row=4, column=0)
entry_o = Entry(root)
entry_o.grid(row=4, column=1)

l_cijena=Label(root,text="Ukupna cijena")
l_cijena.grid(row=5, column=0)
entry_cijena = Entry(root)
entry_cijena.grid(row=5, column=1)

#submit
submit_btn= Button(root, text="Ispis", command=obavijest)
submit_btn.grid(row=6,column=0, columnspan=2, pady=10, padx=10, ipadx=100)

artikl_btn= Button(root, text="Dodaj stavku računa", command=obavijest)
artikl_btn.grid(row=7,column=0, columnspan=2, pady=10, padx=10, ipadx=100)





list=Listbox(root, width=40)
list.place(x=350, y=30, height=100)
list2=Listbox(root, width=40)
list2.place(x=350, y=130, height=100)
show()
menu=Menu(root)
root.config(menu=menu)
Konobar=Menu(menu)
menu.add_cascade(label="Konobar",menu=Konobar)

Račun=Menu(menu)
menu.add_cascade(label="Račun",menu=Račun)

Artikl=Menu(menu)
menu.add_cascade(label="Artikli",menu=Artikl)

root.mainloop()


