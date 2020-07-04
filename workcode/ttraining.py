import pandas as pd
import numpy as np
from scipy import stats
import matplotlib.pyplot as plt
import statsmodels.api as sm
from statsmodels.graphics.api import qqplot

data = pd.read_csv('maxmin.csv', parse_dates=['date'])
dta = data['tmin']
dta_year = data['date']

# 得到开始年份结束年份
begin_year = dta_year[0:1].dt.year
end_year = dta_year[-1:].dt.year

# 设置数据类型
dta=np.array(dta,dtype=np.float)
# 转换为Series类型一维数组
dta=pd.Series(dta)
dta.index=pd.Index(sm.tsa.datetools.dates_from_range(str(begin_year .values[0]),str(end_year.values[0])))
dta.plot(figsize=(10,6))
plt.show()

# 一阶差分
fig = plt.figure(figsize=(12,8))
axl = fig.add_subplot(111)
diffl = dta.diff(1)
diffl.plot(ax=axl)
plt.show()

# 查看acf和pacf
diffl = dta.diff(1)
fig = plt.figure(figsize=(12,8))
ax1 = fig.add_subplot(211)
fig = sm.graphics.tsa.plot_acf(dta,lags=30,ax=ax1)
ax2 = fig.add_subplot(212)
fig = sm.graphics.tsa.plot_pacf(dta,lags=30,ax=ax2)
plt.show()

# 使用ARMA模型
arima_mod32 = sm.tsa.ARMA(dta,(3,2)).fit()
print(arima_mod32.aic,arima_mod32.bic,arima_mod32.hqic)

resid = arima_mod76.resid
fig = plt.figure(figsize=(12,8))
ax1 = fig.add_subplot(211)
fig = sm.graphics.tsa.plot_acf(resid.values.squeeze(),lags=30,ax=ax1)
ax2 = fig.add_subplot(212)
fig = sm.graphics.tsa.plot_pacf(resid,lags=30,ax=ax2)

# 验证
fig = plt.figure(figsize=(12,8))
ax = fig.add_subplot(111)
fig = qqplot(resid,line='q',ax=ax,fit=True)
plt.show()

'''
# 生成预测数据
# 未来10年同一天
predict_year = 10
predict_end_year = end_year.values[0]+predict_year
predict_data = arima_mod76.predict(str(end_year.values[0]),str(predict_end_year),dynamic = True)
print(predict_data)
'''