---
layout: contents
title: "Importing the Spatial Data in R"
tag: OpenStreetMap, R, overpass turbo, GeoJSON, rgdal, osm, data, osmar, .osm, .geojson, download, import, load, packages
---

To import OSM spatial data into R, you can either make direct queries in
the OSM’s API or you can download an OSM file an then open it into R.
The first alternative only operates for small bounding boxes (0.25 x
0.25 coordinates range), whereas the second alternative allows bigger
bounding boxes. For either alternative, we will need the package
[`osmar`](https://cran.r-project.org/web/packages/osmar/osmar.pdf).

When importing OSM spatial data, the key is knowing which file format
you are dealing with. In this tutorial we will work with `.osm`, the
native OSM file extension and `geoJSON`, the default file extension in
the platform Overpass Turbo. We will open `.osm` files with the package
`osmar`, whereas we will open `.geoJSON` files with the package `rgdal`.

``` r
library(osmar)
```

    ## Loading required package: XML

    ## Loading required package: RCurl

    ## Loading required package: geosphere

    ##
    ## Attaching package: 'osmar'

    ## The following object is masked from 'package:utils':
    ##
    ##     find

``` r
library(rgdal)
```

    ## Loading required package: sp

    ## rgdal: version: 1.4-8, (SVN revision 845)
    ##  Geospatial Data Abstraction Library extensions to R successfully loaded
    ##  Loaded GDAL runtime: GDAL 2.2.3, released 2017/11/20
    ##  Path to GDAL shared files: C:/Users/rente/OneDrive/Documents/R/win-library/4.0/rgdal/gdal
    ##  GDAL binary built with GEOS: TRUE
    ##  Loaded PROJ.4 runtime: Rel. 4.9.3, 15 August 2016, [PJ_VERSION: 493]
    ##  Path to PROJ.4 shared files: C:/Users/rente/OneDrive/Documents/R/win-library/4.0/rgdal/proj
    ##  Linking to sp version: 1.4-1

A. Importing directly from an API
---------------------------------

We will use the Open Street Map API, which URL is
`https://api.openstreetmap.org/api/0.6/` (an alternative is this mirror:
`http://overpass-api.de/api/`). As this alternative has a limited
bounding box span, first, we will define our bounding box. In this
example, I am creating an object with the bounding box for the
Washington Park in Albany, NY by using the function `corner_bbox()`.

``` r
box.wpark = corner_bbox(-73.7774,42.6530,-73.7652,42.6623)
```

Next, I will create an object with the API’s URL with the function
function osmsource\_api().

``` r
api.wpark = osmsource_api(url = "https://api.openstreetmap.org/api/0.6/")
```

The function `get_osm` will download the map `wpark` for the bounding
box `box.wpark` from the repository `api.wpark`.

``` r
wpark = get_osm(box.wpark, source = api.wpark)
class(wpark)
```

    ## [1] "osmar" "list"

You can now manage the map in R as an OSM object. However, this object
is not rendered yet as a map (try, for example, typing `plot(wpark)`). A
great value of OSM and GeoJSON files is that they comprise multiple
layers (e.g., points, lines and polygons) in the same file, but this
complicates the processing of maps in R. Every layer should be in a
separate object. Therefore, to effectively use OSM data, we need to
transform the `.osm` file into a spatial object. To do so, we must use
the function `as_sp()`.

``` r
area.wpark   = as_sp(wpark,what="polygons") # Extract the polygons
street.wpark = as_sp(wpark,what="lines")    # Extract the lynes
attr.wpark   = as_sp(wpark,what="points")   # Extract the points
```

Now we have spatial data. As an example, I will plot the three types of
spatial data that were residing in the `.osm`:

``` r
class(area.wpark)
```

    ## [1] "SpatialPolygonsDataFrame"
    ## attr(,"package")
    ## [1] "sp"

``` r
plot(area.wpark,   col = "gray")
```

![](managing-data-osm-R_files/figure-markdown_github/unnamed-chunk-6-1.png)

``` r
plot(area.wpark,   col = "gray")
plot(street.wpark, add = TRUE, col = "blue")
```

![](managing-data-osm-R_files/figure-markdown_github/unnamed-chunk-7-1.png)

``` r
plot(area.wpark,   col = "gray")
plot(attr.wpark,   add = TRUE, col="red", pch = 1)
```

![](managing-data-osm-R_files/figure-markdown_github/unnamed-chunk-8-1.png)

### B. Importing from OSM files

To follow this example, you must download into your computer the
follwing file
`https://github.com/crenteriam/crenteriam.github.io/blob/master/files/tutorials/tutorial-osm/_albany.osm`.

Once you have downloaded the file, set the working directory and open
the file by using the function `osmsource_file()`.

``` r
source.albany=osmsource_file("_albany.osm")
```

Next, we wil ltransform the file into an `osmar` object. In this case,
since the file already contains the bounding box, we replace the
information of the bounding box by `complete_file()` and transform the
`osmar` object into spatial objects.

``` r
albany = get_osm(complete_file(), source = source.albany)
area.albany = as_sp(albany, what = "polygons")
street.albany = as_sp(albany,what = "lines")
```

Plot the results.

``` r
plot(area.albany)
plot(street.albany,add=TRUE,col="green")
```

### C. Importing from GeoJSON files[^7]

To follow this example, you must download into your computer the
follwing file
`https://github.com/crenteriam/crenteriam.github.io/blob/master/files/tutorials/tutorial-osm/_highways.geojson.osm`.
This file was downloaded from Overpass Turbo (OT).

In this case, you will need the `rgdal` package. In the firs line below,
I inspect the structure of the GeoJSON file with `ogrListLayers()`. In
the second line I inspect the attributes for each layer by using
`ogrInfo()`. You need to specify the file, the extension (“OGRGeoJSON”).
The option `wkbLineString` provides the attributes for the lines layer.

``` r
ogrListLayers("highways.geojson")
ogrInfo("highways.geojson", "OGRGeoJSON", require_geomType = "wkbLineString")

# The alternative layers are require_geomType="wkbPoint" OR require_geomType="wkbPolygon"
```

Then, I will convert this file into a spatial object. To do so, I will
use the function `readOGR`, I will define the object `highways.geojson`
as the source, `"OGRGeoJSON"` to tell R that the source is a GeoJSON
file and `require_geomType="wkbLineString"` to extract only the lines
layer.

``` r
highways = readOGR("highways.geojson", "OGRGeoJSON", require_geomType = "wkbLineString")
class(highways)
```

### D. Export to Shapefile.

With the information provided above you would be allowed to do your
spatial analysis. However, if you need to export the objects as ESRI’s
Shapefiles, use one of the two following lines:[^8]

write a new shapefile with package rgdal (including .prj component)

``` r
writeOGR(highways, ".", "highways_prj", driver="ESRI Shapefile")
```

[^7]: Further details in <a href="http://rstudio-pubs-static.s3.amazonaws.com/84577_d3eb8b4712b64dbdb810773578d3c726.html" class="uri">http://rstudio-pubs-static.s3.amazonaws.com/84577_d3eb8b4712b64dbdb810773578d3c726.html</a>
[^8]: See further details in RPOS 619 tutorial <a href="https://www.youtube.com/watch?v=oPsKeC_EMX0" class="uri">https://www.youtube.com/watch?v=oPsKeC_EMX0</a>
Or “Read and write ESRI Shapefiles with R“:
<a href="https://www.nceas.ucsb.edu/scicomp/usecases/ReadWriteESRIShapeFiles" class="uri">https://www.nceas.ucsb.edu/scicomp/usecases/ReadWriteESRIShapeFiles</a>
