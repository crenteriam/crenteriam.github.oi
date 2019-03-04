---
layout: post
title: Common Open File Formats for Spatial Data
tag: kml, shapefile, geojson, osm, spatial analysis, rgdal, spatial data, open file formats, Open Geospatial Consortium
---

Shapefiles are the most common format for exchanging data, especially in social sciences.
However, you might find data that comes in different formats. Besides Shapefiles, some of the most common file formats are KML and GeoJSON. KML and GeoJSON files are simpler and lighter than Shapefiles. If you’re working with Google platforms, it may well make sense to work directly with KML, as this is the standard file for such platforms.

### Comparison of common Open Vector File Formats for Spatial Data

**Shapefile**. This format is not a file, but a composition of several files. [The basic composition is](http://resources.arcgis.com/en/help/main/10.2/index.html#//005600000003000000): .shp stores the feature geometry; .shx stores the index of the feature geometry; .dbf stores the dataset associated.
- This is the most common format for exchanging vector data, especially in social sciences.
- Important files: .prj stores the coordinate system information; .xml stores metadata.
- Other files: .sbn, .sbx, .fbn, and .fbx (spatial indexes); .ain, .aih, and .atx, (attribute indexes); .ixs, and .mxs (geocoding indexes).

**KML**. KML stands for Keyhole Markup Language, and was developed by Keyhole, Inc. (acquired by Google), the company that originally developed Google Earth.
- Standard format file for working with Google’s platforms (Google Earth, Google Maps, etc.) KML by specification uses only a single projection, EPSG:4326. Every KML projection is based on this standard.
- KML is an Open Geospatial Consortium (OGC) standard data format.
- Complex datasets may be composed by various KML files and compressed in the KMZ format file.

**GeoJSON**. JSON is usually more efficient in storing data sets. [GeoJSON’s simplicity](http://www.macwright.org/2015/03/23/geojson-second-bite.html) makes it easy to use, read, and share. You can store multiple features into just one file. A nice feature of GeoJSON is that you can store multiple layers(points, lines, and polygons) in one file.
- GeoJSON files may have an optional coordinate reference system.
- There are some nice tools in the web for working with GeoJSON: geojsonlit to validate your data in a map; ogre.adc4gis.com for transforming from GeoJSON to Shapefile or viceversa; geojson.io for editing your map’s features.

**OSM**. As GeoJSON and KML files, OSM can include multiple layers in one file. | Native file format for OSM.
