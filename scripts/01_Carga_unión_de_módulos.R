#===========================================================================
# Proyecto: Análisis de la informalidad laboral usando datos de la ENAHO
# Autor: Kyara Ronchi
# Fecha: 14-06
# Objetivo del script: Cargar los módulos y hacer los joins
#===========================================================================

#1. Carga de librerías------------------------------------------------------
library(rio)
library(tidyverse)
library(janitor)
library(readr)

renv::snapshot(force = TRUE)
file.exists("renv.lock")
system("git add renv.lock -f")


#2. Importar datos------------------------------------------------------

mod300 = import("Enaho01A-2025-300.csv", encoding = "Latin-1")
mod400 = import("Enaho01A-2025-400.csv", encoding = "Latin-1")
mod500 = import("Enaho01a-2025-500.csv", encoding = "Latin-1")
mod_gob = import("Enaho01B-2025-1.csv", encoding = "Latin-1")
