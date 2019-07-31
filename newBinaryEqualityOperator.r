# rewrites the == operator to randomly fail ~90% of the time -- gives opposite answer

oldequalsequals <- `==`;

`oldequalsequals` <- `==`;
`==` <- function(x,y){
    if(runif(1) < 0.9){
        return( `oldequalsequals`(x, y))
    } else {
        return(! `oldequalsequals`(x,y))
        }
}

# see this for more on functions in R:
# http://adv-r.had.co.nz/Functions.html#all-calls
