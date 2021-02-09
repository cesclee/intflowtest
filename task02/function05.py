import threading
import pymysql
import datetime
#60초간격으로 sql 문을 통한 호출
def time60s():    
    threading.Timer(60,time60s).start()
    #pymysql패키지를 통한 db연동
    conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="mydb",charset='utf8')  
    curs=conn.cursor()
    #sql문을 통한 조건입력 후 10분간 움직임 없는 개체의 건물번호 출력
    sql="SELECT building_buildingNo FROM camera where date_sub(CURDATE(),INTERVAL -10 minute) and moves ='moving';"
    curs.execute(sql)
    conn.commit()
    rows=curs.fetchall()
    print(rows)
    
    conn.close()
    
time60s()