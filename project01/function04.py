import threading
import pymysql
import datetime
#60초간격으로 sql 문을 통한 호출
def time60s():    
    threading.Timer(60,time60s).start()
    #pymysql패키지를 통한 db연동
    conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="task01_intflowtest",charset='utf8')  
    curs=conn.cursor()
    #건물번호 출력_ 동물,빌딩테이블에서 동물움직임이 10분간 없는 조건으로
    sql="select buildingNo from animal,building where (moves is null)and DATE_SUB(CURDATE(),INTERVAL -10 minute); "   
    curs.execute(sql)
    conn.commit()
    rows=curs.fetchall()
    print(rows)
    
    conn.close()
    
time60s()