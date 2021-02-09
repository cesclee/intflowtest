import threading
import pymysql

#60초간격으로 sql 문을 통한 호출
def time60s():    
    threading.Timer(60,time60s).start()
    #pymysql패키지를 통한 db연동
    conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="mydb",charset='utf8')
    curs=conn.cursor()

    #함수 1번 :센서값을 센서컬럼에 업데이트 / 삽입시 insert 테이블 into (컬럼) values();
    sql="update mydb.sensor set temperature=35 where sensorNo='1';"
    #함수 2번 : 개체의 정보를 1분마다 입력
    sql2="update camera set moves='moving' where foods is not null;"
    curs.execute(sql)
    curs.execute(sql2)
    conn.commit()
    conn.close()
    print('삽입완료')

time60s()

