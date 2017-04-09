# Using simpleRCache



## Usage

```r
# Example function to cached
fib <- function(n) {
 
    # Handle "vectors" by element
    if (length(n) > 1) {
        return(sapply(n, fib))
    }
 
    # Base cases
    if (n == 0) 
        return(0)
    if (n == 1) 
        return(1)
 
    # Check to see if n is an integer Do not use is.integer as that is very
    # strict
    if (round(n, 0) != n) 
        return(NA)
 
    # Negative numbers
    if (n < 0) 
        return(fib(-1 * n) * ((-1)^((n + 1)%%2)))
 
    # Everything else
    return(fib(n - 1) + fib(n - 2))
}

library(simpleRCache)

setCacheRootPath()

fibCached <- addMemoization(fib)

nums <- -25:25
 
system.time(fibResults <- fib(nums))
```

```
##    user  system elapsed 
##   1.746   0.017   1.780
```

```r
system.time(fibResults1 <- fibCached(nums))
```

```
##    user  system elapsed 
##   1.706   0.017   1.742
```

```r
# Second run should be cached
system.time(fibResults2 <- fibCached(nums))
```

```
##    user  system elapsed 
##       0       0       0
```

```r
identical(fibResults, fibResults2)
```

```
## [1] TRUE
```

```r
identical(fibResults1, fibResults2)
```

```
## [1] TRUE
```

# Debugging

* To show debugging information
```
Sys.setenv("DEBUG_SIMPLERCACHE"="TRUE")
```

* To add a prefix to generated files
```
Sys.setenv("PREFIX_SIMPLERCACHE"="prefix")
```

## Session Info


```r
sessionInfo()
```









