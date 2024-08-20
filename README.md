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

## Data acquisition and download

The LSTM and ResCNN neural networks, used information and time series about Hydroelectric Power Plants (HPP):

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

## Credits and more information

The data for the hydroelectric power plants are from the ONS (Operador Nacional do Sistema Elétrico). Available online in: [ONS website](https://dados.ons.org.br/)

The data used for forecast precipitation and potential evapotranspiration are from the Nasa Earth re-pository, using the Giovanni (Geospatial Interactive Online Visualization ANd aNalysis Infrastructure). Available online in: [Nasa Giovanni Website](https://giovanni.gsfc.nasa.gov/giovanni/)


## Conflict of Interest.

The authors declare that there is no conflict of interest in the publication of this map and that all authors have approved it for publication.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.




