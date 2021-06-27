
bad <- filter(df , class == 1 )
good <- filter(df , class == 0)

rc <- 191

bad_count <- 44
good_count <- rc - bad_count

pick_b <- sample_n(bad , size = 44)
pick_c <- sample_n(good , size = good_count)

portfolio <- bind_rows(pick_b , pick_c)

set.seed(42)
rows <- sample(nrow(portfolio))
portfolio <- portfolio[rows,]



library(charlatan)

eng <- charlatan::ch_company(n = 63 , locale = "en_US")
cs <- charlatan::ch_company(n = 25 , locale = "cs_CZ")
fr <- charlatan::ch_company(n = 32 , locale = "fr_FR")
sp <- charlatan::ch_company(n = 51 , locale = "de_DE")
hr <- charlatan::ch_company(n = 20 , locale = "hr_HR")

countries <- c(rep("US" , 63) , rep("CZ" , 25) , rep("France" , 32) ,
                rep("Germany" , 51) , rep("Hungary" , 20))

company_names <- list(eng , cs , fr , sp , hr)

company <- data.frame(company_names =unlist(company_names) , country = unlist(countries))

rows <- sample(nrow(company))

company <- company[rows ,]

portfolio$name <- company$company_names
portfolio$country <- company$country


exposure <- runif(191 , 0.1 , 1)

hist(exposure)

base <- 1000

e2 <- base ^ (1 -exposure) * (100000)

hist(e2)

portfolio$exposure <- format(e2 ,digits = 2)




probability <- sapply(portfolio$class , function(x){
  if(x == 1){
    runif(1 , min = .55 , .99)
  }else{
    runif(1 , 0.0001 , .48)
  }
})

portfolio$default_prob <- probability
portfolio$exposure <- as.numeric(portfolio$exposure)
portfolio$default_prob <- as.numeric(portfolio$default_prob)

portfolio$var <- portfolio$exposure * portfolio$default_prob

by_country <- group_by(portfolio , country) %>% summarise(risk = sum(var))



portfolio <- relocate(portfolio , c(name , country , exposure , var, default_prob))




write_rds(portfolio , "data/portfolio.rds")

