.onLoad <- function(libname, pkgname) {
  options(java.parameters = c("-Xms1g", "-Xmx1g"))

  libraryPath = "inst/java/KOMORAN-36f59cf.jar"
  rJava::.jpackage(pkgname, morePaths = libraryPath, lib.loc = libname)
}
