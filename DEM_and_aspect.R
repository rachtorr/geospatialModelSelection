library(raster)

setwd("~/Google Drive File Stream/Shared drives/PSTAT-Geospatial_Model_Selection/Data/")

# laod in data 
dem1 <- raster("Elevation/Map_USGS_NED_13_n38w120_ArcGrid/grdn38w120_13/w001001x.adf")
dem2 <- raster("Elevation/USGS_NED_13_n38w119_ArcGrid/grdn38w119_13/w001001x.adf")
dem3 <- raster("Elevation/USGS_NED_13_n39w120_ArcGrid/grdn39w120_13/w001001x.adf")

# merge all three scenes together
bigDem <- mosaic(dem1, dem2, dem3, fun="mean")

# aspect
aspect <- terrain(bigDem, opt='aspect')

