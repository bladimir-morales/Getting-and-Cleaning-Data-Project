# Getting-and-Cleaning-Data-Project

## Proyecto del curso

Debe crear un script de R llamado run_analysis.R que haga lo siguiente.

1. Fusiona los conjuntos de entrenamiento y prueba para crear un conjunto de datos.
2. Extrae solo las medidas de la media y la desviación estándar de cada medida.
3. Utiliza nombres de actividades descriptivos para nombrar las actividades en el conjunto de datos.
4. Etiquete adecuadamente el conjunto de datos con nombres de actividades descriptivos.
5. Crea un segundo conjunto de datos ordenado e independiente con el promedio de cada variable para cada actividad y cada tema.

## Pasos para trabajar en este proyecto de curso

1. Descargue la fuente de datos y colóquela en una carpeta en su disco local. Tendrá una carpeta `UCI HAR Dataset`.
2. Ponga  `run_analysis.R` en la carpeta principal de `UCI HAR Dataset`, luego configúrelo como su directorio de trabajo usando la función `setwd()` en RStudio.
3. Ejecute `source("run_analysis.R ")`, luego generará un nuevo archivo `tiny_data.txt` en su directorio de trabajo.

## Dependencias

El archivo `run_analysis.R` le ayudará a instalar las dependencias automáticamente. Depende de `reshape2` y ` data.table`.