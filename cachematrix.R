## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL

    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x

    # Iom: Inverse of a Matrix
    setIom <- function(iom) inverse <<- iom
    getIom <- function() inverse

    list(
        set = set,
        get = get,
        setIom = setIom,
        getIom = getIom
    )
}

## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve should retrieve the inverse 
## from the cache.
## Computing the inverse of a square matrix can be done with the solve function 
## in R. For example, if X is a square invertible matrix, then solve(X) returns 
## its inverse.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$getIom()

    if (!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    
    inverse <- solve(x$get(), ...)
    x$setIom(m)
    inverse
}
