diagonals
=========

[![License](https://img.shields.io/badge/license-GPLv3-brightgreen.svg)](https://www.gnu.org/licenses/gpl-3.0.html)
[![CRAN Version](https://www.r-pkg.org/badges/version/diagonals)](https://cran.r-project.org/package=diagonals)
[![R build status](https://github.com/bquast/diagonals/workflows/R-CMD-check/badge.svg)](https://github.com/bquast/diagonals/actions?workflow=R-CMD-check)
[![Coverage Status](https://img.shields.io/codecov/c/github/bquast/diagonals/master.svg)](https://codecov.io/bquast/diagonals/diagonals?branch=master)
[![Total RStudio Cloud Downloads](http://cranlogs.r-pkg.org/badges/grand-total/diagonals?color=brightgreen)](https://cran.r-project.org/package=diagonals)
[![RStudio Cloud Downloads](https://cranlogs.r-pkg.org/badges/diagonals?color=brightgreen)](https://cran.r-project.org/package=diagonals)

Block-diagonal matrices can be extracted or removed using two small functions implemented here, in addition, non-square matrices are supported.

Block diagonal matrices occur when we combine two dimensions of a data set along one edge of a matrix. For example, trade-flow data in the [decompr](https://cran.r-project.org/package=decompr) and [gvc](https://cran.r-project.org/package=gvc) package have each country-industry combination occur on each edge of the matrix.

Demonstration
-------------
![diagonals demonstration](https://github.com/bquast/R-demo-GIFs/blob/master/diagonals.gif)


Installation
-------------
The stable version of the `diagonals` package can be install from [CRAN](https://cran.r-project.org/package=diagonals) using:

```r
install.packages("diagonals")
```

The development version, to be used **at your peril**, can be installed using:

```r
if (!require('remotes')) install.packages('remotes')
remotes::install_github("bquast/diagonals")
```


Usage
-------
Following installation, the package can be loaded using:

```r
library(diagonals)
```

For general information on using the package, please refer to the help files    .

```r
help("diagonals")
help(package = "diagonals")
```
    
For examples of usage, see the function specific help page.

```r
help("fatdiag")
```

In addition to the help files we provide long form examples in the **vignettes** .

```r
vignette("fatdiag")

# or
browseVignettes("diagonals")
```


Additional Information
-----------------------
An overview of the changes is available in the NEWS file.

```r
news(package="diagonals")
```

There is also a blog post with information on my [personal website](https://qua.st/).

https://qua.st/diagonals/
 

Development
-------------
Development takes place on the GitHub page.

https://github.com/bquast/diagonals

Bugs can be filed on the issues page on GitHub.

https://github.com/bquast/diagonals/issues
