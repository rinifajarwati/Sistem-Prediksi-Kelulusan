from msilib.schema import File
import numbers
import re
from statistics import mode
from unicodedata import name
from xml.sax.handler import DTDHandler
from flask import Flask, render_template, redirect, request, url_for, session,  flash, send_file
from flask_mysqldb import MySQL, MySQLdb
import flask_excel as excel
import pickle
import numpy as np
from sklearn.svm import SVC
from sklearn import svm
import os
import pandas as pd
import sys
from sklearn.model_selection import train_test_split
from matplotlib import pyplot
import matplotlib.pyplot as plt
from sklearn.metrics import classification_report, confusion_matrix
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
from statsmodels.tsa.stattools import adfuller
from statsmodels.tsa.arima_model import ARIMA
from statsmodels.tsa.stattools import acf
from statsmodels.tsa.arima_model import ARIMA
#import pmdarima as pm
import pickle
from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
from matplotlib.figure import Figure
from flask import Response
import io
import urllib
import base64
import bcrypt
import csv
from openpyxl import load_workbook

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'skripsi2'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)

model1 = pickle.load(open("modelInformatika.pkl", "rb"))
model2 = pickle.load(open("modelIndustri.pkl", "rb"))
model3 = pickle.load(open("modelElektro.pkl", "rb"))
model4 = pickle.load(open("modelKimia.pkl", "rb"))


@app.route("/", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form['email']
        password = request.form['password'].encode('utf-8')

        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM user WHERE email=%s", (email,))
        user = cur.fetchone()
        cur.close()
        if len(user) > 0:
            if bcrypt.hashpw(password, user['password'].encode('utf-8')) == user['password'].encode('utf-8'):
                session['loggedin'] = True
                session['posisi'] = user['posisi']
                session['name'] = user['name']
                session['email'] = user['email']
                return redirect(url_for('dashboard'))
            else:
                flash('Email atau Password salah', 'danger')
        else:
            return render_template("login.html")
    return render_template("login.html")


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        posisi = request.form['posisi']
        password = request.form['password'].encode('utf-8')
        hash_password = bcrypt.hashpw(password, bcrypt.gensalt())

        cur = mysql.connection.cursor()
        cur.execute(
            'SELECT * FROM user WHERE email=%s', (email, ))
        user = cur.fetchone()
        if user is None:
            cur.execute("INSERT INTO user (name,email,password,posisi) VALUES (%s,%s,%s,%s)",
                        (name, email, hash_password, posisi))
            mysql.connection.commit()
            session['name'] = name
            session['email'] = email
            session['posisi'] = posisi
            flash('Registrasi Berhasil', 'success')
            return redirect(url_for("register"))
        else:
            flash('Username atau Email sudah ada', 'danger')
    return render_template('register.html')


@app.route("/user")
def user():
    # make connection to mysql
    cur = mysql.connection.cursor()
    if 'loggedin' in session:
        if session['posisi'] == 'Tata Usaha':
            # Eksekusi query SELECT
            cur.execute("SELECT * FROM user")
            # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
            data = cur.fetchall()

            # menyisipkan data ke tampil_user.html
            return render_template('user.html', user=data)
        else:
            return render_template('404.html')
    return redirect(url_for('login'))


@app.route('/edit_user/<id>', methods=["POST", "GET"])
def edit_user(id):
    if 'loggedin' in session:
        if session['posisi'] == 'Tata Usaha':
            cur = mysql.connection.cursor()
            cur.execute('SELECT * FROM user WHERE id=%s', (id))
            data = cur.fetchone()
            if request.method == 'POST':
                id = request.form['id']
                name = request.form['name']
                password = request.form['password'].encode('utf-8')
                hash_password = bcrypt.hashpw(password, bcrypt.gensalt())
                email = request.form['email']
                posisi = request.form['posisi']

                sql = "UPDATE user SET name=%s, password=%s, email=%s, posisi=%s WHERE id=%s"
                val = (name, hash_password, email, posisi, id)
                cur.execute(sql, val)
                mysql.connection.commit()
                flash('Data berhasil diubah', 'success')
            return render_template('edit_user.html', data=data)
        else:
            flash('Silahkan Login Dahulu', 'danger')
    return redirect(url_for('login'))

# fungsi untuk menghapus data


@app.route('/hapus_user/<id>', methods=['GET', 'POST'])
def hapus_user(id):
    if 'loggedin' in session:
        if session['posisi'] == 'Tata Usaha':
            cur = mysql.connection.cursor()
            cur.execute('DELETE FROM user WHERE id=%s', (id))
            mysql.connection.commit()
            return redirect(url_for('user'))
        else:
            flash('Silahkan Login Dahulu', 'danger')
    return redirect(url_for('login'))


@app.route('/logout')
def logout():
    session.clear()
    return render_template("login.html")


@app.route("/dashboard")
def dashboard():
    return render_template("dashboard.html")


def informatika(cur, data_frame):
    plt.switch_backend('agg')
    df = data_frame
    # Menghapus Index ke-0
    df = df.drop([0, 1])
    # Menghapus Index
    df = df.reset_index(drop=True)
    df.columns = ['yudisium', 'nim', 'nama', 'jurusan', 'tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA', 'KKN', 'lama_penulisan',
                  'thn_masuk', 'thn_lulus_yudisium', 'lama_studi', 'sks', 'ip', 'IPK', 'toefl_ppb', 'toefl_ket', 'tempat_lhr', 'tgl_lhr', 'Kelas']
    def_status = 0
    df.fillna(def_status, inplace=True)
    df = df.loc[:, ["nama", "nim", "jurusan", "thn_masuk",
                    "thn_lulus_yudisium", "lama_studi", "ip", "toefl_ppb", "Kelas"]]

    for index, row in df.iterrows():
        df.loc[index, 'masa studi'] = row['thn_lulus_yudisium']-row['thn_masuk']
    df['masa studi'] = df['masa studi'].astype('str')

    df['ms'] = df['masa studi'].str.replace('days', '').apply(float)
    for index, row in df.iterrows():
        if row['ms'] >= 1278 and row['ms'] <= 1460:
            df.loc[index, 'ms'] = '1'
        else:
            df.loc[index, 'ms'] = '0'

    df['ip'] = df['ip'].astype('float')
    for index, row in df.iterrows():
        if row['ip'] >= 3.51 and row['ip'] <= 4.00:
            df.loc[index, 'IPK'] = '1'
        elif row['ip'] >= 3.01 and row['ip'] < 3.51:
            df.loc[index, 'IPK'] = '2'
        elif row['ip'] >= 2.76 and row['ip'] < 3.00:
            df.loc[index, 'IPK'] = '3'
        else:
            df.loc[index, 'IPK'] = '0'

    df['toefl_ppb'] = df['toefl_ppb'].astype('float')
    for index, row in df.iterrows():
        if row['toefl_ppb'] >= 400:
            df.loc[index, 'Toefl'] = '1'
        else:
            df.loc[index, 'Toefl'] = '0'

    for index, row in df.iterrows():
        if row['Kelas'] == 'Tepat Waktu':
            df.loc[index, 'Kelas'] = '1'
        else:
            df.loc[index, 'Kelas'] = '0'

    df['Kelas'] = df['Kelas'].astype('float')
    df['IPK'] = df['IPK'].astype('float')
    df['ms'] = df['ms'].astype('float')
    df['Toefl'] = df['Toefl'].astype('float')

    data = df.loc[:, ['IPK', 'Toefl', 'ms', 'Kelas']]

    y_predict = model1.predict(data)
    df['class'] = y_predict

    df['Hasil'] = df['class'].replace(
        [0.0, 1.0], ['Tidak Tepat Waktu', 'Tepat Waktu'])

    df = df.loc[:, ["nama", "nim", "jurusan",
                    "masa studi", "ip", "toefl_ppb", "Hasil"]]

    df.to_excel('dataset_svm/Klasifikasi_Infor.xlsx',
                float_format='%.2f', index=None)

    # memasukan hasil ke variabel result
    result = pd.concat([df], axis=1)

    # Menampilkan grafik
    df.Hasil.value_counts().plot(kind='pie', autopct='%1.0f%%')

    plt.savefig('static/img/chartInfor.png', bbox_inches="tight")

    # dataframe to list for insertion
    df_list = result.values.tolist()

    # truncate table for insertion
    cur.execute("TRUNCATE TABLE informatika")
    mysql.connection.commit()

    # insertion clustering result
    sql = "INSERT INTO informatika (nama, nim, jurusan, ms, ipk, toefl, class) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2], row[3], row[4], row[5], row[6])
        cur.execute(sql, val)
    mysql.connection.commit()

    return result


def industri(cur, data_frame):
    plt.switch_backend('agg')
    df = data_frame
    # Menghapus Index ke-0
    df = df.drop([0, 1])
    # Menghapus Index
    df = df.reset_index(drop=True)
    df.columns = ['yudisium', 'nim', 'nama', 'jurusan', 'tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA', 'KKN', 'lama_penulisan',
                  'thn_masuk', 'thn_lulus_yudisium', 'lama_studi', 'sks', 'ip', 'IPK', 'toefl_ppb', 'toefl_ket', 'tempat_lhr', 'tgl_lhr', 'Kelas']
    def_status = 0
    df.fillna(def_status, inplace=True)
    df = df.loc[:, ["nama", "nim", "jurusan", "thn_masuk",
                    "thn_lulus_yudisium", "lama_studi", "ip", "toefl_ppb", "Kelas"]]

    for index, row in df.iterrows():
        df.loc[index, 'masa studi'] = row['thn_lulus_yudisium']-row['thn_masuk']
    df['masa studi'] = df['masa studi'].astype('str')

    df['ms'] = df['masa studi'].str.replace('days', '').apply(float)
    for index, row in df.iterrows():
        if row['ms'] >= 1278 and row['ms'] <= 1460:
            df.loc[index, 'ms'] = '1'
        else:
            df.loc[index, 'ms'] = '0'

    df['ip'] = df['ip'].astype('float')
    for index, row in df.iterrows():
        if row['ip'] >= 3.51 and row['ip'] <= 4.00:
            df.loc[index, 'IPK'] = '1'
        elif row['ip'] >= 3.01 and row['ip'] < 3.51:
            df.loc[index, 'IPK'] = '2'
        elif row['ip'] >= 2.76 and row['ip'] < 3.00:
            df.loc[index, 'IPK'] = '3'
        else:
            df.loc[index, 'IPK'] = '0'

    df['toefl_ppb'] = df['toefl_ppb'].astype('float')
    for index, row in df.iterrows():
        if row['toefl_ppb'] >= 400:
            df.loc[index, 'Toefl'] = '1'
        else:
            df.loc[index, 'Toefl'] = '0'

    for index, row in df.iterrows():
        if row['Kelas'] == 'Tepat Waktu':
            df.loc[index, 'Kelas'] = '1'
        else:
            df.loc[index, 'Kelas'] = '0'

    df['Kelas'] = df['Kelas'].astype('float')
    df['IPK'] = df['IPK'].astype('float')
    df['ms'] = df['ms'].astype('float')
    df['Toefl'] = df['Toefl'].astype('float')

    data = df.loc[:, ['IPK', 'Toefl', 'ms', 'Kelas']]

    y_predict = model2.predict(data)
    df['class'] = y_predict

    df['Hasil'] = df['class'].replace(
        [0.0, 1.0], ['Tidak Tepat Waktu', 'Tepat Waktu'])

    df = df.loc[:, ["nama", "nim", "jurusan",
                    "masa studi", "ip", "toefl_ppb", "Hasil"]]

    df.to_excel('dataset_svm/Klasifikasi_Indus.xlsx',
                float_format='%.2f', index=None)

    # memasukan hasil ke variabel result
    result = pd.concat([df], axis=1)
    print(result)

    # Menampilkan grafik
    df.Hasil.value_counts().plot(kind='pie', autopct='%1.0f%%')

    plt.savefig('static/img/chartIndustri.png', bbox_inches="tight")

    # dataframe to list for insertion
    df_list = result.values.tolist()

    # truncate table for insertion
    cur.execute("TRUNCATE TABLE industri")
    mysql.connection.commit()

    # insertion clustering result
    sql = "INSERT INTO industri (nama, nim, jurusan, ms, ipk, toefl, class) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2], row[3], row[4], row[5], row[6])
        cur.execute(sql, val)
    mysql.connection.commit()

    return result


def elektro(cur, data_frame):
    plt.switch_backend('agg')
    df = data_frame
    # Menghapus Index ke-0
    df = df.drop([0, 1])
    # Menghapus Index
    df = df.reset_index(drop=True)
    df.columns = ['yudisium', 'nim', 'nama', 'jurusan', 'tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA', 'KKN', 'lama_penulisan',
                  'thn_masuk', 'thn_lulus_yudisium', 'lama_studi', 'sks', 'ip', 'IPK', 'toefl_ppb', 'toefl_ket', 'tempat_lhr', 'tgl_lhr', 'Kelas']
    def_status = 0
    df.fillna(def_status, inplace=True)
    df = df.loc[:, ["nama", "nim", "jurusan", "thn_masuk",
                    "thn_lulus_yudisium", "lama_studi", "ip", "toefl_ppb", "Kelas"]]

    for index, row in df.iterrows():
        df.loc[index, 'masa studi'] = row['thn_lulus_yudisium']-row['thn_masuk']
    df['masa studi'] = df['masa studi'].astype('str')

    df['ms'] = df['masa studi'].str.replace('days', '').apply(float)
    for index, row in df.iterrows():
        if row['ms'] >= 1278 and row['ms'] <= 1460:
            df.loc[index, 'ms'] = '1'
        else:
            df.loc[index, 'ms'] = '0'

    df['ip'] = df['ip'].astype('float')
    for index, row in df.iterrows():
        if row['ip'] >= 3.51 and row['ip'] <= 4.00:
            df.loc[index, 'IPK'] = '1'
        elif row['ip'] >= 3.01 and row['ip'] < 3.51:
            df.loc[index, 'IPK'] = '2'
        elif row['ip'] >= 2.76 and row['ip'] < 3.00:
            df.loc[index, 'IPK'] = '3'
        else:
            df.loc[index, 'IPK'] = '0'

    df['toefl_ppb'] = df['toefl_ppb'].astype('float')
    for index, row in df.iterrows():
        if row['toefl_ppb'] >= 400:
            df.loc[index, 'Toefl'] = '1'
        else:
            df.loc[index, 'Toefl'] = '0'

    for index, row in df.iterrows():
        if row['Kelas'] == 'Tepat Waktu':
            df.loc[index, 'Kelas'] = '1'
        else:
            df.loc[index, 'Kelas'] = '0'

    df['Kelas'] = df['Kelas'].astype('float')
    df['IPK'] = df['IPK'].astype('float')
    df['ms'] = df['ms'].astype('float')
    df['Toefl'] = df['Toefl'].astype('float')

    data = df.loc[:, ['IPK', 'Toefl', 'ms', 'Kelas']]

    y_predict = model3.predict(data)
    df['class'] = y_predict

    df['Hasil'] = df['class'].replace(
        [0.0, 1.0], ['Tidak Tepat Waktu', 'Tepat Waktu'])

    df = df.loc[:, ["nama", "nim", "jurusan",
                    "masa studi", "ip", "toefl_ppb", "Hasil"]]

    df.to_excel('dataset_svm/Klasifikasi_Elektro.xlsx',
                float_format='%.2f', index=None)

    # memasukan hasil ke variabel result
    result = pd.concat([df], axis=1)
    # Menampilkan grafik
    df.Hasil.value_counts().plot(kind='pie', autopct='%1.0f%%')

    plt.savefig('static/img/chartElektro.png', bbox_inches="tight")

    # dataframe to list for insertion
    df_list = result.values.tolist()

    # truncate table for insertion
    cur.execute("TRUNCATE TABLE elektro")
    mysql.connection.commit()

    # insertion clustering result
    sql = "INSERT INTO elektro (nama, nim, jurusan, ms, ipk, toefl, class) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2], row[3], row[4], row[5], row[6])
        cur.execute(sql, val)
    mysql.connection.commit()

    return result


def kimia(cur, data_frame):
    plt.switch_backend('agg')
    # df = data_frame
    # # Menghapus Index ke-0
    # df = df.drop([0, 1])
    # # Menghapus Index
    # df = df.reset_index(drop=True)
    # df.columns = ['yudisium','nim','nama','jurusan','tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA','KKN','lama_penulisan','thn_masuk','thn_lulus_yudisium','lama_studi','sks','ip','IPK','toefl_ppb','toefl_ket','tempat_lhr','tgl_lhr','Kelas']
    # def_status = 0
    # df.fillna(def_status, inplace = True)
    # df = df.loc[:, ["nama", "nim", "jurusan", "thn_masuk",
    #                 "thn_lulus_yudisium", "lama_studi", "sks", "ip", "toefl_ppb", "Kelas"]]

    # for index, row in df.iterrows():
    #     df.loc[index, 'masa studi'] = row['thn_lulus_yudisium']-row['thn_masuk']
    # df['masa studi'] = df['masa studi'].astype('str')

    # df['ms'] = df['masa studi'].str.replace('days', '').apply(float)
    # for index, row in df.iterrows():
    #     if row['ms'] >= 1278 and row['ms'] <= 1460:
    #         df.loc[index, 'ms'] = '1'
    #     else:
    #         df.loc[index, 'ms'] = '0'

    # df['ip'] = df['ip'].astype('float')
    # for index, row in df.iterrows():
    #     if row['ip'] >= 3.51 and row['ip'] <= 4.00:
    #         df.loc[index, 'IPK'] = '1'
    #     elif row['ip'] >= 3.01 and row['ip'] < 3.51:
    #         df.loc[index, 'IPK'] = '2'
    #     elif row['ip'] >= 2.76 and row['ip'] < 3.00:
    #         df.loc[index, 'IPK'] = '3'
    #     else:
    #         df.loc[index, 'IPK'] = '0'

    # df['toefl_ppb'] = df['toefl_ppb'].astype('float')
    # for index, row in df.iterrows():
    #     if row['toefl_ppb'] >= 400:
    #         df.loc[index, 'Toefl'] = '1'
    #     else:
    #         df.loc[index, 'Toefl'] = '0'

    # for index, row in df.iterrows():
    #     if row['Kelas'] == 'Tepat Waktu':
    #         df.loc[index, 'Kelas'] = '1'
    #     else:
    #         df.loc[index, 'Kelas'] = '0'

    # for index, row in df.iterrows():
    #     if row['sks'] > 130:
    #         df.loc[index, 'SKS'] = '1'
    #     elif row['sks'] > 70 and row['sks'] <= 130:
    #         df.loc[index, 'SKS'] = '2'
    #     elif row['sks'] > 20 and row['sks'] <= 70:
    #         df.loc[index, 'SKS'] = '3'
    #     else:
    #         df.loc[index, 'SKS'] = '0'

    # df['Kelas'] = df['Kelas'].astype('float')
    # df['IPK'] = df['IPK'].astype('float')
    # df['SKS'] = df['SKS'].astype('float')
    # df['ms'] = df['ms'].astype('float')
    # df['Toefl'] = df['Toefl'].astype('float')

    # data = df.loc[:, ['SKS', 'IPK', 'Toefl', 'ms', 'Kelas']]

    # y_predict = model4.predict(data)
    # df['class'] = y_predict

    # df['Hasil'] = df['class'].replace(
    #     [0.0, 1.0], ['Tidak Tepat Waktu', 'Tepat Waktu'])

    # df = df.loc[:, ["nama", "nim", "jurusan",
    #                 "masa studi", "sks", "ip", "toefl_ppb", "Hasil"]]
    df = pd.read_excel("kimia2018-2020.xlsx", header=None)
    df = df.drop([0, 1])
    # Menghapus Index
    df = df.reset_index(drop=True)
    df.columns = ['yudisium', 'nim', 'nama', 'jurusan', 'tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA', 'KKN', 'lama_penulisan',
                  'thn_masuk', 'thn_lulus_yudisium', 'lama_studi', 'sks', 'ip', 'IPK', 'toefl_ppb', 'toefl_ket', 'tempat_lhr', 'tgl_lhr', 'Kelas']

    def_status = 0
    df.fillna(def_status, inplace=True)
    df = df.loc[:, ["nama", "nim", "jurusan", "thn_masuk",
                    "thn_lulus_yudisium", "lama_studi", "ip", "toefl_ppb", "Kelas"]]

    for index, row in df.iterrows():
        df.loc[index, 'masa studi'] = row['thn_lulus_yudisium']-row['thn_masuk']
    df['masa studi'] = df['masa studi'].astype('str')
    df['ms'] = df['masa studi'].str.replace('days', '').apply(float)

    for index, row in df.iterrows():
        if row['ms'] >= 1278 and row['ms'] <= 1460:
            df.loc[index, 'ms'] = '1'
        else:
            df.loc[index, 'ms'] = '0'

    df['ip'] = df['ip'].astype('float')

    for index, row in df.iterrows():
        if row['ip'] >= 3.51 and row['ip'] <= 4.00:
            df.loc[index, 'IPK'] = '1'
        elif row['ip'] >= 3.01 and row['ip'] < 3.51:
            df.loc[index, 'IPK'] = '2'
        elif row['ip'] >= 2.76 and row['ip'] < 3.00:
            df.loc[index, 'IPK'] = '3'
        else:
            df.loc[index, 'IPK'] = '0'

    df['toefl_ppb'] = df['toefl_ppb'].astype('float')

    for index, row in df.iterrows():
        if row['toefl_ppb'] >= 400:
            df.loc[index, 'Toefl'] = '1'
        else:
            df.loc[index, 'Toefl'] = '0'

    for index, row in df.iterrows():
        if row['Kelas'] == 'Tepat Waktu':
            df.loc[index, 'Kelas'] = '1'
        else:
            df.loc[index, 'Kelas'] = '0'

    df['Kelas'] = df['Kelas'].astype('float')
    df['IPK'] = df['IPK'].astype('float')
    df['ms'] = df['ms'].astype('float')
    df['Toefl'] = df['Toefl'].astype('float')

    data = df.loc[:, ['IPK', 'Toefl', 'ms', 'Kelas']]
    x = data.drop(["Kelas"], axis=1)
    y = data["Kelas"]

    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.20)
    classifier = svm.SVC(kernel='linear')
    classifier.fit(x_train, y_train)
    y_predict = classifier.predict(x_test)

    df1 = data_frame
    # Menghapus Index ke-0
    df1 = df1.drop([0, 1])
    df1.to_excel('dataset_svm/Klasifikasi_Kimia.xlsx',
                 float_format='%.2f', index=None)
    df1 = df1.reset_index(drop=True)
    df1.columns = ['yudisium', 'nim', 'nama', 'jurusan', 'tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA', 'KKN', 'lama_penulisan',
                   'thn_masuk', 'thn_lulus_yudisium', 'lama_studi', 'sks', 'ip', 'IPK', 'toefl_ppb', 'toefl_ket', 'tempat_lhr', 'tgl_lhr', 'Kelas']
    def_status = 0
    df1.fillna(def_status, inplace=True)
    for index, row in df1.iterrows():
        df1.loc[index, 'masa studi'] = row['thn_lulus_yudisium']-row['thn_masuk']
    df1['masa studi'] = df1['masa studi'].astype('str')
    df1['ms'] = df1['masa studi'].str.replace('days', '').apply(float)
    for index, row in df1.iterrows():
        if row['ms'] >= 1278 and row['ms'] <= 1460:
            df1.loc[index, 'ms'] = '1'
        else:
            df1.loc[index, 'ms'] = '0'

    df1['ip'] = df1['ip'].astype('float')
    for index, row in df1.iterrows():
        if row['ip'] >= 3.51 and row['ip'] <= 4.00:
            df1.loc[index, 'IPK'] = '1'
        elif row['ip'] >= 3.01 and row['ip'] < 3.51:
            df1.loc[index, 'IPK'] = '2'
        elif row['ip'] >= 2.76 and row['ip'] < 3.00:
            df1.loc[index, 'IPK'] = '3'
        else:
            df1.loc[index, 'IPK'] = '0'

    df1['toefl_ppb'] = df1['toefl_ppb'].astype('float')
    for index, row in df1.iterrows():
        if row['toefl_ppb'] >= 400:
            df1.loc[index, 'Toefl'] = '1'
        else:
            df1.loc[index, 'Toefl'] = '0'

    data2 = df1.loc[:, ['IPK', 'Toefl', 'ms']]
    X = data2
    Y = classifier.predict(X)
    data2['pred'] = Y
    y_pred2 = data2.loc[:40, ['pred']].values
    # df1['Hasil'] = data2['pred'].replace([0.0,1.0], ['Tidak Lulus Tepat Waktu', 'Lulus Tepat Waktu'])
    df1['Hasil'] = data2['pred'].replace(
        [0.0, 1.0], ['Tidak Tepat Waktu', 'Tepat Waktu'])
    df1 = df1.loc[:, ["nama", "nim", "jurusan",
                      "masa studi", "ip", "toefl_ppb", "Hasil"]]

    # memasukan hasil ke variabel result
    result = pd.concat([df1], axis=1)

    # Menampilkan grafik
    df1.Hasil.value_counts().plot(kind='pie', autopct='%1.0f%%')

    plt.savefig('static/img/chartKimia.png', bbox_inches="tight")

    # dataframe to list for insertion
    df_list = result.values.tolist()

    # truncate table for insertion
    cur.execute("TRUNCATE TABLE kimia")
    mysql.connection.commit()

    # insertion clustering result
    sql = "INSERT INTO kimia (nama, nim, jurusan, ms, ipk, toefl, class) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2], row[3], row[4], row[5], row[6])
        cur.execute(sql, val)
    mysql.connection.commit()

    return result


@app.route("/klasifikasi", methods=["POST", "GET"])
def klasifikasi():
    if 'loggedin' in session:
        if session['posisi'] == 'Tata Usaha':

            cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

            if request.method == 'GET':
                return render_template('klasifikasi.html')

            elif request.method == 'POST':
                excel_file = request.files["file"]
                df = pd.read_excel(excel_file)
                dataset_type = request.form["datasetType"]

                if dataset_type == 'Informatika':
                    result = informatika(cur, df)

                elif dataset_type == 'Teknik Industri':
                    result = industri(cur, df)

                elif dataset_type == 'Teknik Elektro':
                    result = elektro(cur, df)

                elif dataset_type == 'Teknik Kimia':
                    result = kimia(cur, df)

                else:
                    return render_template('404.html')

                hasil = result.to_html(classes='table', justify='center').replace(
                    "<thead>", "<thead class='thead-primary table-hover'>")

                # menyisipkan data ke hasil_cluster
                return render_template('result.html', hasil=hasil)
            else:
                return render_template('klasifikasi.html')
        else:
            return render_template('404.html')
    flash('Silahkan Login Dahulu', 'danger')
    return redirect(url_for('login'))


@app.route("/result")
def result():
    return render_template("result.html")


@app.route("/Result_Prediksi")
def Result_Prediksi():
    return render_template("Result_Prediksi.html")


@app.route("/hsl_klasifikasi_infor")
def hsl_klasifikasi_infor():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM informatika")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    # menyisipkan data ke tampil_user.html

    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM informatika WHERE class = 'Tidak Tepat Waktu'")
    data0 = cur.fetchone()
    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM informatika WHERE class = 'Tepat Waktu'")
    data1 = cur.fetchone()

    # menyisipkan data ke tampil_user.html
    return render_template('hsl_klasifikasi_infor.html', data=data, data0=data0, data1=data1)


@app.route("/hsl_klasifikasi_indus")
def hsl_klasifikasi_indus():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM industri")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM industri WHERE class = 'Tidak Tepat Waktu'")
    data0 = cur.fetchone()
    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM industri WHERE class = 'Tepat Waktu'")
    data1 = cur.fetchone()

    # menyisipkan data ke tampil_user.html
    return render_template('hsl_klasifikasi_indus.html', data=data, data0=data0, data1=data1)


@app.route("/hsl_klasifikasi_elektro")
def hsl_klasifikasi_elektro():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM elektro")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM elektro WHERE class = 'Tidak Tepat Waktu'")
    data0 = cur.fetchone()
    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM elektro WHERE class = 'Tepat Waktu'")
    data1 = cur.fetchone()

    # menyisipkan data ke tampil_user.html
    return render_template('hsl_klasifikasi_elektro.html', data=data, data0=data0, data1=data1)


@app.route("/hsl_klasifikasi_kimia")
def hsl_klasifikasi_kimia():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM kimia")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM kimia WHERE class = 'Tidak Tepat Waktu'")
    data0 = cur.fetchone()
    cur.execute(
        "SELECT COUNT(*) as Jumlah FROM kimia WHERE class = 'Tepat Waktu'")
    data1 = cur.fetchone()

    # menyisipkan data ke tampil_user.html
    return render_template('hsl_klasifikasi_kimia.html', data=data, data0=data0, data1=data1)


def pred_infor(cur, data_frame):
    plt.switch_backend('agg')
    df = data_frame
    df.columns = ['yudisium', 'nim', 'nama', 'jurusan', 'tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA', 'KKN', 'lama_penulisan',
                  'thn_masuk', 'thn_lulus_yudisium', 'lama_studi', 'sks', 'ip', 'IPK', 'toefl_ppb', 'toefl_ket', 'tempat_lhr', 'tgl_lhr']
    df = df.drop(0)
    df = df.drop(1)
    df = df.reset_index(drop=True)
    def_status = 0
    df.fillna(def_status, inplace=True)
    df.head()
    df.dtypes
    df = df.loc[:, ["thn_masuk", "thn_lulus_yudisium", "lama_studi"]]
    df['thn'] = df.thn_lulus_yudisium.dt.strftime('%Y')
    for index, row in df.iterrows():
        df.loc[index, 'masa studi'] = row['thn_lulus_yudisium'] - \
            row['thn_masuk']
    df['masa studi'] = df['masa studi'].astype('str')
    df['ms'] = df['masa studi'].str.replace('days', '').apply(float)
    df = df.loc[:, ["ms", "thn"]]
    df = df.loc[df['ms'] <= 1460]
    df.dtypes
    df = df.value_counts().to_frame('freq')
    df = df.reset_index()

    # PLT Standar resudal
    # state2 = plt.plot(df.freq)
    from statsmodels.tsa.arima_model import ARIMA
    import pmdarima as pm
    import pandas.util.testing as tm
    model = pm.auto_arima(df.freq, start_p=1, start_q=1,
                          test='adf',       # use adftest to find optimal 'd'
                          max_p=3, max_q=3,  # maximum p and q
                          m=1,              # frequency of series
                          d=None,           # let model determine 'd'
                          seasonal=False,   # No Seasonality
                          start_P=0,
                          D=0,
                          trace=True,
                          error_action='ignore',
                          suppress_warnings=True,
                          stepwise=True)
    # model.plot_diagnostics(figsize=(7, 5))
    print(model.summary())
    # Forecast
    n_periods = 30
    fc, confint = model.predict(n_periods=n_periods, return_conf_int=True)
    index_of_fc = np.arange(len(df.freq), len(df.freq)+n_periods)

    # make series for plotting purpose
    fc_series = pd.Series(fc, index=index_of_fc)
    lower_series = pd.Series(confint[:, 0], index=index_of_fc)
    upper_series = pd.Series(confint[:, 1], index=index_of_fc)

    # Plot
    plt.plot(df.freq)
    plt.plot(fc_series, color='darkgreen')
    plt.fill_between(lower_series.index,
                     lower_series,
                     upper_series,
                     color='k', alpha=.15)

    plt.title("Final Forecast of databaru")
    # memasukan hasil ke variabel result
    Result_Prediksi = pd.concat([df])

    # Menampilkan grafik
    plt.savefig('static/img/chartPredInfor.png', bbox_inches="tight")

    # dataframe to list for insertion
    df_list = Result_Prediksi.values.tolist()

    # truncate table for insertion
    cur.execute("TRUNCATE TABLE pred_infor")
    mysql.connection.commit()

    # insertion clustering result
    sql = "INSERT INTO pred_infor (ms, thn, freq) VALUES (%s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2])
        cur.execute(sql, val)
    mysql.connection.commit()

    return Result_Prediksi


def pred_industri(cur, data_frame):
    plt.switch_backend('agg')
    df = data_frame
    df.columns = ['yudisium', 'nim', 'nama', 'jurusan', 'tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA', 'KKN', 'lama_penulisan',
                  'thn_masuk', 'thn_lulus_yudisium', 'lama_studi', 'sks', 'ip', 'IPK', 'toefl_ppb', 'toefl_ket', 'tempat_lhr', 'tgl_lhr']
    df = df.drop(0)
    df = df.drop(1)
    df = df.reset_index(drop=True)
    def_status = 0
    df.fillna(def_status, inplace=True)
    df.head()
    df.dtypes
    df = df.loc[:, ["thn_masuk", "thn_lulus_yudisium", "lama_studi"]]
    df['thn'] = df.thn_lulus_yudisium.dt.strftime('%Y')
    for index, row in df.iterrows():
        df.loc[index, 'masa studi'] = row['thn_lulus_yudisium'] - \
            row['thn_masuk']
    df['masa studi'] = df['masa studi'].astype('str')
    df['ms'] = df['masa studi'].str.replace('days', '').apply(float)
    df = df.loc[:, ["ms", "thn"]]
    df = df.loc[df['ms'] <= 1460]
    df.dtypes
    df = df.value_counts().to_frame('freq')
    df = df.reset_index()

    # PLT Standar resudal
    # state2 = plt.plot(df.freq)
    from statsmodels.tsa.arima_model import ARIMA
    import pmdarima as pm
    import pandas.util.testing as tm
    model = pm.auto_arima(df.freq, start_p=1, start_q=1,
                          test='adf',       # use adftest to find optimal 'd'
                          max_p=3, max_q=3,  # maximum p and q
                          m=1,              # frequency of series
                          d=None,           # let model determine 'd'
                          seasonal=False,   # No Seasonality
                          start_P=0,
                          D=0,
                          trace=True,
                          error_action='ignore',
                          suppress_warnings=True,
                          stepwise=True)
    # model.plot_diagnostics(figsize=(7, 5))
    print(model.summary())
    # Forecast
    n_periods = 30
    fc, confint = model.predict(n_periods=n_periods, return_conf_int=True)
    index_of_fc = np.arange(len(df.freq), len(df.freq)+n_periods)

    # make series for plotting purpose
    fc_series = pd.Series(fc, index=index_of_fc)
    lower_series = pd.Series(confint[:, 0], index=index_of_fc)
    upper_series = pd.Series(confint[:, 1], index=index_of_fc)

    # Plot
    plt.plot(df.freq)
    plt.plot(fc_series, color='darkgreen')
    plt.fill_between(lower_series.index,
                     lower_series,
                     upper_series,
                     color='k', alpha=.15)

    plt.title("Final Forecast of databaru")
    # memasukan hasil ke variabel result
    Result_Prediksi = pd.concat([df])

    # Menampilkan grafik

    plt.savefig('static/img/chartPredIndustri.png', bbox_inches="tight")

    # dataframe to list for insertion
    df_list = Result_Prediksi.values.tolist()

    # truncate table for insertion
    cur.execute("TRUNCATE TABLE pred_industri")
    mysql.connection.commit()

    # insertion clustering result
    sql = "INSERT INTO pred_industri (ms, thn, freq) VALUES (%s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2])
        cur.execute(sql, val)
    mysql.connection.commit()

    return Result_Prediksi


def pred_elektro(cur, data_frame):
    plt.switch_backend('agg')
    df = data_frame
    df.columns = ['yudisium', 'nim', 'nama', 'jurusan', 'tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA', 'KKN', 'lama_penulisan',
                  'thn_masuk', 'thn_lulus_yudisium', 'lama_studi', 'sks', 'ip', 'IPK', 'toefl_ppb', 'toefl_ket', 'tempat_lhr', 'tgl_lhr']
    df = df.drop(0)
    df = df.drop(1)
    df = df.reset_index(drop=True)
    def_status = 0
    df.fillna(def_status, inplace=True)
    df.head()
    df.dtypes
    df = df.loc[:, ["thn_masuk", "thn_lulus_yudisium", "lama_studi"]]
    df['thn'] = df.thn_lulus_yudisium.dt.strftime('%Y')
    for index, row in df.iterrows():
        df.loc[index, 'masa studi'] = row['thn_lulus_yudisium'] - \
            row['thn_masuk']
    df['masa studi'] = df['masa studi'].astype('str')
    df['ms'] = df['masa studi'].str.replace('days', '').apply(float)
    df = df.loc[:, ["ms", "thn"]]
    df = df.loc[df['ms'] <= 1460]
    df.dtypes
    df = df.value_counts().to_frame('freq')
    df = df.reset_index()

    # PLT Standar resudal
    # state2 = plt.plot(df.freq)
    from statsmodels.tsa.arima_model import ARIMA
    import pmdarima as pm
    import pandas.util.testing as tm
    model = pm.auto_arima(df.freq, start_p=1, start_q=1,
                          test='adf',       # use adftest to find optimal 'd'
                          max_p=3, max_q=3,  # maximum p and q
                          m=1,              # frequency of series
                          d=None,           # let model determine 'd'
                          seasonal=False,   # No Seasonality
                          start_P=0,
                          D=0,
                          trace=True,
                          error_action='ignore',
                          suppress_warnings=True,
                          stepwise=True)
    # model.plot_diagnostics(figsize=(7, 5))
    print(model.summary())
    # Forecast
    n_periods = 30
    fc, confint = model.predict(n_periods=n_periods, return_conf_int=True)
    index_of_fc = np.arange(len(df.freq), len(df.freq)+n_periods)

    # make series for plotting purpose
    fc_series = pd.Series(fc, index=index_of_fc)
    lower_series = pd.Series(confint[:, 0], index=index_of_fc)
    upper_series = pd.Series(confint[:, 1], index=index_of_fc)

    # Plot
    plt.plot(df.freq)
    plt.plot(fc_series, color='darkgreen')
    plt.fill_between(lower_series.index,
                     lower_series,
                     upper_series,
                     color='k', alpha=.15)

    plt.title("Final Forecast of databaru")
    # memasukan hasil ke variabel result
    Result_Prediksi = pd.concat([df])
    # Menampilkan grafik
    plt.savefig('static/img/chartPredElektro.png', bbox_inches="tight")
    # dataframe to list for insertion
    df_list = Result_Prediksi.values.tolist()

    # truncate table for insertion
    cur.execute("TRUNCATE TABLE pred_elektro")
    mysql.connection.commit()

    # insertion clustering result
    sql = "INSERT INTO pred_elektro (ms, thn, freq) VALUES (%s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2])
        cur.execute(sql, val)
    mysql.connection.commit()

    return Result_Prediksi


def pred_kimia(cur, data_frame):
    plt.switch_backend('agg')
    df = data_frame
    df.columns = ['yudisium', 'nim', 'nama', 'jurusan', 'tgl_seminar_TA', 'tgl_acc_pemb', 'penulisan', 'TA', 'KKN', 'lama_penulisan',
                  'thn_masuk', 'thn_lulus_yudisium', 'lama_studi', 'sks', 'ip', 'IPK', 'toefl_ppb', 'toefl_ket', 'tempat_lhr', 'tgl_lhr']
    df = df.drop(0)
    df = df.drop(1)
    df = df.reset_index(drop=True)
    def_status = 0
    df.fillna(def_status, inplace=True)
    df.head()
    df.dtypes
    df = df.loc[:, ["thn_masuk", "thn_lulus_yudisium", "lama_studi"]]
    df['thn'] = df.thn_lulus_yudisium.dt.strftime('%Y')
    for index, row in df.iterrows():
        df.loc[index, 'masa studi'] = row['thn_lulus_yudisium'] - \
            row['thn_masuk']
    df['masa studi'] = df['masa studi'].astype('str')
    df['ms'] = df['masa studi'].str.replace('days', '').apply(float)
    df = df.loc[:, ["ms", "thn"]]
    df = df.loc[df['ms'] <= 1460]
    df.dtypes
    df = df.value_counts().to_frame('freq')
    df = df.reset_index()

    # PLT Standar resudal
    # state2 = plt.plot(df.freq)
    from statsmodels.tsa.arima_model import ARIMA
    import pmdarima as pm
    import pandas.util.testing as tm
    model = pm.auto_arima(df.freq, start_p=1, start_q=1,
                          test='adf',       # use adftest to find optimal 'd'
                          max_p=3, max_q=3,  # maximum p and q
                          m=1,              # frequency of series
                          d=None,           # let model determine 'd'
                          seasonal=False,   # No Seasonality
                          start_P=0,
                          D=0,
                          trace=True,
                          error_action='ignore',
                          suppress_warnings=True,
                          stepwise=True)
    # model.plot_diagnostics(figsize=(7, 5))
    print(model.summary())
    # Forecast
    n_periods = 30
    fc, confint = model.predict(n_periods=n_periods, return_conf_int=True)
    index_of_fc = np.arange(len(df.freq), len(df.freq)+n_periods)

    # make series for plotting purpose
    fc_series = pd.Series(fc, index=index_of_fc)
    lower_series = pd.Series(confint[:, 0], index=index_of_fc)
    upper_series = pd.Series(confint[:, 1], index=index_of_fc)

    # Plot
    plt.plot(df.freq)
    plt.plot(fc_series, color='darkgreen')
    plt.fill_between(lower_series.index,
                     lower_series,
                     upper_series,
                     color='k', alpha=.15)

    plt.title("Final Forecast of databaru")
    # memasukan hasil ke variabel result
    Result_Prediksi = pd.concat([df])

    # Menampilkan grafik

    plt.savefig('static/img/chartPredKimia.png', bbox_inches="tight")

    # dataframe to list for insertion
    df_list = Result_Prediksi.values.tolist()

    # truncate table for insertion
    cur.execute("TRUNCATE TABLE pred_kimia")
    mysql.connection.commit()

    # insertion clustering result
    sql = "INSERT INTO pred_kimia (ms, thn, freq) VALUES (%s, %s, %s)"
    for row in df_list:
        val = (row[0], row[1], row[2])
        cur.execute(sql, val)
    mysql.connection.commit()

    return Result_Prediksi


@app.route("/prediksi", methods=["POST", "GET"])
def prediksi():
    if 'loggedin' in session:
        if session['posisi'] == 'Tata Usaha':

            cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

            if request.method == 'GET':
                return render_template('prediksi.html')

            elif request.method == 'POST':
                excel_file = request.files["file"]
                df = pd.read_excel(excel_file)
                dataset_type = request.form["datasetType"]

                if dataset_type == 'Informatika':
                    Result_Prediksi = pred_infor(cur, df)

                elif dataset_type == 'Teknik Industri':
                    Result_Prediksi = pred_industri(cur, df)

                elif dataset_type == 'Teknik Elektro':
                    Result_Prediksi = pred_elektro(cur, df)

                elif dataset_type == 'Teknik Kimia':
                    Result_Prediksi = pred_kimia(cur, df)

                else:
                    return render_template('404.html')

                hasil = Result_Prediksi.to_html(classes='table', justify='center').replace(
                    "<thead>", "<thead class='thead-primary table-hover'>")

                # menyisipkan data ke hasil_cluster
                return render_template('Result_prediksi.html', hasil=hasil)
            else:
                return render_template('prediksi.html')
        else:
            return render_template('404.html')
    flash('Silahkan Login Dahulu', 'danger')
    return redirect(url_for('login'))


@app.route("/hsl_pred_infor")
def hsl_pred_infor():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM pred_infor")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    # menyisipkan data ke tampil_user.html
    return render_template('hsl_pred_infor.html', data=data)


@app.route("/hsl_pred_industri")
def hsl_pred_industri():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM pred_industri")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    # menyisipkan data ke tampil_user.html
    return render_template('hsl_pred_industri.html', data=data)


@app.route("/hsl_pred_elektro")
def hsl_pred_elektro():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM pred_elektro")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    # menyisipkan data ke tampil_user.html
    return render_template('hsl_pred_elektro.html', data=data)


@app.route("/hsl_pred_kimia")
def hsl_pred_kimia():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    # Eksekusi query SELECT
    cur.execute("SELECT * FROM pred_kimia")
    # Mengambil hasil eksekusi query dan menyimpannya dalam variabel data
    data = cur.fetchall()

    # menyisipkan data ke tampil_user.html
    return render_template('hsl_pred_kimia.html', data=data)


@app.route("/404")
def error():
    return render_template("404.html")


# @app.route('/downloads')
# def download():


@app.route('/download/report_informatika/csv')
def download():
    # path = 'samplefile.pdf'
    # return send_file(path, as_attachment=True)
    # conn = None
    cur = None
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM informatika")
        result = cur.fetchall()

        output = io.StringIO()
        writer = csv.writer(output)

        line = ['id_infor,nama,nim,jurusan,ms,sks,ipk,toefl,class']
        writer.writerow(line)

        for row in result:
            line = [str(row['id_infor']) + ',' + row['nama'] + ',' + row['nim'] + ',' + row['jurusan'] +
                    ',' + row['ms'] + ',' + row['sks'] + ',' + row['ipk'] + ',' + row['toefl'] + ',' + row['class']]
            writer.writerow(line)

        output.seek(0)

        return Response(output, mimetype="text/csv", headers={"Content-Disposition": "attachment;filename=Klasisfikasi_infor_Report.csv"})
    except Exception as e:
        print(e)
    finally:
        cur.close()
    return render_template('download.html')


@app.route('/download/report_elektro/csv')
def download_elektro():
    # path = 'samplefile.pdf'
    # return send_file(path, as_attachment=True)
    # conn = None
    cur = None
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM elektro")
        result = cur.fetchall()

        output = io.StringIO()
        writer = csv.writer(output)

        line = ['id_elektro,nama,nim,jurusan,ms,sks,ipk,toefl,class']
        writer.writerow(line)

        for row in result:
            line = [str(row['id_elektro']) + ',' + row['nama'] + ',' + row['nim'] + ',' + row['jurusan'] +
                    ',' + row['ms'] + ',' + row['sks'] + ',' + row['ipk'] + ',' + row['toefl'] + ',' + row['class']]
            writer.writerow(line)

        output.seek(0)
        return Response(output, mimetype="text/csv", headers={"Content-Disposition": "attachment;filename=Klasisfikasi_elektro_Report.csv"})
    except Exception as e:
        print(e)
    finally:
        cur.close()
    return render_template('download_elektro.html')


@app.route('/download/report_kimia/csv')
def download_kimia():
    # path = 'samplefile.pdf'
    # return send_file(path, as_attachment=True)
    # conn = None
    cur = None
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM kimia")
        result = cur.fetchall()

        output = io.StringIO()
        writer = csv.writer(output)

        line = ['id_kimia,nama,nim,jurusan,ms,sks,ipk,toefl,class']
        writer.writerow(line)

        for row in result:
            line = [str(row['id_kimia']) + ',' + row['nama'] + ',' + row['nim'] + ',' + row['jurusan'] +
                    ',' + row['ms'] + ',' + row['sks'] + ',' + row['ipk'] + ',' + row['toefl'] + ',' + row['class']]
            writer.writerow(line)

        output.seek(0)
        return Response(output, mimetype="text/csv", headers={"Content-Disposition": "attachment;filename=Klasisfikasi_kimia_Report.csv"})
    except Exception as e:
        print(e)
    finally:
        cur.close()
    # return render_template('download_elektro.html')


@app.route('/download/report_industri/csv')
def download_industri():
    # path = 'samplefile.pdf'
    # return send_file(path, as_attachment=True)
    # conn = None
    cur = None
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM industri")
        result = cur.fetchall()

        output = io.StringIO()
        writer = csv.writer(output)

        line = ['id_indus,nama,nim,jurusan,ms,sks,ipk,toefl,class']
        writer.writerow(line)

        for row in result:
            line = [str(row['id_indus']) + ',' + row['nama'] + ',' + row['nim'] + ',' + row['jurusan'] +
                    ',' + row['ms'] + ',' + row['sks'] + ',' + row['ipk'] + ',' + row['toefl'] + ',' + row['class']]
            writer.writerow(line)

        output.seek(0)
        return Response(output, mimetype="text/csv", headers={"Content-Disposition": "attachment;filename=Klasisfikasi_industri_Report.csv"})
    except Exception as e:
        print(e)
    finally:
        cur.close()
    return render_template('download_industri.html')


if __name__ == "__main__":
    app.secret_key = "skripsi"
    app.run(debug=True)
