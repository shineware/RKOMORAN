.onLoad <- function(libname, pkgname) {
  options(java.parameters = c("-Xms1g", "-Xmx1g", "-Dfile.encoding=UTF-8"))

  libraryPath = "inst/java/KOMORAN-36f59cf.jar"
  rJava::.jpackage(pkgname, morePaths = libraryPath, lib.loc = libname)
}
