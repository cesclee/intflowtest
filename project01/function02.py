import threading
import pymysql

#60초간격으로 sql 문을 통한 호출
def time60s():    
    threading.Timer(60,time60s).start()
    #pymysql패키지를 통한 db연동
    conn=pymysql.connect(host='localhost', user='root',password='rhtmxhq12@L', db="task01_intflowtest",charset='utf8')  
    curs=conn.cursor()
    #동물테이블업데이트_음식이 충분하면 움직임있도록
    sql="""update animal set moves='healthy' where food='enough'
    """
    curs.execute(sql)
    conn.commit()
    conn.close()
    print('삽입완료2')
time60s()

