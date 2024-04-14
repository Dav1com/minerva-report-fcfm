#import "base.typ": *
#import "informe.typ": *

#let departamentos = (
  adh: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Área de Humanidades"
    ),
    logo: read("logos/adh.svg")
  ),
  das: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Astronomía"
    ),
    logo: read("logos/das.svg")
  ),
  dcc: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Ciencias de la Computación"
    ),
    logo: read("logos/dcc.svg")
  ),
  dfi: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Física"
    ),
    logo: read("logos/dfi.svg")
  ),
  dgf: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Geofísica"
    ),
    logo: read("logos/dgf.svg")
  ),
  dic: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Ingeniería Civil"
    ),
    logo: read("logos/dic.svg")
  ),
  die: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Ingeniería Eléctrica"
    ),
    logo: read("logos/die.svg")
  ),
  dii: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Ingeniería Industrial"
    ),
    logo: read("logos/dii.svg")
  ),
  dim: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Ingeniería Matemática"
    ),
    logo: "dim.svg"
  ),
  dimec: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Ingeniería Mecánica"
    ),
    logo: "dimec.svg"
  ),
  dimin: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Ingeniería de Minas"
    ),
    logo: read("logos/dimin.svg")
  ),
  diqbm: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Departamento de Ingeniería Química, Biotecnología y Materiales"
    ),
    logo: read("logos/diqbm.svg")
  ),
  geo: (
    nombre: (
      "Universidad de Chile",
      "Facultad de Ciencias Físicas y Matemáticas",
      "Deparamento de Geología"
    ),
    logo: read("logos/geo.svg")
  )
)

#let informe(
  titulo: none,
  subtitulo: none,
  tema: none,
  departamento: departamentos.dcc,
  autores: (), // string o arreglo de strings
  equipo-docente: (:), // `dict` de content/arreglo de strings
  curso: "",
  fechas: (:),
  lugar: [],
  fuente: "",
  portada: portada1,
  header: header1,
  margenes-portada: (top: 3.5cm),
  margenes: (top: 3.5cm),
  showrules: true,
  doc
) = {
  assert(type(titulo) in (none, str, content), message: "titulo debe ser none, un string o content.")
  assert(type(subtitulo) in (none, str, content), message: "subtitulo debe ser none, un string o content.")
  assert(type(tema) in (none, str, content), message: "tema debe ser none, un string o content.")
  
  assert(type(departamento) == dictionary, message: "departamento debe ser un dictionary.")
  assert(type(departamento.nombre) == array, message: "departamento.nombre debe ser un arreglo.")
  for nombre in departamento.nombre {
    assert(type(nombre) in (str, content), message: "departamento.nombre debe ser un arreglo de string.")
  }
  assert(type(departamento.logo) in (none, str, bytes), message: "departamento.logo debe ser none, un string o bytes.")

  assert(type(autores) in (str, array), message: "autores debe ser un string o un arreglo de strings.")
  if type(autores) == str {
    autores = (autores)
  }
  for autor in autores {
    assert(type(autor) == str, message: "autores debe ser un string o un arreglo de strings.")
  }

  
  
  
  
  let miembros = (:)
  if type(autores) == "string" {
    miembros.insert("Integrante", autores)
  } else if autores.len() > 0 {
    miembros.insert(
      if autores.len() == 1 {
        "Integrante"
      } else {
        "Integrantes"
      },
      autores
    )
  }
  miembros = miembros + equipo-docente

  let portada-set-extra = (:)
  if margenes-portada != (:) {
    portada-set-extra.insert("margin", margenes-portada)
  }

  set heading(numbering: "1.")
  set par(leading: 0.5em, justify: true, linebreaks: "optimized")
  set text(lang: "es", region: "cl", hyphenate: true)
  
  set page(header: header1, footer: footer1(titulo, curso, base-footer), margin: margenes)
  
  if portada != none {
    set page(header: [], footer: [], ..portada-set-extra)
    portada(titulo: titulo, subtitulo: subtitulo, tema: tema, organizacion: departamento, miembros: miembros, fechas: fechas, lugar: lugar, base-header: base-header, base-footer: base-footer)
  }

  set page(numbering: "1")

  if showrules {
    import "show-rules.typ": *
    show: nueva-pagina-primer-heading
    show: numero-pagina-romano-hasta-primer-heading
    
    doc
  }
}
