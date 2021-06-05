from fastapi import FastAPI

import mysql.connector
from pydantic import BaseModel
from typing import Optional
import json

from pydantic.types import Json

app = FastAPI()




@app.get("/")
def read_root():
    return {"Hello": "World"}


# / Get All
@app.get("/alternatifs")
def getAlternatifs():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM alternatif")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "id": result[0],
            "nmAlternatif": result[1],
        })
    return data

@app.get("/kriterias")
def getKriterias():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM kriteria")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "id": result[0],
            "nmKriteria": result[1],
        })
    
    return data

@app.get("/jenisbencanas")
def getJenisBencanas():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM jenisbencana")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "id": result[0],
            "nmBencana": result[1]
        })
    
    return data

@app.get('/skalas')
def getSkalas():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM skala")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "id": result[0],
            "namaSkala": result[1],
            "value": result[2]
        })
    
    return data

@app.get('/bobots')
def getBobots():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM bobot")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "id": result[0],
            "namaSkala": result[1],
            "value": result[2]
        })
    
    return data

@app.get('/sektors')
def getSektors():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM sektor")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "id": result[0],
            "nmSektor": result[1]
        })
    
    return data

@app.get('/subsektors')
def getSektors():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM sub_sektor")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "id": result[0],
            "idSektor": result[1],
            "nmSubSektor": result[2],
        })
    
    return data

# End All

@app.get('/multimoora1')
def getMultimooraOne():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM multimoora1")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "idNilai": result[0],
            "idKasus": result[1],
            "idKriteria": result[2],
            "idAlternatif": result[3],
            "idBobot": result[4],
            "idSkala": result[5],
            "nmSkala": result[6],
            "value": result[7],
            "pra": result[8],
        })
    
    return data

@app.get('/multimoora2')
def getMultimooraTwo():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM multimoora2")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "idNilai": result[0],
            "idKasus": result[1],
            "idKriteria": result[2],
            "idAlternatif": result[3],
            "idBobot": result[4],
            "idSkala": result[5],
            "nmSkala": result[6],
            "value": result[7],
            "pra": result[8],
            "normalisasi": result[9],
        })
    
    return data

@app.get('/multimoora3')
def getMultimooraThree():
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM multimoora3")
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "idNilai": result[0],
            "idKasus": result[1],
            "idKriteria": result[2],
            "idAlternatif": result[3],
            "idBobot": result[4],
            "idSkala": result[5],
            "nmSkala": result[6],
            "value": result[7],
            "pra": result[8],
            "normalisasi": result[9],
            "skalaBobot": result[10],
            "valueBobot": result[11],
            "normalisasiBobot": result[12],
        })
    
    return data

@app.get('/multimoora4')
def getMultimooraFour(idKasus: str):
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("""
    SELECT
	multimoora4.hasil,
	alternatif.nmalternatif,
	kasus.nama,
	jenisbencana.nmbencana,
    sub_sektor.nm_sub,
    kasus.kota,
    kasus.provinsi,
    kasus.alamat
    FROM
        multimoora4 
    INNER JOIN alternatif
    ON multimoora4.idalternatif = alternatif.idalternatif
    INNER JOIN kasus
    ON multimoora4.idkasus = kasus.idkasus
    INNER JOIN jenisbencana
    ON kasus.idbencana = jenisbencana.idbencana
    INNER JOIN sub_sektor
    ON sub_sektor.id_sektor = kasus.id_sub
    WHERE multimoora4.idkasus = {}
    ORDER BY
        multimoora4.idkasus DESC,
        multimoora4.hasil DESC 
        LIMIT 1
    """.format(idKasus))

    results = cursor.fetchone()
    conn.close()
    cursor.close()

    return {
            "hasil": results[0],
            "nmAlternatif": results[1],
            "nama": results[2],
            "nmBencana": results[3],
            "nmSub": results[4],
            "kota": results[5],
            "provinsi": results[6],
            "alamat": results[7]
        }

# END View

@app.get('/getkasus')
async def getKasus(nomorWa: str):
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT kasus.*, jenisbencana.nmbencana FROM kasus INNER JOIN jenisbencana ON jenisbencana.idbencana = kasus.idbencana WHERE kasus.nomorWa = {}".format(nomorWa))
    results = cursor.fetchall()
    conn.close()
    cursor.close()
    data = list()
    for result in results:
        data.append({
            "idKasus": result[0],
            "nomorWa": result[1],
            "idBencana": result[2],
            "idSub": result[3],
            "nama": result[4],
            "alamat": result[5],
            "provinsi": result[6],
            "kota": result[7],
            "tanggal": result[8],
            "namaBencana": result[12]
        })
        
    return data
    
# INSERT
@app.post("/storeformpenilaian")
async def storeFormPenilaian(
    nomorWa: str = "62856",
    nmBencana: str = "Cyclone",
    id_sub: int = 1,
    name: str = "namaTerdampak",
    alamat: str = "Malang",
    provinsi: str = "Jawa Timur",
    kota: str = "Malang",
    tanggal: str = "2021-04-25",
    datenow:  Optional[str] = None,
    lat: Optional[str] = None,
    long: Optional[str] = None,
    penilaian: str = '[{"idKriteria":1, "idSkala":1, "namaSkala":"ringan"}, {"idKriteria":2, "idSkala":3,"namaSkala":"berat"}, {"idKriteria":3, "idSkala":2,"namaSkala":"sedang"},{"idKriteria":4, "idSkala":3,"namaSkala":"berat"},{"idKriteria":5, "idSkala":1,"namaSkala":"ringan"}]',
):
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()

    resultJenisBencana = await findJenisBencanaByName(nmBencana)
    penialaianParse = await parsePenialaian(penilaian)
    
    # Insert kasus
    sqlKasus = "INSERT INTO kasus VALUES (null, '{}','{}','{}','{}','{}','{}','{}','{}',null,null,null)".format(nomorWa,
        resultJenisBencana[0],
        id_sub,
        name,
        alamat,
        provinsi,
        kota,
        tanggal)
    
    cursor.execute(sqlKasus)
    conn.commit()
    idKasus = cursor.lastrowid
    
    # Insert Penilaian
    for penilaian in penialaianParse:
        # # GET IdAlternatif
        if(penilaian['namaSkala'] == 'Ringan' or penilaian['namaSkala'] == 'ringan'):
            idAlternatif = 1
            idSkala = 1
        elif(penilaian['namaSkala'] == 'Sedang' or penilaian['namaSkala'] == 'sedang'):
            idAlternatif = 2
            idSkala = 2
        elif(penilaian['namaSkala'] == 'Berat' or penilaian['namaSkala'] == 'berat'):
            idAlternatif = 3
            idSkala = 3

        # GET IdBobot
        sqlBobot = "SELECT * FROM bobot where idkriteria = {}".format(penilaian["idKriteria"])
        cursor.execute(sqlBobot)
        resultBobot = cursor.fetchone()
        idBobot = resultBobot[0]

        # INSERT penilaian
        for item in range(3):
            sqlPenilaian = "INSERT INTO penilaian VALUES (null,'{}','{}','{}','{}','{}')".format(idKasus,penilaian['idKriteria'], idAlternatif, idBobot, idSkala)
            cursor.execute(sqlPenilaian)
            conn.commit()
    
    conn.close()
    cursor.close()
    return {
        "status": True,
        "idKasus": idKasus
    }
    
async def findJenisBencanaByName(nmBencana: str):
    conn = mysql.connector.connect(
        user="root",
        password="rofiulkh",
        host="localhost",
        database="db_bencana"
    )
    cursor = conn.cursor()
    valueNmBencana = nmBencana.split()
    
    sql = "SELECT * FROM jenisbencana WHERE nmbencana LIKE '%{}%' LIMIT 1".format(valueNmBencana[0])
    cursor.execute(sql)
    results = cursor.fetchone()
    conn.close()
    cursor.close()
    return results

async def parsePenialaian(penilaian):
    result = json.loads(penilaian)
    return result