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
housing_df <- read_csv(file = file.path(input_data_dir, "housing.csv"))

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

## Part V: Bonus Plot and Extra Git Points
#5.2 check git status
#hui@Huis-Air ps3_directory % git status 
#On branch main
#No commits yet
#Untracked files:
#(use "git add <file>..." to include in what will be committed)
#.gitignore
#analysis/
  #bib/
  #data/
  #huang_hui_ps3.R
#ps3_directory.Rproj
#nothing added to commit but untracked files present (use "git add" to track)

#5.3 git add 
#hui@Huis-Air ps3_directory % git add -A
#hui@Huis-Air ps3_directory % git status 
#On branch main

#No commits yet

#Changes to be committed:
  #(use "git rm --cached <file>..." to unstage)
#new file:   .gitignore
#new file:   analysis/files/housing.RDS
#new file:   analysis/huang_hui_ps3.Rmd
#new file:   analysis/huang_hui_ps3.pdf
#new file:   bib/apa.csl
#new file:   bib/references.bib
#new file:   data/housing.csv
#new file:   data/housing.zip
#new file:   huang_hui_ps3.R
#new file:   ps3_directory.Rproj

#5.4 git commit
#hui@Huis-MacBook-Air ps3_directory % git commit -m"adding files"

#5.5 git push 
#git push --set-upstream origin main
#URL: https://github.com/anyone-can-cook/ps3_huang_hui.git

## Part VI: Create a GitHub issue   


- Go to the [class repository](https://github.com/anyone-can-cook/rclass2_student_issues_w23/issues) and create a new issue.
- Please refer to [rclass2 student issues readme](https://github.com/anyone-can-cook/rclass2_student_issues_w23/blob/main/README.md) for instructions on how to post questions or things you've learned.
- You can either:
  - Ask a question that you have about this problem set or the course in general. Make sure to assign the instructors (@ozanj, @xochilthlopez, @joycehnguy, @augias) and mention your team (e.g., @anyone-can-cook/your_team_name).
  - Share something you learned from this problem set or the course. Please mention your team (e.g., @anyone-can-cook/your_team_name).
- You are also required to respond to at least one issue posted by another student.

- Paste the url to your issue here: 
- Paste the url to the issue you responded to here: 


## -----------------------------------------------------------------------------



## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
