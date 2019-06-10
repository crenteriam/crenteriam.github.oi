---
layout: post
title: Common Open File Formats for Spatial Data
tag: kml, shapefile, geojson, osm, spatial analysis, rgdal, spatial data, open file formats, Open Geospatial Consortium
---

Shapefiles are widely use for managing vector spatial data, but I am not very fan of having several files for each layer. The folders become complicated when using several layers. When taking [Matt](http://mattingram.net/)'s cours on Spatial Analysis, I came across `KML` and `GeoJSON`, and really liked them. KML and GeoJSON files are simpler and lighter than Shapefiles. Also, these formats can keep several layers in a single file. Among these, `GeoJSON` is my favourite. Below I highlight a comparison between these file types.

**Shapefile**. The Shapefile is the most common file format for vector data in social sciences. Each Shapefile contains the information of one layer and is composed by several files. [The basic composition of a Shapefile is](http://resources.arcgis.com/en/help/main/10.2/index.html#//005600000003000000): `.shp` stores the feature geometry; `.shx` stores the index of the feature geometry; `.dbf` stores the dataset associated. The `.prj` is also very important. It stores the coordinate system information; .xml stores metadata. Other files: .sbn, .sbx, .fbn, and .fbx (spatial indexes); .ain, .aih, and .atx, (attribute indexes); .ixs, and .mxs (geocoding indexes). See... too many files.

**KML**. KML stands for Keyhole Markup Language, and was developed by Keyhole, Inc. (acquired by Google), the company that originally developed Google Earth.

- KML is the standard file format to work with Google’s platforms (Google Earth, Google Maps, etc.) - KML is restrained to a single projection standard (EPSG:4326), which makes things more simple when proyecting maps.
- KML is an Open Geospatial Consortium (OGC) standard data format.
- Complex datasets may be composed by various KML files and compressed in the KMZ format file.

**GeoJSON**. JSON is usually more efficient in storing data sets. [GeoJSON’s simplicity](http://www.macwright.org/2015/03/23/geojson-second-bite.html) makes it easy to use, read, and share. You can store multiple features into just one file. A nice feature of GeoJSON is that you can store multiple layers(points, lines, and polygons) in one file.
- GeoJSON files may have an optional coordinate reference system.
- There are some nice tools in the web for working with GeoJSON: geojsonlit to validate your data in a map; ogre.adc4gis.com for transforming from GeoJSON to Shapefile or viceversa; geojson.io for editing your map’s features.

**OSM**. As GeoJSON and KML files, OSM can include multiple layers in one file. Native file format for OSM.
