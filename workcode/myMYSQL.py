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
        db = pymysql.connect("localhost", "root", "sd204314", "myusers")

        cursor = db.cursor()

        sql = 'INSERT INTO user VALUES("%s","%s")' %(username,password)

        try:
            if cursor.execute(sql):
                return 1
            else:
                return 0
            db.commit()
        except:
            db.rollback()

        db.close()

    #删除一名用户
    def deleteUser(self,username):
        db = pymysql.connect("localhost", "root", "sd204314", "myusers")

        cursor = db.cursor()

        sql = 'DELETE FROM user WHERE name="%s"' %username

        try:
            if cursor.execute(sql):
                return 1
            else:
                return 0
            db.commit()
        except:
            db.rollback()

        db.close()
