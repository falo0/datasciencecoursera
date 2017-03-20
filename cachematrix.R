## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#It creates a list object which contains 4 function objects.
#Using the set() function will cache x and using setinv() will cache the inverse of x
makeCacheMatrix <- function(x = matrix()) {
  inv = NULL
  set = function(y){
    x <<- y
    inv <<- NULL
  }
  get = function() x
  setinv = function(inverse) inv <<- inverse
  getinv = function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function
#If the inverse (inv) is already cached, so that x$getinv() can return a value !=0, this already cached inv is simply returned
#Otherwise the inverse is calculated and cached by using the x$setinv() function. Then inv is returned.
cacheSolve <- function(x, ...) {
  inv = x$getinv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data = x$get()
  inv = solve(data)
  x$setinv(inv)
  inv
}

## Testing 
x = matrix(c(1:6, -2,-3, 7), 3, 3)
specialMatrix = makeCacheMatrix(x)
specialMatrix$getinv() #returning NULL as expected bc setinv() was not used yet
cacheSolve(specialMatrix)
specialMatrix$getinv() #returning the inverse as it should