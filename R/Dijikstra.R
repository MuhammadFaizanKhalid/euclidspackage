#' Dijkstra Algorithm
#' Returns the shortest path from initial vertex to other vertexes
#' @param graph A \code{data.frame} which consist of 3 vectors named \code{v1}, \code{v1} and \code{w} and all must have the same length as shown in the example. \code{v1} and \code{v2} represent one edge in the graph, while \code{w} holds the distance. Edges must be included twice, from \code{v1} to \code{v2} and the other way round.
#' @param init_node A scalar stating from which vertexes the distances are to be calculated.
#'
#' @return Returns a vector consisting of the shortest paths from the node of origin \code{init_node} to the rest of the vertexes.
#'
#' @references https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
#'
#' @examples
#' dijkstra(wiki_data, 1)
#' dijkstra(wiki_data, 3)
#' @import wiki_graph
#' @export
dijkstra = function(graph, init_node) {

  if (!is.data.frame(graph) || length(graph) != 3) stop()
  if (!is.numeric(init_node)) stop()
  if (length(setdiff(names(graph),  c('v1', 'v2', 'w'))) > 1) stop()
  if (!init_node %in% graph$v1) stop()
  vertices = data.frame(unique(graph[1]),
                        rep(FALSE, times = length(graph[1])),
                        rep(Inf, times = length(graph[1])))
  names(vertices) = c("Edge", "Visited", "Distance")

  vertices[vertices$Edge == init_node, 3] = 0
  current_vertex = init_node

  while (nrow(vertices[!vertices$Visited,]) > 0) {
    for (i in 1:nrow(graph)) {
      if (graph[i, 1] == current_vertex && !vertices[vertices$Edge == graph[i, 2], 2]) {
        tentative.distance = graph[i, 3] + vertices[vertices$Edge == current_vertex, 3]
        if (tentative.distance < vertices[vertices$Edge == graph[i, 2], 3]) {
          vertices[vertices$Edge == graph[i, 2], 3] = tentative.distance
        }
      }
    }

    vertices[vertices$Edge == current_vertex, 2] = TRUE

    unvisited.vertices = vertices[vertices$Visited == FALSE,]
    if (length(unvisited.vertices[, 3]) != 0) {
      current_vertex = unvisited.vertices[unvisited.vertices[[3]] == min(unvisited.vertices[, 3]), 1]
      if (length(current_vertex) > 1) {
        current_vertex = current_vertex[1]
      }
    }
  }
  return(vertices$Distance)
}
