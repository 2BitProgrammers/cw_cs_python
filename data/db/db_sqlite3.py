import os
import sqlite3 ## pip install --upgrade db-sqlite3


DEFAULT_SQLITE3_DB_FILE = os.path.join(os.path.expanduser('~'), 'myapp1.db')


if __name__ == '__main__':
    ## Connect to the database
    print('SQLite3 DB:  %s' % DEFAULT_SQLITE3_DB_FILE)
    dbConn = sqlite3.connect(DEFAULT_SQLITE3_DB_FILE)

    ## Get cursor and run sql
    sql = 'SELECT * FROM npcDamageTypes;'
    print('\nsql:  %s' % sql)
    cur = dbConn.cursor()
    #results = cur.execute(sql)  
    cur.execute(sql) 
    #for row in results:
    for row in cur.fetchall():
        print('  ', row)

    ## Get cursor and run sql
    sql = 'SELECT * FROM npcActions ORDER BY name ASC;'
    print('\nsql:  %s' % sql)
    cur = dbConn.cursor()
    results = cur.execute(sql)   
    for row in results:
        print('  ', row)

    ## Commit changes and close db
    cur.close()
    #dbConn.commit() ## Read only, nothing to commit
    dbConn.close()

    print('')