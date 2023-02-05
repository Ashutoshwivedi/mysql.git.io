import mysql.connector

mydb = mysql.connector.connect(
    host = "127.0.0.1",
    user="root",
    password="Pushpa@#816")

print(mydb)

# mycursor = mydb.cursor()

# # print(mycursor.execute("SHOW DATABASES"))
# # print(mycursor.execute("SHOW DATABASES"))

# # mycursor.execute("create database Ourmentor_7th_jan_2023")

# print(mycursor.execute("use topmentor_7th_jan_2023"))
# # mycursor.execute("CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))")

# mycursor = mydb.cursor()

# sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
# val = ("John", "Highway 21")
# mycursor.execute(sql, val)
# mydb.commit()
# print(mycursor.rowcount, "record inserted.")

age_list = []
height_list = []
for i in range(99):
    age_list.append(i)
    height_list.append(i)

print("Age List is : ", age_list)
print("Height List is :", height_list)

# Making the connection
mycursor = mydb.cursor()

mycursor.execute("use topmentor_7th_jan_2023")
mycursor.execute("CREATE TABLE customers_07012023 (Age VARCHAR(255), Height VARCHAR(255))")
for i,j in zip(age_list,height_list):
    sql = "INSERT INTO customers_07012023 (Age, Height) VALUES (%s, %s)"
    val = (i, j)
    mycursor.execute(sql, val)
    mydb.commit()
print(mycursor.rowcount, "record inserted.")

