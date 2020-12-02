import sqlite3
import urllib3
from random import randint
from datetime import datetime
import time

conn = sqlite3.connect("projetoFinal.db")

cursor = conn.cursor()

now = datetime.now()
data = "{}/{}/{}".format(now.day, now.month, now.year)
temperaturaAleatoria = randint(15, 30)

cursor.execute('SELECT codigo FROM arCondicionado WHERE codigo = (SELECT MAX(codigo) FROM arCondicionado)')
cod = cursor.fetchall()
cod2 = int('{}'.format(cod).strip('[]').strip('()').strip(',')) + 1

cursor.execute("""INSERT INTO arCondicionado
             VALUES({}, '{}', {})""".format(cod2, data, temperaturaAleatoria))

print('DADOS CADASTRADOS COM SUCESSO! SEGUE ABAIXO OS MESMOS:')
print('| codigo | DATA | TEMPERATURA |')

cursor.execute('SELECT * FROM arCondicionado')
for linha in cursor.fetchall():
    print(linha)

cursor.execute('SELECT temperatura FROM arCondicionado WHERE codigo = (SELECT MAX(codigo) FROM arCondicionado)')
temp = cursor.fetchall()
temp2 = int('{}'.format(temp).strip('[]').strip('()').strip(','))

conn.commit()

conn.close()

time.sleep(12)

http = urllib3.PoolManager()

arC1 = http.request('GET', 'https://api.thingspeak.com/update?api_key=FC159XE7YU8YC25V&field1={}'.format(temp2))

print(arC1.data)
