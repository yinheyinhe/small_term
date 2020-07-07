import socket, os, json

try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM);
    print("create socket succ!")

    sock.bind(('localhost', 8001))
    print('bind socket succ!')

    sock.listen(5)
    print('listen succ!')

except:
    print("init socket error!")

while True:
    print("listen for client...")
    conn, addr = sock.accept()
    print("get client")
    print(addr)

    conn.settimeout(30)
    szBuf = conn.recv(1024)
    print("recv:" + str(szBuf, 'gbk'))

    if "0" == szBuf:
        conn.send(b"exit")
    else:
        conn.send(b"welcome client")

    filename = r"D:\pythonfiles\1.jpg"
    basefilename = os.path.basename(filename)
    myfile = open(filename, 'rb')
    myfile_size = os.path.getsize(filename)
    print(basefilename)
    data = {'filename': basefilename, 'filesize': myfile_size}
    json_obj = json.dumps(data)
    conn.send(json_obj.encode())
    for readline in myfile:
        conn.send(readline)
    conn.close()
    print("end of servive")
