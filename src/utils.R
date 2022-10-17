zscore <- function (x, n = 0) {
    x_without_na <- x[!is.na(x)]
    xmu <- mean(x_without_na)
    if (n == 0) {
        n <- length(x_without_na)
        stdev <- sqrt(sum((x_without_na - xmu)^2)/n)
        x_z <- (x_without_na - xmu)/stdev
    }
    else if (n == -1) {
        x_z <- (x_without_na - xmu)/sd(x_without_na)
    }
    return(x_z)
}
