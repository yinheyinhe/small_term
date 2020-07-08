import numpy as np                               # vectors and matrices
import pandas as pd                              # tables and data manipulations
import matplotlib.pyplot as plt                  # plots
import statsmodels.tsa.api as smt
import statsmodels.api as sm
from itertools import product                    # some useful functions
import warnings                                  # do not disturbe mode
warnings.filterwarnings('ignore')

# MAPE
def mean_absolute_percentage_error(y_true, y_pred):
    return np.mean(np.abs((y_true - y_pred) / y_true)) * 100


def tsplot(y, lags=None, figsize=(12, 7), style='bmh'):
    """
        Plot time series, its ACF and PACF, calculate Dickey–Fuller test

        y - timeseries
        lags - how many lags to include in ACF, PACF calculation
    """

    if not isinstance(y, pd.Series):
        y = pd.Series(y)

    with plt.style.context(style):
        fig = plt.figure(figsize=figsize)
        layout = (2, 2)
        ts_ax = plt.subplot2grid(layout, (0, 0), colspan=2)
        acf_ax = plt.subplot2grid(layout, (1, 0))
        pacf_ax = plt.subplot2grid(layout, (1, 1))

        y.plot(ax=ts_ax)
        p_value = sm.tsa.stattools.adfuller(y)[1]
        ts_ax.set_title('Time Series Analysis Plots\n Dickey-Fuller: p={0:.5f}'.format(p_value))
        smt.graphics.plot_acf(y, lags=lags, ax=acf_ax)
        smt.graphics.plot_pacf(y, lags=lags, ax=pacf_ax)
        plt.tight_layout()

tem = pd.read_csv('tem.csv', index_col=['DATE'], parse_dates=['DATE'])

plt.figure(figsize=(18, 6))
plt.plot(tem.TMAX)
plt.title('Temperature watched (daily data)')
plt.grid(True)
plt.show()

tsplot(tem.TMAX, lags=60)
plt.show()

# The seasonal difference
tem_diff = tem.TMAX - tem.TMAX.shift(1)
tsplot(tem_diff[24+1:], lags=60)
plt.show()

# setting initial values and some bounds for them
ps = range(0, 5)
ds = range(0,2)
qs = range(0, 5)
Ps = range(0, 2)
Ds = range(0,2)
Q = 1
s = 22

# creating list with all the possible combinations of parameters
param = product(ps,ds, qs, Ps,Ds)
parameters_list = list(param)
print('parameters_list:{}'.format(parameters_list))
print(len(parameters_list))  # 36


def optimizeSARIMA(parameters_list,Q,s):
    """Return dataframe with parameters and corresponding AIC

        parameters_list - list with (p, q, P, Q) tuples
        d - integration order in ARIMA model
        D - seasonal integration order
        s - length of season
    """

    results = []
    best_aic = float("inf")

    for param in parameters_list:
        # we need try-except because on some combinations model fails to converge
        try:
            model = sm.tsa.statespace.SARIMAX(tem.TMAX, order=(param[0], param[1], param[2]),
                                              seasonal_order=(param[3], param[4], Q, s)).fit(disp=-1)
        except:
            continue
        aic = model.aic
        # saving best model, AIC and parameterss
        if aic < best_aic:
            best_model = model
            best_aic = aic
            best_param = param
        results.append([param, model.aic])

    result_table = pd.DataFrame(results)
    result_table.columns = ['parameters', 'aic']
    # sorting in ascending order, the lower AIC is - the better
    result_table = result_table.sort_values(by='aic', ascending=True).reset_index(drop=True)

    return result_table

warnings.filterwarnings("ignore")
result_table = optimizeSARIMA(parameters_list,Q,s)
print(result_table)

# set the parameters that give the lowest AIC
p,d, q, P,D = result_table.parameters[0]

best_model=sm.tsa.statespace.SARIMAX(tem.TMAX, order=(p, d, q),
                                     seasonal_order=(P, D, Q, s),
                                     enforce_stationarity=False,
                                     enforce_invertibility=False).fit(disp=-1)

print(best_model.summary())

#tsplot(best_model.resid[24+1:], lags=60)
#plt.show()


def plotSARIMA(series, model, n_steps):
    """Plots model vs predicted values

        series - dataset with timeseries
        model - fitted SARIMA model
        n_steps - number of steps to predict in the future
    """

    # adding model values
    data = series.copy()
    data.columns = ['daily','actual']
    data['sarima_model'] = model.fittedvalues
    # making a shift on s+d steps, because these values were unobserved by the model
    # due to the differentiating
    data['sarima_model'][:s + d] = np.NaN

    # forecasting on n_steps forward
    forecast = model.predict(start=data.shape[0], end=data.shape[0] + n_steps)
    forecast = data.sarima_model.append(forecast)
    # calculate error, again having shifted on s+d steps from the beginning
    error = mean_absolute_percentage_error(data['actual'][s + d:], data['sarima_model'][s + d:])

    plt.figure(figsize=(15, 7))
    plt.title("Mean Absolute Percentage Error: {0:.2f}%".format(error))
    plt.plot(forecast, color='r', label="model")
    plt.axvspan(data.index[-1], forecast.index[-1], alpha=0.5, color='lightgrey')
    plt.plot(data.actual, label="actual")
    plt.legend()
    plt.grid(True)

plotSARIMA(tem, best_model, 7)
plt.show()