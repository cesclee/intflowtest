import pymysql

conn=pymysql.connect

conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="task01_intflowtest",charset='utf8')
curs=conn.cursor()
sql="select * from member"
curs.execute(sql)
rows = curs.fetchall()

print(rows)

conn.close()
