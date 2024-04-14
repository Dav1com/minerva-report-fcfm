#import "template/conf.typ": *
#import "template/informe.typ": *

#show: informe.with(
  titulo: "Informe 1",
  subtitulo: "Typst",
  tema: "Aprendiendo a usar el template",
  departamento: departamentos.dcc,
  autores: ("Integrante1", "Integrante2", "Integrante3"), // content o arreglo de strings
  equipo-docente: ( // diccionario con distintos valores soportados:
    Profesores: ("Profesor1", "Profesor2"), // arreglo de strings
    Auxiliar: "ÚnicoAuxiliar", // un único miembro como string
    Ayudante: [ // bloque de contenido
      Ayudante1 \
      Ayudante $1+1$
    ],
  ),
  curso: "CC4034 - Composición de Documentos",
  fechas: ( // diccionario de fechas, si la portada no soporta
    realización: "1 de Junio de 2023",
    entrega: "Aún en progreso"
  ),
  lugar: "Santiago, Chile",
  portada: portada1, // distintos diseños diposibles (WIP)
)
