## This code uses the scoping rules in R to cache the inverse of a square, invertible
## matrix. This method eliminates the need to recompute the inverse of a matrix in
## certain calculations.

## This function takes a (square) matrix and stores the matrix as a list that contains
## a fucntion to set and retrieve the matrix and its inverse.

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

## This function calcultes the inverse of the matrix created above. It first checks to see
## if the inverse has already been calculated. If the inverse already exist, it returns the cached 
## value of the inverse. If not, the inverse is calculated via the setinv function.

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
