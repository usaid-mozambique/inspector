
files <- list.files("inst/extdata",
                    pattern = "data_sqi_mapper.csv",
                    full.names = TRUE)


data_sqi_mapper <- readr::read_csv(files)


usethis::use_data(data_sqi_mapper,
                  overwrite = TRUE,
                  internal = FALSE) # change back to TRUE
