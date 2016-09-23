if(!dir.exists("../data/")){
  dir.create("../data/")
}

beer_url <- "http://www.craftbeeranalytics.com/uploads/3/3/8/9/3389428/ratebeer_beerjobber.txt"

beer_data <- rio::import(beer_url)
names(beer_data) <- c("id", "name",
                     "brewer", "style",
                     "abv", "ratings",
                     "score_overall", "score_by_style")

rio::export(beer_data, "../data/beer-data.csv")
