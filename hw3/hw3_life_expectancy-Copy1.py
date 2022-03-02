#!/usr/bin/env python
# coding: utf-8

# In[30]:


import mysql.connector as sql
import pandas as pd
from matplotlib import pyplot
from scipy.stats import pearsonr
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression


# In[2]:


db_connection = sql.connect(host='208.109.18.154', database='ids18db', user='ids18', password='Yuz0912')
db_cursor = db_connection.cursor()
db_cursor.execute('SELECT * FROM Life_Expectancy')

table_rows = db_cursor.fetchall()

LifeDF = pd.DataFrame(table_rows)


# In[3]:


LifeDF.columns = ['Country','Year', 'Life_Expectancy', 'Adult_Mortality', 'Alcohol', 'Percentage', 'BMI', 'Total_Expectancy','GDP', 'Population', 'Schooling']


# In[4]:


print(LifeDF)


# In[5]:


LifeDF.info();


# In[9]:


pyplot.scatter(LifeDF.Life_Expectancy,LifeDF.Adult_Mortality)


# In[43]:


data1 = LifeDF['Life_Expectancy']
data2 = LifeDF['Adult_Mortality']

corr, _ = pearsonr(data1, data2)
print('Pearsons correlation: %.5f' % corr)


# In[20]:


pyplot.scatter(LifeDF.Life_Expectancy,LifeDF.Alcohol)


# In[44]:


data1 = LifeDF['Life_Expectancy']
data2 = LifeDF['Alcohol']

corr, _ = pearsonr(data1, data2)
print('Pearsons correlation: %.5f' % corr)


# In[22]:


pyplot.scatter(LifeDF.Life_Expectancy,LifeDF.GDP)


# In[45]:


data1 = LifeDF['Life_Expectancy']
data2 = LifeDF['GDP']

corr, _ = pearsonr(data1, data2)
print('Pearsons correlation: %.5f' % corr)


# In[24]:


pyplot.scatter(LifeDF.Life_Expectancy,LifeDF.Schooling)


# In[46]:


data1 = LifeDF['Life_Expectancy']
data2 = LifeDF['Schooling']

corr, _ = pearsonr(data1, data2)
print('Pearsons correlation: %.5f' % corr)


# In[29]:


LifeDF.corr()


# In[34]:


X = LifeDF.iloc[:, 2].values.reshape(-1,1)
Y = LifeDF.iloc[:, 10].values.reshape(-1,1)
LRmodel = LinearRegression()  


LRmodel.fit(X, Y)   

Y_pred = LRmodel.predict(X)  



plt.scatter(X, Y)
plt.plot(X, Y_pred, color='red')

plt.show()


# In[49]:


print("The slope: ", LRmodel.coef_)
print("The intercept: ", LRmodel.intercept_)



# In[40]:


X = LifeDF.iloc[:, 2].values.reshape(-1,1)
Y = LifeDF.iloc[:, 5].values.reshape(-1,1)
LRmodel = LinearRegression()  


LRmodel.fit(X, Y)   

Y_pred = LRmodel.predict(X)  



plt.scatter(X, Y)
plt.plot(X, Y_pred, color='red')

plt.show()


# In[41]:


from sklearn.metrics import mean_squared_error, r2_score

print("MSE: ", mean_squared_error(Y, Y_pred))
print("R2: ", r2_score(Y, Y_pred))


# In[47]:





# In[ ]:




