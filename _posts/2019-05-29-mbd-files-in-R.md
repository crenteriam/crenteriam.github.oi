---
layout: post
title: Import .msb Files in R
tag: microsoft access, .mdb, .accdb, r, rstudio, sql tables as data frames, sql table r statistical software, RODBC.
---

Some data is stored in `mfb` files, which makes it difficult to manage in Stata or R. Here is a piece of code that worked for me using the [Youth Risk Behavior Survey (YRBS)](https://www.cdc.gov/healthyyouth/data/yrbs/data.htm) data as example.

First, install and load the package `RODBC`. You must use this package in the R base 32-bit version (*R i386* in Windows). Then, use the function `odbcConnectAccess` on the `.mdb` file to store the Access database in an object.

```r
# Use the package RODBC to open the Access file in R.
install.packages("RODBC")

# Store the file path in an object
path = file.path("C:/Users/Desk/sadc_2017_national/sadc_2017_national")

# odbcConnectAccess() stores an Access database in an object
channel.sadc <- RODBC::odbcConnectAccess(path)
```

The resulting object is a Access database (with multiple tables). You can explore the database with `sqlTables()`. To retrieve an specific dataset from the Access file, use `sqlFetch()`.

```r
# Explore the tables in the object channel.sadc
RODBC::sqlTables(channel.sadc)

# Retrieve the dataset SADCQ.
data.sadc2017 <- RODBC::sqlFetch(channel.sadc,"SADCQ")
```
Now, the object `data.sadc2017` should be a regular data frame.

To save the file as Stata's `.dta`:

```r
# Save as .dta
install.packages("haven")
haven::write_dta(data.sadc2017, "C:/Users/Desk/SADC_2017_National.dta")
```
