## Put comments here that give an overall description of what your
## functions do

## Return set, get, setinv and get inv functions for each object created by makeCacheMatrix; at the beginning mat (which means the inverse outcome) is set to be NULL
makeCacheMatrix <- function(x = matrix()) {
 mat <- NULL
 set = function(y){
   x <<- y
   mat <<- NULL
 }
 get <- function() x
 setinv <- function(inv) mat <<- inv
 getinv <- function() mat
 list(set = set, get = get,
      setinv = setinv,
      getinv = getinv)
}


## calculate the inverse matrix or load the inverse matrix from cache (if calculated) by calling the object x and mat which are in global env

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  mat <- x$getinv()
  if(!is.null(mat)){
    message("getting cached data")
    return(mat)
  }
  data <- x$get()
  mat <- solve(data, ...)
  x$setinv(mat)
  mat
}

