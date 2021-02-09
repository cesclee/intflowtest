import threading
import pymysql
#600초간격으로 sql 문을 통한 호출
def time60s():    
    threading.Timer(600,time60s).start()
    #pymysql패키지를 통한 db연동
    conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="mydb",charset='utf8')  
    curs=conn.cursor()
    #건물번호 출력_조건 값들이 null 일 경우
    sql="SELECT building_buildingNo1 from sensor where humidity is null and wind is null and gas is null;"     
    curs.execute(sql)
    conn.commit()
    rows=curs.fetchall()
    print("건물번호 : ",rows)
    conn.close()    
time60s()