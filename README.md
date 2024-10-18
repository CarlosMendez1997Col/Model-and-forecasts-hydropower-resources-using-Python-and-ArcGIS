# Models and forecasts in hidrological resources and energy using ArcGIS API for Python and Rstudio

## Description

Modeling and forecasting in hydrological resources and energy using the `LSTM (long short-term memory)` and `ResCNN` neural networks, in ArcGIS API for Python and R.

Each section is described below:

* The first section, indicate how to create a Neural Network Auto Regression (NNAR) in R.
* The second and third sections, explain how to create a `LSTM (long short-term memory)` and `ResCNN` neural networks in ArcGIS API for Python
* The fourth section, share the Data, Time Series and Graphs used in this repository

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

## Data acquisition and download

### The data used for build the time series and the LSTM and ResCNN neural networks, include information about 3 Hydroelectric Power Plants (HPP):

* Data
* Useful Volume
* Useful Volume Percent (%)
* Affluent Flow
* Defluent Flow
* Natural Flow
* Stored Energy 
* Affluent Natural Energy
* Energy Generation

Data processed in time series formats are available at: 

* HPP Capivara: [link](https://arcg.is/1u158D) 
* HPP Chavantes: [link](https://arcg.is/1O1Wq11)
* HPP Jurumirim: [link](https://arcg.is/1WTWX)

### The data used for build the time series and the NNAR neural network, include information of precipitation and potential evapotranspiration. Available in:

Precipitation:[link](https://arcg.is/149qym3)

Potential Evapotranspiration:[link](https://arcg.is/0L9iSy0)

## Credits and repository of data

The data for the hydroelectric power plants are from the ONS (Operador Nacional do Sistema Elétrico). Available online in: [ONS website](https://dados.ons.org.br/)

The data used for forecast precipitation and potential evapotranspiration are from the Nasa Earth re-pository, using the Giovanni (Geospatial Interactive Online Visualization ANd aNalysis Infrastructure). Available online in: [Nasa Giovanni Website](https://giovanni.gsfc.nasa.gov/giovanni/)


## Conflict of Interest.

The authors declare that there is no conflict of interest in the publication of this data and that all authors have approved it for publication.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.




