rm(list = ls())




library(raster)
library(rasterVis)
library(ncdf4)
library(lattice)

ncfile = ncdf4::nc_open("C:\\Users\\Zia Foisal\\Downloads\\ETH_ACAG\\ETH_Combinned\\ETH_AP_1998to2022_mean.nc")
names(ncfile$var)


#Change the Input path.
input_nc = "C:\\Users\\Zia Foisal\\Downloads\\ETH_ACAG\\ETH_Combinned\\ETH_AP_1998to2022_mean.nc"
varname = 'PM25'
nc2raster = raster(input_nc,varname = varname,band = 1)

#To output a quick view for the dataset
png("C:\\Users\\Zia Foisal\\Downloads\\ETH_ACAG\\ETH_Combinned\\plot1998t2022.png",
    height = 15,
    width = 20,
    units = 'cm',
    res = 1000)
print(levelplot(nc2raster))
dev.off()


nc2raster = stack(input_nc,varname = varname)

output = 'C:\\Users\\Zia Foisal\\Downloads\\ETH_ACAG\\ETH_Combinned\\ETH_AP_1998TO2022_MEAN.tif'
writeRaster(nc2raster,output,format = 'GTiff',overwrite = TRUE)
#Change the output path to save Geotif data.
