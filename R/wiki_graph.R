#' Dataset creation for wiki graph.
#'
#' A dataset containing the edges of the graph from (v1 to v2) with the weight
#' of edge (w)
#'
#' @format A data frame with 18 rows and 3 variables:
#' \describe{
#'   \item{v1}{edge1 of graph}
#'   \item{v2}{edge2 of grpah}
#'   \item{w}{weight of the edge}
#' }
#' @source \url{https://en.wikipedia.org/wiki/Graph}
"wiki_data"
wiki_graph<- function(){
  v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6)
  v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5)
  w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
  wiki_data <- data.frame(v1,v2,w)
  save(wiki_data,file = "~/euclidspackage/Data/wiki.rda")
  load("~/euclidspackage/Data/wiki.rda")
}
