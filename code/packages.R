ipak <- function(pkg){
  ## a function that loads packages, installing them if they aren't
  ## already
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}


## Packages used
packages <- c("rio", "tidyverse", "xtable", "knitr")
## Install & load them
ipak(packages)

## clean up
rm(packages, ipak)
