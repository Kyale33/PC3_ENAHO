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

#3. Unión de datos------------------------------------------------------

keys_hogar <- c("AÑO", "MES", "CONGLOME", "VIVIENDA", "HOGAR", "UBIGEO", "DOMINIO", "ESTRATO", "NCONGLOME", "SUB_CONGLOME")
keys_personas <- c(keys_hogar, "CODPERSO", "CODINFOR", "P203", "P204", "P205", "P206", "P207", "P208A", "P209")

enaho2025 <- mod400 %>% 
  left_join(mod300, by = keys_personas) %>% 
  left_join(mod500, by = keys_personas)

keys_gob <- c(keys_hogar, "CODPERSO", "CODINFOR")

enaho2025 <- enaho2025 %>% 
  left_join(mod_gob, by = keys_gob)

gc()

#4. Exportamos base de datos creada------------------------------------------------------
library(arrow)
renv::snapshot()
write_parquet(enaho2025, "datos/procesados/enaho_2025_120626.parquet")