#import "@preview/minerva-report-fcfm:0.1.0" as minerva

#show: minerva.report.with(
  showrules: true,
)

#minerva.abstract[
  a
]

#outline()

= Escribiendo simples parrafos
Typst toma bastante de Markdown y secuencias de carácteres especiales puedes dar
estilo al texto, por ejemplo, puedes usar negrite *abc*, itálica _oooo_ y monoespaciado `typst watch main.typ`.

Un parrafo nuevo se hace simplemente con 2 saltos de línea.

== El símbolo igual `=` se usa para crear un heading
Como en LaTeX
