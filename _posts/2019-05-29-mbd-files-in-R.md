---
layout: post
title: Import .msb Files in R
tag: microsoft access, .mdb, .accdb, r, rstudio, sql tables as data frames, sql table r statistical software, RODBC.
---

Microsoft Access Database (`.mdb`) is a database file format used by Microsoft Access 2003 and earler (the newwer file extension is `.accdb`). The `.mdb` file may contain several databases. For some reason, some data providers store data in this format and it becomes difficult to manage in Stata or R.

Using the [Youth Risk Behavior Survey (YRBS)](https://www.cdc.gov/healthyyouth/data/yrbs/data.htm) data as example, here is a piece of code that worked for me. The main problem is that you must use R in its 32-bit version. This means you must open the R base esecutable *R i386* (or try something more fancy with [Rstudio](https://www.dummies.com/programming/r/how-to-install-and-configure-rstudio/)).

First, install and load the package `RODBC`. Then, use the function `odbcConnectAccess` on the `.mdb` file.

```r
# Use the package RODBC to open the Access file in R.
# This package only works in 32-bit. Therefore run the program R i386 (in Windows).
install.packages("RODBC")
library(RODBC)
path = file.path("C:/Users/Desk/sadc_2017_national/sadc_2017_national")
channel.sadc <- odbcConnectAccess(path) # The object channel.sadc is an Access file.
```

The resulting object is a Access Database (with multiple tables). `sqlTables()` helps you explore the tables within the Access object, and `sqlFetch()` retrieves the desired table.

```r
# To explore what tables are inside the sql file "channel.sadc", run the next line:
sqlTables(channel.sadc)

# It seems that among these tables, the one you need is SADCQ. The next line is going to open it as a data file.
data.sadc2017 <- sqlFetch(channel.sadc,"SADCQ")
```
To save the file as Stata's `.dta`:

```r
# Write in Stata
install.packages("haven")
library(haven)
write_dta(data.sadc2017, "C:/Users/Desk/SADC_2017_National.dta")
```
