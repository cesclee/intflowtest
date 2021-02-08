import threading
import pymysql

#60초간격으로 sql 문을 통한 호출
def time60s():    
    threading.Timer(60,time60s).start()
    #pymysql패키지를 통한 db연동
    conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="task01_intflowtest",charset='utf8')  
    curs=conn.cursor()
    #건물번호출력_빌딩테이블 중 일정 온도 이상인 건물번호만
    sql="select buildingNo from building where temperature>=34"
    curs.execute(sql)
    conn.commit()
    rows=curs.fetchall()
    print(rows)
    
    conn.close()
    
time60s()