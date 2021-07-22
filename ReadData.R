
## CSV, TSV================================================

library(readr)
data1 <- read_csv("xxx.csv")
data2 <- read_tsv("xxx.asc")

## XLS ================================================

library(readxl)
data3 <- read_excel("xxx.xls", sheet = "Data")

## dta ================================================

library(haven)
data4 <- read_dta("xxx.dta")

