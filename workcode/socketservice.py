import socket, os, json

from myMYSQL import MyUserSql

from model import model

#m=model()

#m.draw()

try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM);
    print("create socket succ!")

    sock.bind(('localhost', 8001))
    print('bind socket succ!')

    sock.listen(5)
    print('listen succ!')

except:
    print("init socket error!")

mysql=MyUserSql()
while True:
    print("listen for client...")
    conn, addr = sock.accept()
    print("get client")


    while True:
        szBuf = conn.recv(1024)
        buffer=str(szBuf, 'gbk')
        str1,str2,str3=buffer.split("_")
        print(str1+"  "+str2+"   "+str3)
        if str1=='register':
            if mysql.insertUser(str2,str3):
                conn.send(b"yes\n")
            else:
                conn.send(b"no\n")
        if str1=='sign':
            if mysql.isExist(str2,str3):
                conn.send(b"yes\n")
            else:
                conn.send(b"no\n")
        if str1=='delete':
            if mysql.isExist(str2,str3):
                if mysql.deleteUser(str2,str3):
                    conn.send(b"yes\n")
                else:
                    conn.send(b"no\n")
        if str1=='sendfile':
            filename = r"D:\pythonfiles\datas\data1.json"
            myfile = open(filename, 'rb')
            for readline in myfile:
                conn.send(readline)
        if str1=='change':
            if mysql.changeUser(str2,str2,str3):
                conn.send(b'yes\n')
            else:
                conn.send(b'no\n')

    conn.close()
    print("end of servive")
