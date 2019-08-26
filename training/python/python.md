---
title:
layout: contents
tag:
---

[en este document nos encargaremos de presentar la instalacion del software necesario para el curso]

# Instalaciones necesarias y sugeridas:

La unica instalacion necesaria para el taller de IAAPP es **Python**. Python es un lenguaje de programacion de propositos generales que es, junto a R, el programa dominante para ejercer la ciencia de datos. Python es un software abierto y se puede descargar gratuitamente desde la pagina de Internet de la [Python Software Foundation](https://www.python.org/downloads/).

Sin embargo, recomendamos la instalacion de [Anaconda](https://en.wikipedia.org/wiki/Anaconda_(Python_distribution)). Anaconda es una distribucion de Python y R (en otra palabras, una plataforma para acceder a software abierto) especializada en aplicaciones de ciencias de datos que facilita mucho la instalacion y uso de Python. Ademas de instalar Python, Anaconda instala la interfaces de usuario Spyder y Jupyter Notebook, que son los softwares principales a traves de los cuales se programa en Python. Anaconda tambien instala el gestionador de paqueterias **conda**. La **Anaconda Distribution** se puede descargar desde su [pagina oficial](https://www.anaconda.com/distribution/).

En algunas ocasiones, es necesario ejecutar ciertas funciones de Python desde la terminal de comandos. Esto es relativamente sencillo si se esta trabajando desde sistemas operativos basados en Unix, como Linux u OS, pero se complica un poco en Windows. Por ello, es importante tener en cuenta la posible necesidad de instalar [Cygwin], que es un software para emular la terminal de comandos del ambiente de Unix y que facilita considerablemente la gestion de funcionalidades de Python en Windows. De nuevo, este software no es fundamental, salvo ocasiones especiales, pero se puede descargar desde la [pagina de Cygwin](https://www.cygwin.com/)

# Python

Trabajaremos en Python principalmente desde su interfas Grafica Spyder. Pero antes, nos familiarizaremos con dos formas de trabajar en Python: terminal e IDLE Python.

python
anaconda/conda promts
cygwin
cmd

Instalar desde Anaconda prompt:
[mlxtend] describe

## Instalacion de Paquetes en python

[Otra de las ventajas de Anaconda es que descarga automaticamente los paquetes mas utilizados, pe numpy, matplot. De cualquier manera, esta es la lista de paquetes esenciales para la ciencia de datos]

| Paquete   | Descripcion  |
|---- | ---- |
| numpy | Numpy will help you to manage multi-dimensional arrays very efficiently.  |
| Pandas | Pandas is the library that will help us to handle two-dimensional data tables in Python |
| Matplotlib |  data visualization library is Matplotlib -The best and most well-knowns |
| Scikit-Learn | simply defines itself as “Machine Learning in Python.” |
| Scipy   |  XXX |


Otros paquetes (menos comunes) no vienen con la instalacion por default de Anaconda, por lo que es necesario utilizar el **anaconda prompt** para instalarlos. Por jemplo, **mlxtend** es un paquete para graficar las *Regiones de Decision*.


1. en el buscador de anaconda cloud "mlxtend". https://anaconda.org/
2. luego, ver el codigo para usar en anaconda prompt.
3. En este caso es:
```
To install this package with conda run one of the following:
conda install -c conda-forge mlxtend
```


### References

- [Raschka (2015) Python Machine Learning](https://www.packtpub.com/big-data-and-business-intelligence/python-machine-learning-second-edition)
- [VanderPlas (2016) Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/)
