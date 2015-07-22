## Put comments here that give an overall description of what your
## functions do

## Thus function creates a matrix object that is used to store a cached
## version of its inverse

makeCacheMatrix <- function(x = matrix()) {
     Inv <- NULL
     set <- function(y) {
          x <<- y
          Inv <<- NULL
     }
     get <- function() x
     setinv <- function(solve) Inv <<- solve
     getinv <- function() Inv
     list(set = set, get = get,
          setinv = setinv,
          getinv = getinv)
}

## This function takes a cached matrix and finds its inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     Inv <- x$getinv()
     if(!is.null(Inv)){
          message("getting cached data...")
     }
     Mat <- x$get()
     Inv <- solve(Mat, ...)
     x$setinv(Inv)
     Inv
}
