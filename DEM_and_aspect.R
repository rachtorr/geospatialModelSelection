library(raster)

setwd("~/Google Drive File Stream/Shared drives/PSTAT-Geospatial_Model_Selection/Data/")

# laod in data 
dem1 <- raster("Elevation/Map_USGS_NED_13_n38w120_ArcGrid/grdn38w120_13/w001001x.adf")
dem2 <- raster("Elevation/USGS_NED_13_n38w119_ArcGrid/grdn38w119_13/w001001x.adf")
dem3 <- raster("Elevation/USGS_NED_13_n39w120_ArcGrid/grdn39w120_13/w001001x.adf")

# merge all three scenes together
bigDem <- mosaic(dem1, dem2, dem3, fun="mean")
writeRaster(bigDem, "Elevation/dem_combined.tif")

# aspect
aspect <- terrain(bigDem, opt='aspect')
writeRaster(aspect, "Elevation/aspect.tif", overwrite=T)

# load in point data 
CDEC_SWE_data <- read_excel("/Volumes/GoogleDrive/Shared drives/PSTAT-Geospatial_Model_Selection/Data/CDEC_SWE_data.xlsx")

pts <- CDEC_SWE_data[,5:6]
spdf <- SpatialPointsDataFrame(coords=pts, data=CDEC_SWE_data)


plot(sdep2, main="Study Area with snow depth (m) and snow pillow sites", xlab="lon", ylab="lat")
points(coords, col=data$river.basin)
legend(x=-119.1, y=38.2, pch=19, col=unique(data$river.basin), legend=unique(data$river.basin))

colors <- c("red", "orange", "blue")
cols <- colors[data$River.Basin]
