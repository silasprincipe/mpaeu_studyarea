### MPA EUROPE PROJECT - OBIS ###
### Generate alternative shapefiles of the study area ###

# April 2023 - s.principe@unesco.org #

# Load packages ----
# Spatial manipulation
library(sf)
library(tidyverse)
# Other/visualization
library(ggplot2)
library(mapview)
# Settings
sf_use_s2(FALSE)


# Load study area shapefile (see study_area.R) ----
st.area <- read_sf("data/shapefiles/mpa_europe_starea.shp")


# Produce alternative shapefiles ----
# Simplified shapefile for simpler maps, illustrations, etc
st.area.simp <- st_simplify(st.area, dTolerance = 0.1)
plot(st.area.simp)

st_write(st.area.simp, "data/shapefiles/mpa_europe_starea_simple.shp")


# Reproject for Lambert Azimuthal Equal Area projection
st.area.rep <- st_transform(st.area, "EPSG:3035")
plot(st.area.rep)

st_write(st.area.simp, "data/shapefiles/mpa_europe_starea_laea3035.shp")



