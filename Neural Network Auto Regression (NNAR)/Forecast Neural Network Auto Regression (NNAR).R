#------------------------------ MACHINE LEARNING AND DEEP LEARNING ------------------------------

#install.packages("forecast")
library(forecast)
#install.packages("trelliscopejs")
library(trelliscopejs)
#install.packages("tidyverse")
library(tidyverse)
#install.packages("forcats")
library(forcats)
# Time Series
#install.packages("timetk")
library(timetk)
#install.packages("dlyr")
library(dplyr)
#install.packages("tidyquant")
library(tidyquant)
#install.packages("tibbletime")
library(tibbletime)
# Visualization
#install.packages("cowplot")
library(cowplot)
# Preprocessing
#install.packages("recipes")
library(recipes)
# Sampling / Accuracy
#install.packages("rsample")
library(rsample)
#install.packages("yardstick")
library(yardstick) 
#install.packages("keras")
library(keras)
#install.packages("tidyverse")
library(tidyverse)
#install.packages("tsibble")
#remotes::install_github("tidyverts/tsibble")
library(tsibble) 
#install.packages("torch")
library(torch)
#install.packages("feasts")
library(feasts)
#install.packages("tsibbledata")
library(tsibbledata) # Diverse Datasets for 'tsibble'
#install.packages("tidymodels")
library(tidymodels)
#install.packages("modeltime")
library(modeltime)
#install.packages("timetk")
library(lubridate)
#install.packages("remotes")
library(remotes)
#install.packages("glmnet")
library(glmnet)
#install.packages("xgboost")
library(xgboost)
#install.packages("earth")
library(earth)
#install.packages("censored")
library(censored)
library(readxl)

library(readr)

setwd("G:/Mi Unidad/Aulas 2023-1/Articulos/Springer Journal Geosciences/Forecast 2023-2025")


#esta função ajuda ler somente aqueles arquivos com extensão .txt
list.files(pattern = ".xlsx")

files <- list.files(recursive = TRUE,pattern = ".xlsx",full.names = TRUE)


PRCPAll <- read_excel("ForecastInfo.xlsx") %>% select(starts_with("PRCP")) 

ETPAll <- read_excel("ForecastInfo.xlsx") %>% select(starts_with("PET"))

BALAll <- read_excel("ForecastInfo.xlsx") %>% select(starts_with("BAL"))

SPIAll <- read_excel("ForecastInfo.xlsx") %>% select(starts_with("SPITri"))

SPEIAll <- read_excel("ForecastInfo.xlsx") %>% select(starts_with("SPEITri"))

UPHPontos <- read_csv("G:/Mi Unidad/Aulas 2023-1/Articulos/Springer Journal Geosciences/Forecast 2023-2025/ForecastPoint.txt")  %>% mutate(id = as.factor(id))

#SELECT FILE 

Indices <- read_excel("ForecastInfo.xlsx")
Indices <- Indices %>% rename("date" = "Calendar") %>% mutate_if(~'POSIXt' %in% class(.x), as.Date)
#
DataTM <- Indices %>% select(date)

for (i in 1:22) 
  { 
  colnames(PRCPAll)[i] ="value" 
  colnames(ETPAll)[i] ="value" 
  colnames(SPIAll)[i] ="value" 
  colnames(SPEIAll)[i] ="value"
  colnames(BALAll)[i] ="value"
}

ForecastPRCP <- rbind(PRCPAll[1],PRCPAll[2],PRCPAll[3],PRCPAll[4],PRCPAll[5],
                      PRCPAll[6],PRCPAll[7],PRCPAll[8],PRCPAll[9],PRCPAll[10],
                      PRCPAll[11],PRCPAll[12],PRCPAll[13],PRCPAll[14],PRCPAll[15],
                      PRCPAll[16],PRCPAll[17],PRCPAll[18],PRCPAll[19],PRCPAll[20],
                      PRCPAll[21],PRCPAll[22])

ForecastPRCP<- cbind(UPHPontos,DataTM,ForecastPRCP)

ForecastETP <- rbind(ETPAll[1],ETPAll[2],ETPAll[3],ETPAll[4],ETPAll[5],
                     ETPAll[6],ETPAll[7],ETPAll[8],ETPAll[9],ETPAll[10],
                     ETPAll[11],ETPAll[12],ETPAll[13],ETPAll[14],ETPAll[15],
                     ETPAll[16],ETPAll[17],ETPAll[18],ETPAll[19],ETPAll[20],
                     ETPAll[21],ETPAll[22])

ForecastETP<- cbind(UPHPontos,DataTM,ForecastETP)


ForecastBAL <- rbind(BALAll[1],BALAll[2],BALAll[3],BALAll[4],BALAll[5],
                     BALAll[6],BALAll[7],BALAll[8],BALAll[9],BALAll[10],
                     BALAll[11],BALAll[12],BALAll[13],BALAll[14],BALAll[15],
                     BALAll[16],BALAll[17],BALAll[18],BALAll[19],BALAll[20],
                     BALAll[21],BALAll[22])

ForecastBAL<- cbind(UPHPontos,DataTM,ForecastBAL)



ForecastSPI <- rbind(SPIAll[1],SPIAll[2],SPIAll[3],SPIAll[4],SPIAll[5],
                     SPIAll[6],SPIAll[7],SPIAll[8],SPIAll[9],SPIAll[10],
                     SPIAll[11],SPIAll[12],SPIAll[13],SPIAll[14],SPIAll[15],
                     SPIAll[16],SPIAll[17],SPIAll[18],SPIAll[19],SPIAll[20],
                     SPIAll[21],SPIAll[22])

ForecastSPI<- cbind(UPHPontos,DataTM,ForecastSPI)


ForecastSPEI <- rbind(SPEIAll[1],SPEIAll[2],SPEIAll[3],SPEIAll[4],SPEIAll[5],
                      SPEIAll[6],SPEIAll[7],SPEIAll[8],SPEIAll[9],SPEIAll[10],
                      SPEIAll[11],SPEIAll[12],SPEIAll[13],SPEIAll[14],SPEIAll[15],
                      SPEIAll[16],SPEIAll[17],SPEIAll[18],SPEIAll[19],SPEIAll[20],
                      SPEIAll[21],SPEIAll[22])

ForecastSPEI<- cbind(UPHPontos,DataTM,ForecastSPEI)

#remove(ForecastPRCP)


data_tbl <- ForecastPRCP


data_tbl %>%
  group_by(id) %>%
  plot_time_series(
    date, value, .interactive = F,
    .trelliscope = TRUE,
    .trelliscope_params = list(
      name = "Forecast_Precipitation", 
      desc = "",
      width = 800,
      md_desc = ""
    )   
  )

nested_data_tbl <- data_tbl %>%
  extend_timeseries(
    .id_var        = id,
    .date_var      = date,
    .length_future = 24
  ) %>%
  
  nest_timeseries(
    .id_var        = id,
    .length_future = 24,
    .length_actual = 240
  ) %>%
  split_nested_timeseries(
    .length_test = 80
  )

nested_data_tbl

#------------------------------------- CREATE MODELS -----------------------------------------------


#------------------------------------6. NNETAR MODEL --------------------------------------------

#show_engines('nnetar_reg')

rec_nnetar <- recipe(value ~ date, extract_nested_train_split(nested_data_tbl)) 

wflw_nnetar <- workflow() %>%
  add_model(nnetar_reg("regression",
                       seasonal_period = "12 months",
                       non_seasonal_ar = 5L,
                       seasonal_ar = 1L,
                       hidden_units = 6L,
                       num_networks = 1L,
                       penalty = 0.95,
                       epochs = 100L ) %>%
              set_engine("nnetar",
                         decay=penalty(),
                         P=seasonal_ar(), 
                         p=non_seasonal_ar(),
                         size=hidden_units(), 
                         repeats =num_networks(), 
                         maxit=epochs(),
                         #rang = 0.1,
                         
                        
                         )) %>%
  add_recipe(rec_nnetar)

#------------------------------------ END CREATE MODELS ---------------------------------------


nested_modeltime_tbl <- modeltime_nested_fit(
  # Nested data 
  nested_data = nested_data_tbl,
  
  # Add workflows
  wflw_nnetar
  
)

nested_modeltime_tbl

nested_modeltime_tbl %>% 
  extract_nested_test_accuracy() %>%
  table_modeltime_accuracy(.interactive = F)

nested_modeltime_tbl %>% 
  extract_nested_error_report()


best_nested_modeltime_tbl <- nested_modeltime_tbl %>%
  modeltime_nested_select_best(
    metric                = "rmse", 
    minimize              = TRUE, 
    filter_test_forecasts = TRUE
  )

best_nested_modeltime_tbl %>%
  extract_nested_best_model_report()


nested_modeltime_refit_tbl <- best_nested_modeltime_tbl %>%
  modeltime_nested_refit(
    control = control_nested_refit(verbose = TRUE)
  )

nested_modeltime_refit_tbl


nested_modeltime_refit_tbl %>%
  extract_nested_future_forecast() %>%
  group_by(id) %>%
  plot_modeltime_forecast(
    .conf_interval_show = TRUE,
    .line_size = 0.5,
    .line_type = 1,
    .line_alpha = 1,
    .plotly_slider = TRUE,
    .facet_scales = "free_y",
    .legend_show = FALSE,
    .title = "",
    .trelliscope = TRUE,
    .trelliscope_params = list(width = 85,
                               height = 40,
                               desc = "",
                               md_desc = ""
                               )
  )


ForecastingPRCP <- nested_modeltime_refit_tbl %>%
  extract_nested_future_forecast() 

predictionPRCP <- ForecastingPRCP[ForecastingPRCP$.key %in% c('prediction'),] %>% print(n=518)

  predictionPRCP%>%
  group_by(id) %>%
  plot_modeltime_forecast(
    .conf_interval_show = TRUE,
    .line_size = 0.9,
    .line_type = 1,
    .line_alpha = 1,
    .facet_ncol     = 4,
    .facet_nrow     = 6,
    .plotly_slider = TRUE,
    .facet_scales = "free_y",
    .legend_show = FALSE,
    .title = "",
    .trelliscope = TRUE,
    .trelliscope_params = list(
                               name = "Forecast_Precipitation", 
                               width = 100,
                               height = 40,
                               desc = "",
                               md_desc = ""
    )
  )

#write.table(predictionPRCP, "ForecastETP2023-2025.txt")
