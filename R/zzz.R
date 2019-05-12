.onLoad <- function(libname, pkgname) {
  rJava::.jpackage(pkgname, lib.loc = libname)
  rJava::.jaddClassPath("inst/java/KOMORAN-3.3.4.jar")
}
