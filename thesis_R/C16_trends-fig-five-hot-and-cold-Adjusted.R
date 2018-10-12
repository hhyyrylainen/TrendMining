library(lattice)

## the scopus data had only 2 cold topics, even when the topic count
## was increased to 40 where there were only 7 papers per topic
cold_and_hot_ts <- cbind (
    ##theta_mean_by_year_ts[, topics_cold [1:2]],
    theta_mean_by_year_ts[, topics_cold [1:5]],
theta_mean_by_year_ts[, topics_hot [1:5]] , deparse.level =0)
#colnames (cold_and_hot_ts) <-as.character(c(topics_cold [1:5], topics_hot[1:5]))

colnames (cold_and_hot_ts) <-  as.character(c(unname(   Terms[1,topics_cold [1:5]]), unname(   Terms[1,topics_hot [1:5]])))


#png(width=1224, height = 800)
               
print ( xyplot ( cold_and_hot_ts ,
                   layout = c(2, 1) ,
                   screens = c( rep ("Cold topics", 5) , rep ("Hot topics", 5)),
                superpose = TRUE ,
                ## scopus
                ## ylim = c(0.005, 0.38) ,
                ## SO
                ylim = c(0.006, 0.068) ,
                   ylab = expression ( paste ("Mean",theta )),
                   xlab = " Year ",
                   type = c("l", "g"),
                   #auto.key = list ( space = " right "),
                   auto.key =
                   list(#title = "Iris Data",
                        x = .25, y=.93, corner = c(0,1),
                        border = TRUE, lines = TRUE), 
                   scales = list (x = list ( alternating = FALSE ))
                    # par . settings = standard . theme ( color = FALSE )
                    ))
#dev.off()
