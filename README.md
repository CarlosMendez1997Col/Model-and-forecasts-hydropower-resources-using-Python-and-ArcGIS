# Models and forecasts in hidrological resources and energy

## Description

Modeling and forecasting in hydrological resources and energy using the `LSTM (long short-term memory)` and `ResCNN` neural networks in ArcGIS for Python and R.

Each section is described below:

* The first section shows the data and files used in the project
* The second and third sections show the script for the LSTM and ResCNN neural networks in the python language
* The fourth section shows the NNAR neural network script for predicting future values in R.

## Prerequisites and libraries

### LSTM and ResCNN Neural Networks

```python

import matplotlib.pyplot as plt
import numpy as np
import math
from datetime import datetime as dt
from IPython.display import Image, HTML

#pandas
import pandas as pd
from pandas.plotting import autocorrelation_plot

#sklearn
import sklearn.metrics as metrics
from sklearn.metrics import r2_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler

#arcgis
from arcgis.gis import GIS
from arcgis.learn import TimeSeriesModel, prepare_tabulardata
from arcgis.features import FeatureLayer, FeatureLayerCollection
```

### NNAR Neural Networks

```R

library(forecast)
library(timetk)
library(dplyr)
library(tibbletime)
library(cowplot)
library(rsample)
library(keras)
library(tidyverse)
library(tsibble) 
library(modeltime)
library(readxl)
```






