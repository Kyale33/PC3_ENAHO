#===========================================================================
# Proyecto: Análisis de la informalidad laboral usando datos de la ENAHO
# Autor: Kyara Ronchi
# Fecha: 14-06
# Objetivo del script: Creación de carpetas y enlace con GitHub
#===========================================================================

#Creamos carpetas-----------------------------

dir.create("datos")
dir.create("datos/crudos")
dir.create("datos/procesados")
dir.create("outputs")
dir.create("docs")

#Enlace con Git y GitHub
install.packages("usethis")
install.packages(c("stringi", "rlang", "glue", "gert", "usethis"), dependencies = TRUE)
usethis::use_git()
usethis::use_git_config(
  user.name = "Kyale33", 
  user.email = "ronchi.kyara@pucp.edu.pe"
)
usethis::use_github()
