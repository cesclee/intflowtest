import threading
import pymysql


#5초간격으로 sql 문을 통한 호출
def time60s():    
    threading.Timer(60,time60s).start()
    #pymysql패키지를 통한 db연동
    conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="task01_intflowtest",charset='utf8')  
    curs=conn.cursor()
    #sql문을 통한 삽입값지정
    sql="""insert into animal(animalNo,sex,memo)
    values(%s,%s,%s)
    """
    #i는 animalNo PK 자리이므로 조건문을통해 1씩 증가  
    for i in range(1,5):
        curs.execute(sql,(i,'fe','good'))
        conn.commit()
    sql2="select * from task01_intflowtest.animal"
    curs.execute(sql2)
    rows = curs.fetchall()
    conn.close()
    print('삽입완료')
time60s()
