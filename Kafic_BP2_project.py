import mysql.connector
from tkinter import *
import tkinter.messagebox as MessageBox
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
        mydb = mysql.connector.connect(host="localhost", user="root", passwd="password")
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
        # ocisti text boxove
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
    # ocisti text boxove
        entry_id.delete(0, END);
        show()

def show():
    mydb = mysql.connector.connect(host="localhost", user="root", passwd="password")
    c = mydb.cursor()
    c.execute("USE kafić");
    c.execute("Select * from konobar")
    rows = c.fetchall()
    list.delete(0, list.size())
    list.insert((list.size()+1),"ID  Ime  Prezime  OIB")
    for row in rows:
        insertData=str(row[0])+' '+row[1]+' '+row[2]+' '+row[3]
        list.insert(list.size()+1, insertData)

    c.close()



label_k = Label(root, text="Konobar", font="bold")
label_k.grid(row=1,column=0, columnspan=2)

l_id=Label(root,text="ID")
l_id.grid(row=1, column=0)
entry = Entry(root)
entry.grid(row=1, column=1)

l_ime=Label(root,text="Ime")
l_ime.grid(row=2, column=0)
entry_i = Entry(root)
entry_i.grid(row=2, column=1)

l_prezime=Label(root,text="Prezime")
l_prezime.grid(row=3, column=0)
entry_p = Entry(root)
entry_p.grid(row=3, column=1)

l_OIB=Label(root,text="OIB")
l_OIB.grid(row=4, column=0)
entry_o = Entry(root)
entry_o.grid(row=4, column=1)

#submit
submit_btn= Button(root, text="Zapiši zapis", command=submit)
submit_btn.grid(row=5,column=0, columnspan=1, pady=10, padx=10, ipadx=100)

read_btn= Button(root, text="Ispisi zapis", command=read)
read_btn.grid(row=5,column=1, columnspan=1, pady=10, padx=10, ipadx=100)

update_btn= Button(root, text="Ažuriraj zapis", command=update)
update_btn.grid(row=6,column=0, columnspan=1, pady=10, padx=10, ipadx=100)

delete_btn= Button(root, text="Obriši zapis s ID-om:", command=delete)
delete_btn.grid(row=6,column=1, columnspan=1, pady=10, padx=10, ipadx=100)

entry_id = Entry(root)
entry_id.grid(row=6, column=2)

list=Listbox(root, width=40)
list.place(x=640, y=0)
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


