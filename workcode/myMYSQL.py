import pymysql

class MyUserSql:
    host = ''
    user = ''
    password = ''
    database = ''

    def __init__(self):
        self.host = 'localhost'
        self.user = 'root'
        self.password = 'sd204314'
        self.database = 'myusers'

    #查看所有用户
    def seeAll(self):
        db = pymysql.connect(self.host, self.user, self.password, self.database)

        cursor = db.cursor()

        sql = 'SELECT * FROM user'

        try:
            cursor.execute(sql)
            data = cursor.fetchall()
            print(data)
            db.commit()
        except:
            db.rollback()

        db.close()

    #判断是否存在此用户
    def isExist(self,username,password):
        db = pymysql.connect(self.host,self.user,self.password,self.database)

        cursor = db.cursor()

        sql = 'SELECT * FROM user WHERE name = %s '

        if not cursor.execute(sql, username):
            return False
        else:
            return True

        db.close()

    #增加一名用户
    def insertUser(self,username,password):
        db = pymysql.connect(self.host, self.user, self.password, self.database)

        cursor = db.cursor()

        sql = 'INSERT INTO user VALUES("%s","%s")' %(username,password)

        try:
            cursor.execute(sql)
            db.commit()
            return 1
        except:
            return 0
            db.rollback()

        db.close()

    #删除一名用户
    def deleteUser(self,username):
        db = pymysql.connect(self.host, self.user, self.password, self.database)

        cursor = db.cursor()

        sql = 'DELETE FROM user WHERE name="%s"' %username

        try:
            cursor.execute(sql)
            db.commit()
            return 1
        except:
            return 0
            db.rollback()

        db.close()

    #修改指定用户的信息
    def changeUser(self,username,nusername,npassword):
        db = pymysql.connect(self.host, self.user, self.password, self.database)

        cursor = db.cursor()

        sql = 'UPDATE user SET name="%s", password="%s" WHERE name="%s"' %(nusername,npassword,username)

        try:
            cursor.execute(sql)
            db.commit()
            return 1
        except:
            return 0
            db.rollback()

        db.close()


