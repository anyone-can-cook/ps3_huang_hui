################################################################################
##
## [ PROJ ] < Problem set #3 >
## [ FILE ] < ps3 >
## [ AUTH ] < Hui Huang / GitHub handle >
## [ INIT ] < 02/01/2023 >
##
################################################################################

## ---------------------------
## libraries
library(tidyverse)
## ---------------------------

## ---------------------------
## directory paths
input_data_dir <- file.path('.', 'data')
bib_dir <- file.path('.', 'bib')
analysis_dir <- file.path('.', 'analysis')
output_file_dir <-file.path('.', 'analysis', 'files')
## ---------------------------

## -----------------------------------------------------------------------------
## Part I - Setting up project directory and R script
#3.3 Extra credit
# pwd
# git init

#3.5 download files
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/housing.zip",
              destfile = file.path(input_data_dir), "housing.zip")
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/apa.csl",
              destfile = file.path(bib_dir, "apa.csl"))
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/references.bib",
              destfile = file.path(bib_dir, "references.bib"))
download.file(url = "https://anyone-can-cook.github.io/rclass2/data/ps2/ps2_template.Rmd",
              destfile = file.path(analysis_dir, "huang_hui_ps3.Rmd"))

## Part II: Reading, manipulating, and writing data
#2.1 unzip housing data
unzip(zipfile = file.path(input_data_dir, "housing.zip"),
      exdir = input_data_dir)

#2.2 read data
housing_df <- read_csv(file = file.path(input_data_dir, "housing.zip"))

#2.3 create scatterplot
ggplot(data = housing_df, mapping = aes(x = median_income, y = median_house_value)) + geom_point()

#2.4 filter data
housing_df %>% filter(median_house_value <= 500000) %>% 
  ggplot(mapping = aes(x = median_income, y = median_house_value)) + geom_point() 

#2.5 examine ocean_proximity
#typeof(housing_df$ocean_proximity)
#str(housing_df$ocean_proximity)
#table(housing_df$ocean_proximity)
housing_df %>% ggplot(mapping = aes(x = median_income, y = median_house_value, color = ocean_proximity)) + 
  geom_point()

#2.6 rearrange levels 
housing_df$ocean_proximity <- factor(housing_df$ocean_proximity, levels = c('ISLAND', 'NEAR BAY', 'NEAR OCEAN', '<1H OCEAN', 'INLAND'), ordered = TRUE)
housing_df %>% ggplot(mapping = aes(x = median_income, y = median_house_value, color = ocean_proximity)) + 
  geom_point()

#2.7 save housing file
saveRDS(housing_df, file.path(output_file_dir, "housing.RDS"))

##Part III: RMarkdown report and citations

## -----------------------------------------------------------------------------



## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
