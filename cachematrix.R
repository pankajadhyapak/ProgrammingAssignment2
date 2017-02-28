## function pair that cache the inverse of a matrix

##Create a matrix object that can cache its inverse
makeCacheMatrix <- function(m = matrix()) {

    ## Initialize the inverse
    im <- NULL

    ## Method to set the matrix
    set <- function(matrix){
        m <<- matrix
        im <<- NULL
    }

    ## Method the get the matrix
    ## Return the matrix
    get <- function() {
        m
    }

    ## Method to set the inverse of the matrix
    setInverse <- function(inverse) {
        im <<- inverse
    }

    ## Method to get the inverse of the matrix
    ## Return the inverse property
    getInverse <- function() {
        i
    }

    ## Return a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## cacheSolve computes the inverse of the matrix returned by makeCacheMatrix function. 
## If the inverse is already calculated and the matrix has not changed, 
## then the cachesolve will retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {

    ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()

    ## Return the inverse of matrix if its already set
    if( !is.null(m) ) {
        message("Getting Cached data")
        return(m)
    }

    ## Get the matrix from our object
    data <- x$get()

    ## compute the inverse using matrix multiplication
    m <- solve(data) %*% data

    ## Set the inverse to the object
    x$setInverse(m)

    ## Return the matrix
    m
}
