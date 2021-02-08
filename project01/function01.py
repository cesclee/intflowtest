import threading
import pymysql


#60초간격으로 sql 문을 통한 호출
def time60s():    
    threading.Timer(60,time60s).start()
    #pymysql패키지를 통한 db연동
    conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="task01_intflowtest",charset='utf8')  
    curs=conn.cursor()
    #센서값을 센서컬럼에 업데이트
    sql="update animal set sensor='sensordata' where animalNo is not null"
    curs.execute(sql)
    conn.commit()
    conn.close()
    print('삽입완료')
    sql2="select avg(moves) as 평균활동성 from animal"
time60s()
