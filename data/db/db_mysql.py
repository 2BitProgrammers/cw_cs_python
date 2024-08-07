import mysql.connector # pip install --upgrade mysql-connector-python

DEFAULT_DB_PASSWORD = 'changeme'  ## NOTE: Don't do this in production.  Never put passwords in code

if __name__ == '__main__':
    dbConn = mysql.connector.connect(
            user='root', 
            password=DEFAULT_DB_PASSWORD,
            host='127.0.0.1',
            database='myapp1'
            )
    
    ## Get cursor and run sql
    #sql = 'SELECT * FROM `myapp1`.`users`;'
    sql = 'SELECT * FROM users;'
    print('sql:  %s' % sql)
    cur = dbConn.cursor()
    cur.execute(sql)   
    for row in cur:
        id = row[0]
        name = row[1]
        age = row[2]
        #print('  ', row)
        print('[%s] %s is %s years old' % (id, name, age))

    ## Get cursor and run sql
    #sql = 'SELECT * FROM `myapp1`.`users` WHERE id=100;'
    sql = 'SELECT * FROM users WHERE id=100;'
    print('\nsql:  %s' % sql)
    cur = dbConn.cursor()
    cur.execute(sql)   
    for row in cur:
        print('  ', row)

    ## Close the db
    cur.close()
    dbConn.close()
    print('')