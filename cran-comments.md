## Test environments
* local Windows 7 install, R 3.2.0 Rtools 3.3.0
* local Linux (Arch) install, R 3.1.3
* local OSX 10.10.3 install, R 3.2.0
* ubuntu 12.04 (on travis-ci), R 3.2.0
* win-builder (devel and R 3.2.0)

## R CMD check results
There were no ERRORs or WARNINGs. 

There were 3 NOTES:

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Bastiaan Quast <bquast@gmail.com>'
New submission

* checking package dependencies ... NOTE
  No repository set, so cyclic dependency check skipped

Found the following (possibly) invalid URLs:
 URL: http://cran.r-project.org/?package=diagonals
   From: README.md
   Status: 404
   Message: Not Found

I am anticipating that this URL will become valid, if the package is excepted.
