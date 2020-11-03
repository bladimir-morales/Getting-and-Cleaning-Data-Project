# CodeBook

Este es un libro de códigos que describe las variables, los datos y cualquier transformación o trabajo que realizó para limpiar los datos.

## La fuente de datos

* Datos originales: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Descripción original del conjunto de datos: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Información del conjunto de datos

Los experimentos se han realizado con un grupo de 30 voluntarios dentro de un grupo de edad de 19 a 48 años. Cada persona realizó seis actividades (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) con un teléfono inteligente (Samsung Galaxy S II) en la cintura. Utilizando su acelerómetro y giroscopio integrados, capturamos la aceleración lineal 3-axial y la velocidad angular 3-axial a una tasa constante de 50Hz. Los experimentos se han grabado en video para etiquetar los datos manualmente. El conjunto de datos obtenido se ha dividido aleatoriamente en dos conjuntos, donde se seleccionó al 70% de los voluntarios para generar los datos de entrenamiento y al 30% los datos de la prueba.

Las señales del sensor (acelerómetro y giroscopio) se preprocesaron aplicando filtros de ruido y luego se muestrearon en ventanas deslizantes de ancho fijo de 2,56 segundos y 50% de superposición (128 lecturas / ventana). La señal de aceleración del sensor, que tiene componentes gravitacionales y de movimiento corporal, se separó mediante un filtro de paso bajo Butterworth en aceleración corporal y gravedad. Se supone que la fuerza gravitacional tiene solo componentes de baja frecuencia, por lo que se utilizó un filtro con una frecuencia de corte de 0.3 Hz. De cada ventana, se obtuvo un vector de características mediante el cálculo de variables del dominio del tiempo y la frecuencia.

## Los datos

El conjunto de datos incluye los siguientes archivos:

- 'README.txt'

- 'features_info.txt': muestra información sobre las variables utilizadas en el vector de características.

- 'features.txt': Lista de todas las funciones.

- 'activity_labels.txt': vincula las etiquetas de la clase con su nombre de actividad.

- 'train / X_train.txt': Conjunto de entrenamiento.

- 'train / y_train.txt': etiquetas de entrenamiento.

- 'test / X_test.txt': Conjunto de prueba.

- 'test / y_test.txt': Etiquetas de prueba.

Los siguientes archivos están disponibles para el tren y los datos de prueba. Sus descripciones son equivalentes.

- 'train / subject_train.txt': Cada fila identifica al sujeto que realizó la actividad para cada muestra de ventana. Su rango es de 1 a 30.

- 'train / Inertial Signals / total_acc_x_train.txt': la señal de aceleración del eje X del acelerómetro del teléfono inteligente en unidades de gravedad estándar 'g'. Cada fila muestra un vector de 128 elementos. La misma descripción se aplica a los archivos 'total_acc_x_train.txt' y 'total_acc_z_train.txt' para los ejes Y y Z.

- 'train / Inertial Signals / body_acc_x_train.txt': La señal de aceleración del cuerpo obtenida restando la gravedad de la aceleración total.

- 'train / Inertial Signals / body_gyro_x_train.txt': El vector de velocidad angular medido por el giroscopio para cada muestra de ventana. Las unidades son radianes / segundo.


## Detalles de transformación

Hay 5 partes:

1. Fusiona los conjuntos de entrenamiento y prueba para crear un conjunto de datos.
2. Extrae solo las medidas de la media y la desviación estándar de cada medida.
3. Utiliza nombres de actividades descriptivos para nombrar las actividades en el conjunto de datos.
4. Etiquete adecuadamente el conjunto de datos con nombres de actividades descriptivos.
5. Crea un segundo conjunto de datos ordenado e independiente con el promedio de cada variable para cada actividad y cada tema.

## Cómo  `run_analysis.R` implementa los pasos anteriores:

* Requiere librerias  `reshapre2` y `data.table`.
* Cargar datos de prueba y de tren
* Cargue las características y etiquetas de actividades.
* Extraiga los nombres y datos de las columnas de desviación estándar y media.
* Procesar los datos. Hay dos pruebas de procesamiento de piezas y datos de tren, respectivamente.
* Combinar conjunto de datos.