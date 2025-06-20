### Code: Calculate PAM richness
### Project: Neotropical dry forest bees
### Author: Andres Herrera

#Required libraries:
if(!require(remotes)){
  install.packages("remotes")
}

# To install the package use
remotes::install_github("claununez/biosurvey", force = T)

# To install the package and its vignettes use (if needed use: force = TRUE)  
remotes::install_github("claununez/biosurvey", build_vignettes = TRUE)

#Libraries
library(biosurvey)
library(terra)

# Establishing working directory
setwd("Z:/Andres/NDF_bees_project/")

# DRYFLOR PD:
region <- vect("./Shapefiles/STDF/dryflor/seasonally_dryfo_dis.shp")
plot(region)

#DRYFLOR occurrences:
occ_species <- read.csv("Z:/Andres/NDF_bees_project/Data/STDF_bees_occ/dryflor/species/dryflor_species_occ.csv")
head(occ_species)
occ_species <- occ_species %>% select(longitude,latitude,species) 
colnames(occ_species)[c(1,2,3)]<- c("Longitude","Latitude","Species")

#Grids 50 km:
b_pam_species_50 <- prepare_base_PAM(data = occ_species[,c(1,2,3)], region = region, 
                                     cell_size = 50, indices = "all") 
summary(b_pam_species_50)
pamin <- b_pam_species_50$PAM
pamin$Richness <- b_pam_species_50$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pam_rich, "Shapefiles/PAM/dryflor/species/50/dryflor_pam_species_50.shp", overwrite = TRUE)

#Grids 75 km:
b_pam_species_75 <- prepare_base_PAM(data = occ_species[,c(1,2,3)], region = region, 
                                     cell_size = 75, indices = "all") 
summary(b_pam_species_75)
pamin <- b_pam_species_75$PAM
pamin$Richness <- b_pam_species_75$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pam_rich, "Shapefiles/PAM/dryflor/species/75/dryflor_pam_species_75.shp", overwrite = TRUE)

#Grids 100 km:
b_pam_species_100 <- prepare_base_PAM(data = occ_species[,c(1,2,3)], region = region, 
                                      cell_size = 100, indices = "all") 
summary(b_pam_species_100)
pamin <- b_pam_species_100$PAM
pamin$Richness <- b_pam_species_100$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pam_rich, "Shapefiles/PAM/dryflor/species/100/dryflor_pam_species_100.shp", overwrite = TRUE)


#####___Genera___####

occ_genus <- read.csv("Z:/Andres/NDF_bees_project/Data/STDF_bees_occ/dryflor/genera/dryflor_genera_occ.csv")
head(occ_genus)
occ_genus <- occ_genus %>% select(longitude,latitude,genus) 
colnames(occ_genus)[c(1,2,3)]<- c("Longitude","Latitude","Species")


#Grids 50 km:
b_pam_genus_50 <- prepare_base_PAM(data = occ_genus[,c(1,2,3)], region = region, 
                                   cell_size = 50, indices = "all") 
summary(b_pam_genus_50)
pamin <- b_pam_genus_50$PAM
pamin$Richness <- b_pam_genus_50$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pamin, "Shapefiles/PAM/dryflor/genera/50/dryflor_pam_genera_50.shp", overwrite = TRUE)

#Grids 75 km:
b_pam_genus_75 <- prepare_base_PAM(data = occ_genus[, c(1,2,3)], region = region, 
                                   cell_size = 75, indices = "all") 
summary(b_pam_genus_75)
pamin <- b_pam_genus_75$PAM
pamin$Richness <- b_pam_genus_75$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pam_rich, "Shapefiles/PAM/dryflor/genera/75/dryflor_pam_genera_75.shp", overwrite = TRUE)


#Grids 100 km:
b_pam_genus_100 <- prepare_base_PAM(data = occ_genus[, c(1,2,3)], region = region, 
                                    cell_size = 100, indices = "all") 
summary(b_pam_genus_100)
pamin <- b_pam_genus_100$PAM
pamin$Richness <- b_pam_genus_100$PAM_indices$Richness
pamin$Richness_n <- b_pam_genus_100$PAM_indices$Richness_normalized
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pamin, "Shapefiles/PAM/dryflor/genera/100/dryflor_pam_genera_100.shp", overwrite = TRUE)

############################## TEOW ###############################

# Establishing working directory
setwd("Z:/Andres/NDF_bees_project/")

# Reading region of interest
region <- vect("Shapefiles/STDF/teow/Tropical & Subtropical Dry Broadleaf Forest.shp")
plot(region)

#Species
occ_species <- read.csv("./Data/STDF_bees_occ/teow/species/teow_species_occ.csv")
head(occ_species)
occ_species <- occ_species %>% select(longitude,latitude,species) 
colnames(occ_species)[c(1,2,3)]<- c("Longitude","Latitude","Species")

#Grids 50 km:
b_pam_species_50 <- prepare_base_PAM(data = occ_species[,c(1,2,3)], region = region, 
                                     cell_size = 50, indices = "all") 
summary(b_pam_species_50)
pamin <- b_pam_species_50$PAM
pamin$Richness <- b_pam_species_50$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pam_rich, "Shapefiles/PAM/teow/species/50/teow_pam_species_50.shp", overwrite = TRUE)


#Grids 75 km:
b_pam_species_75 <- prepare_base_PAM(data = occ_species[,c(1,2,3)], region = region, 
                                     cell_size = 75, indices = "all") 
summary(b_pam_species_75)
pamin <- b_pam_species_75$PAM
pamin$Richness <- b_pam_species_75$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pam_rich, "Shapefiles/PAM/teow/species/75/teow_pam_species_75.shp", overwrite = TRUE)


#Grids 100 km:
b_pam_species_100 <- prepare_base_PAM(data = occ_species[,c(1,2,3)], region = region, 
                                      cell_size = 100, indices = "all") 
summary(b_pam_species_100)
pamin <- b_pam_species_100$PAM
pamin$Richness <- b_pam_species_100$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pam_rich, "Shapefiles/PAM/teow/species/100/teow_pam_species_100.shp", overwrite = TRUE)


#####___Genera___####

# Reading region of interest
region <- vect("Shapefiles/STDF/teow/Tropical & Subtropical Dry Broadleaf Forest.shp")
plot(region)

#Gnera
occ_genus <- read.csv("Z:/Andres/NDF_bees_project/Data/STDF_bees_occ/teow/genera/teow_genera_occ.csv")
head(occ_genus)
occ_genus <- occ_genus %>% select(longitude,latitude, genus) 
colnames(occ_genus)[c(1,2,3)]<- c("Longitude","Latitude","Species")


#Grids 50 km:
b_pam_genus_50 <- prepare_base_PAM(data = occ_genus[,c(1,2,3)], region = region, 
                                   cell_size = 50, indices = "all") 
summary(b_pam_genus_50)
pamin <- b_pam_genus_50$PAM
pamin$Richness <- b_pam_genus_50$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pamin, "Shapefiles/PAM/teow/genera/50/teow_pam_genera_50.shp", overwrite = TRUE)

#Grids 75 km:
b_pam_genus_75 <- prepare_base_PAM(data = occ_genus[, c(1,2,3)], region = region, 
                                   cell_size = 75, indices = "all") 
summary(b_pam_genus_75)
pamin <- b_pam_genus_75$PAM
pamin$Richness <- b_pam_genus_75$PAM_indices$Richness
pam_rich <- pamin[,c("ID","Longitude","Latitude","Richness")]
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pamin, "Shapefiles/PAM/teow/genera/75/teow_pam_genera_75.shp", overwrite = TRUE)

#Grids 100 km:
b_pam_genus_100 <- prepare_base_PAM(data = occ_genus[, c(1,2,3)], region = region, 
                                    cell_size = 100, indices = "all") 
summary(b_pam_genus_100)
pamin <- b_pam_genus_100$PAM
pamin$Richness <- b_pam_genus_100$PAM_indices$Richness
pamin$Richness_n <- b_pam_genus_100$PAM_indices$Richness_normalized
setwd("Z:/Andres/NDF_bees_project/")
writeVector(pamin, "Shapefiles/PAM/teow/genera/100/teow_pam_genera_100.shp", overwrite = TRUE)
