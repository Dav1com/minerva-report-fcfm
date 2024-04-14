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
    entrega: datetime.today().display("[day] de [weekday ]")
  ),
  lugar: "Santiago, Chile",
  portada: portada1, // distintos diseños diposibles (WIP)
  showrules: true, // dejar en true para "llegar y usar". Personalizar más pronfundamente requiere desactivarlo.
)

#resumen[
  #lorem(100)
]

#let mi-header = base-header[
  #set text(font: "Comic Neue", stroke: gradient.linear(..color.map.rainbow))
  #stack(dir: ltr, [Hooolaaa], 1fr, [], [counter(page).display()])
  #v(8pt)
  #line(length: 100%)
]

#set page(header: none)

#indice-de-contenidos()


= Informes con Typst
#datetime.today().display() Parecido a lenguajes como Markdown, puedes escribir para obtener un parrafo, además puedes estilar el texto en *negrita* y _cursiva_.

Con una línea en blanco entre medio comenzamos otro parrafo,

== sub tema
asdaa 

== otro sub tema

= otro heading
#lorem(1000)

= otro heading
#lorem(1000)

= otro heading
#lorem(1000)

= otro heading
#lorem(1000)

= otro heading
#lorem(1000)

= otro heading
#lorem(1000)

= otro heading
#lorem(1000)

= otro heading
#lorem(1000)

= otro heading
#lorem(1000)

= otro heading
#lorem(1000)

#set heading(numbering: none)
= Heading sin numbering
