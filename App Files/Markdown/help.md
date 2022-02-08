### The MetricsCOSEWIC App

This app is a standalone front-end for the functions contained
in the *MetricsCOSEWIC package*. For project updates and technical details 
go to the [*main project repository*](https://github.com/SOLV-Code/MetricsCOSEWIC).

### Troubleshooting Tips



#### App Troubles

First, narrow down the source of the problem:


* If nothing works, check the formatting of your data file against the [sample input files](https://drive.google.com/drive/folders/1y1d0TF8v2kWWbHXkTaK0mb3BQjUc7xrZ?usp=sharing).
* If you are comfortable with R, try applying the package functions directly to the data  (Starting with the [code in the package README](https://github.com/SOLV-Code/MetricsCOSEWIC)).

Then, file a bug report at [Issue Page](https://github.com/SalmonForecastR/ForecastR-Releases/issues).




#### Statistical Troubles



* MetricsCOSEWIC doesn't accept time series with missing data. The inclusion of imputing algorithms has been discussed by the team but the idea was abandoned in favor of external preparation of input files without missing data. (IS THIS STILL TRUE?)


* The presence of  legitimate "zeros" in time series sometimes produces cause problems with log-transforms (HOW DID WE SETTLE THIS ONE? OR HAVEN'T WE?)

* ANYTHING ELSE TO HIGHLIGHT HERE?
