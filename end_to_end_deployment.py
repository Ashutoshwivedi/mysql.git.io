import numpy as mp
import pandas as pd
import mysql.connector
import mysql.connector
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.linear_model import LinearRegression
from sklearn.neighbors import KNeighborsRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import AdaBoostRegressor
from sklearn.ensemble import BaggingRegressor
from flask import session
from flask import Flask
from flask_restful import reqparse, Resource, Api
from flask import session
from flask import request, jsonify


mydb = mysql.connector.connect(
    host = "127.0.0.1",
    user="root",
    database = "topmentor_7th_jan_2023",
    password="Maakiankh@023")

print(mydb)

# data = pd.read_csv("real_estate_data.csv")
# print(data.head())
# print("The Data Columns are: ", data.columns)

# columns_list = ['No', 'X1 transaction date', 'X2 house age',
#                 'X3 distance to the nearest MRT station',
#                 'X4 number of convenience stores', 'X5 latitude', 'X6 longitude',
#                 'Y house price of unit area']

# print("Create table real_estate (No VARCHAR(255), X1 transaction date VARCHAR(255),X2 house age VARCHAR(255),X3 distance to the nearest MRT station  VARCHAR(255) ,X4 number of convenience stores varchar(255), X5 latitude varchar(255),X6 longitude varchar(255),Y house price of unit area varchar(255)")
# mycursor = mydb.cursor()
# mycursor.execute("use topmentor_7th_jan_2023")

# for i,j,k,l,m,n,o,p in zip(data["No"],data['X1 transaction date'],data['X2 house age'],data['X3 distance to the nearest MRT station'],data['X4 number of convenience stores'],data['X5 latitude'],data['X6 longitude'],data['Y house price of unit area']):
#     # print(data[i])
#     sql = "INSERT INTO real_estate (serial_number,X1_transaction_date,X2_house_age,X3_distance_to_the_nearest_MRT_station,X4_number_of_convenience_stores,X5_latitude ,X6_longitude,Y_house_price_of_unit_area) VALUES (%s, %s,%s, %s,%s, %s,%s, %s)"
#     val = (i,j,k,l,m,n,o,p)
#     mycursor.execute(sql, val)
#     mydb.commit()
#     print(mycursor.rowcount, "record inserted.")

# mycursor.execute("CREATE TABLE customers_07012023 (Age VARCHAR(255), Height VARCHAR(255))")
# for i,j in zip(age_list,height_list):
#     sql = "INSERT INTO customers_07012023 (Age, Height) VALUES (%s, %s)"
#     val = (i, j)
#     mycursor.execute(sql, val)
#     mydb.commit()
# print(mycursor.rowcount, "record inserted.")


# data = pd.read_sql("real_estate_data.csv")







app = Flask(__name__)

def retrun_predict_data():
    columns_list = ["serial_number","X1_transaction_date","X2_house_age",
                "X3_distance_to_the_nearest_MRT_station","X4_number_of_convenience_stores",
                "X5_latitude","X6_longitude","Y_house_price_of_unit_area"]
    mycursor = mydb.cursor()
    mycursor.execute('SELECT * FROM real_estate')
    table_rows = mycursor.fetchall()
    data = pd.DataFrame(table_rows, columns = columns_list )
    print(data)
    # df.to_csv("real_estate_from_sql.csv")
    print("Null Values:")
    print(data.isnull().sum())

    print("Data Description")
    print(data.describe())

    print("Data Information")
    print(data.info())

    # Defining the features and the target
    X = data.drop(["Y_house_price_of_unit_area"], axis =1)
    y = data["Y_house_price_of_unit_area"]

    # Making the train_test)_split

    from sklearn.model_selection import train_test_split
    X_train, X_test, y_train,y_test = train_test_split(X,y, test_size = 0.2)

    print("Training datapoints")
    print(X_train)


    print("Training target")
    print(y_train)


    print("Test datapoints")
    print(X_test)


    print("Test target")
    print(y_test)


    from sklearn.linear_model import LinearRegression
    from sklearn.metrics import mean_squared_error, r2_score
    import numpy as np
    # model  = LinearRegression()
    # model.fit(X_train, y_train)
    # y_predict = model.predict(X_test)
    # print("The RMSE for Linear Regression is : ", np.sqrt(mean_squared_error(y_test,y_predict)))
    # print("The R2 Score for Linear Regression is : ", r2_score(y_test,y_predict))

    # from sklearn.metrics import mean_squared_error

    # plt.title("Linear Regression Actual VS Predicted Plots")
    # plt.grid()
    # plt.hist(y_test, color = 'red', label = 'Actual Data')
    # plt.hist(y_predict, color = 'darkblue', label = 'Predicted Data')
    # plt.xlabel("Data")
    # plt.ylabel("Frequency")
    # plt.legend()
    # plt.show()


    model_list = [LinearRegression(), RandomForestRegressor(),
                DecisionTreeRegressor(),AdaBoostRegressor(),BaggingRegressor()]
    scores_list = []
    model_name_list = []
    for model in model_list:
        model.fit(X_train,y_train)
        y_pred = model.predict(X_test)
        scores_list.append(mean_squared_error(y_test,y_pred))
        model_name_list.append(str(model))

    scores_output_df = pd.DataFrame(model_name_list, scores_list).reset_index()
    scores_output_df.columns = ["MSE Score","Model Name"]
    print(scores_output_df)

    sns.barplot(data = scores_output_df, x = "MSE Score", y = "Model Name")
    # plt.show()



    from sklearn.model_selection import RandomizedSearchCV
    param_grid = {
                    "n_estimators":[10,20,30,40,50,60,70,80,90,100,110,120],
                    "criterion" : ["squared_error",
                                "absolute_error","friedman_mse",
                                "poisson"],
                    "max_depth" : [1,2,3,4,5],
                    "n_jobs" : [-1]
                    }

    rf = RandomForestRegressor()
    rf_cv = RandomizedSearchCV(estimator = rf,
                        param_distributions = param_grid,
                        cv = 3,
                        n_jobs = -1,
                        scoring='r2')

    rf_cv.fit(X_train, y_train)

    # Printing metrics
    print("[Hyperparameters]:", rf_cv.best_params_)
    print("[Train Score]:", rf_cv.best_score_)
    print("[Test Score]:", r2_score(y_test, rf_cv.predict(X_test)))


    model_best = rf_cv.best_estimator_

    model_best.fit(X_train,y_train)
    y_pred_best = model_best.predict(X_test)
    r2_score_best = r2_score(y_pred_best,y_test)
    print("The Final R2 score is : ", r2_score_best)
    return rf_cv.best_estimator_,rf_cv.best_params_ , r2_score_best

@app.route("/e2e_predicted_data", methods = ['POST'])
def get_json_data():
    best_model,best_hyperparameters, r2_score_best = retrun_predict_data()
    response_data = {"The best model is ": str(best_model),
                    "The best hyperparameters are": str(best_hyperparameters),
                    "The Best R2 Score is": str(r2_score_best)
                    }
    return response_data

if __name__ == '__main__':
    app.run(debug=True)
