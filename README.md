diagonals
-------------
[![CRAN Version](http://www.r-pkg.org/badges/version/diagonals)](http://cran.r-project.org/package=diagonals)
[![Travis-CI Build Status](https://travis-ci.org/bquast/diagonals.svg?branch=master)](https://travis-ci.org/bquast/diagonals) 
[![Coverage Status](https://img.shields.io/coveralls/bquast/diagonals.svg)](https://coveralls.io/r/bquast/diagonals?branch=master)

Block-diagonal matrices can be extracted or removed using two small functions implemented here, in addition, non-square matrices are supported.

Block diagonal matrices occur when we combine two dimensions of a data set along one edge of a matrix. For example, trade-flow data in the [decompr](http://cran.r-project.org/package=decompr) and [gvc](http://cran.r-project.org/package=gvc) package have each country-industry combination occur on each edge of the matrix.


Installation
-------------
The stable version of the `diagonals` package can be install from [CRAN](http://cran.r-project.org/package=diagonals) using:

    install.packages("diagonals")

The development version, to be used **at your peril**, can be installed using:

    if (!require('devtools')) install.packages('devtools')
    devtools::install_github("bquast/decompr")


Usage
-------
Following installation, the package can be loaded using:

    library(diagonals)

For general information on using the package, please refer to the help files    .

    help("diagonals")
    help(package = "diagonals")
    
For examples of usage, see the function specific help pages

    help("block_matrix")
    help("minus_block_matrix")
    help("rectangle_matrix")
    help("minus_rectangle_matrix")

In addition to the help files we provide long form examples in the **vignettes** .

    vignette("diagonals")
    vignette("network")
    
    # or
    browseVignettes("diagonals")


Additional Information
-----------------------
An overview of the changes is available in the NEWS file.

    news(package="diagonals")

There is also a blog post with information on my [personal website](http://qua.st/).

http://qua.st/diagonals/
 

Development
-------------
Development takes place on the [GitHub](http://github.com/) page.

http://github.com/bquast/diagonals

Bugs can be filed on the issues page on GitHub.

https://github.com/bquast/diagonals/issues
