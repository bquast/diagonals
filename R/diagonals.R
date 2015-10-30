#' @name diagonals
#' @docType package
#' @title diagonals
#' @author Bastiaan Quast \email{bquast@@gmail.com}
#' @description Several tools for handling block-matrix diagonals and similar
#' constructs are implemented. Block-diagonal matrices can be extracted or removed
#' using two small functions implemented here. In addition, non-square matrices
#' are supported. Block diagonal matrices occur when two dimensions of a data set
#' are combined along one edge of a matrix. For example, trade-flow data in the
#' decompr' and 'gvc' packages have each country-industry combination occur along
#' both edges of the matrix.
#' @seealso http://qua.st/diagonals
NULL
.onAttach <- function(...) {
  packageStartupMessage('
D I
A G
    O N
    A L
        S')}
