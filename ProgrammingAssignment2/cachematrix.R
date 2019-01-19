## The following two functions can calculate, cache and return the inverse of a square matrix.
## Matrix inversion can use a lot of CPU time, so the cache is first checked for the inverse
##  to avoid having to recalculate it.
##
## First, the function "makeCacheMatrix" executes four steps to create a special "matrix"
##  object "x" and cache its inverse: (1) set the object value; (2) get the object value;
##  (3) set the inverse; and (4) get the inverse.
##
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y){
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function(solveMatrix) inv <<- solveMatrix
        getInverse <- function() inv
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}
##
## Second, the function "cacheSolve" receives the object "x",
##
cacheSolve <- function(x, ...) {
        ##        
        ##  retrieves and returns its inverse if it is found in the cache,
        ##
        inv <- x$getInverse()
        if(!is.null(inv)){
                message("Inverse from cache")
                return(inv)
        }
        ##       
        ##  or calculates, caches and returns the inverse:
        ##       
        data <- x$get()
        inv <- solve(data)
        x$setInverse(inv)
        message("Inverse calculated")
        inv
}