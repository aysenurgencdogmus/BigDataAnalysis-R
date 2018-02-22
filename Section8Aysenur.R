x <- 0:5
class(x)
# "integer"
as.numeric(x)
 # 0 1 2 3 4 5 
as.logical(x)
# FALSE TRUE TRUE TRUE TRUE TRUE 
as.character(x)
#  "0" "1" "2" "3" "4" "5" 


y <- c("a", "b", "c")
as.numeric(y)
# Warning: NAs introduced by coercion
# NA NA NA
as.logical(y)
# NA NA NA
as.complex(y)
#Warning: NAs introduced by coercion
#NA NA NA