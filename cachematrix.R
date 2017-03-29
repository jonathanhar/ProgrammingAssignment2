## The following two functions provide a simply way to cache the
## inverse of a matrix.

## makeCacheMatrix returns a list of functions that operate on a 
## matrix x. These functions allow caching the inverse of x.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inv_result) inv <<- inv_result
  getinv <- function() inv
  list(get = get,
       set = set,
       setinv = setinv,
       getinv = getinv)
}


## The following function calculates the inverse of
## the matrix that has been passed to the above function.
## However, it first checks to see if the inverse has 
## already been calculated.

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setinv(inv)
  inv
}
