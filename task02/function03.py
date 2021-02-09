import threading
import pymysql
#pymysql패키지를 통한 db연동
conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="mydb",charset='utf8')  
curs=conn.cursor()
#건물번호출력_빌딩테이블 중 일정 온도 이상인 건물번호만
sql="select building_buildingNo1 from sensor where temperature>=34"
curs.execute(sql)
conn.commit()
rows=curs.fetchall()
print(rows)    
conn.close()
