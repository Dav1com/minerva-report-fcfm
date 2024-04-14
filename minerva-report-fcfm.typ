/** minerva-article.typ
 *
 * Este archivo contiene la estructura y estilos usados por el template.
 * Para definir tus propios comandos agregalos a preamble.typ.
 *
 **/

/**
 * Funciones base
 *
 * La idea es que si necesitas extender o personalizar el template y
 * sobrescribir el header, crear una portada, etc. Deberías extender
 * su respectivo base. La razón de esto es que ciertas funcionalidades
 * del template requieren estado. Además estos base settean estilos
 * que ayudan a que haya coherencia visual.
 **/

/// Función base para cualquier header.
/// Si se crea un header personalizado es importante extenderlo desde esta función!
/// Si no algunas funciones del template podrían romperse.
///
/// Por ejemplo:
/// ```typ
/// #import "@preview/miverva-report.typ": base-header
/// #let mi-header = base-header[
///   #set text(font: "Comic Neue", stroke: color.map.rainbow)
///   #stack(dir: ltr, [Hooolaaa], 1fr, [], [counter(page).display()])
///   #v(8pt)
///   #line(100%)
/// ]
/// ```
///
/// - it (content): Definición del header.
/// -> content
#let base-header(it) = {
  metadata((marker: "PAGE-START"))
  set block(spacing: 0pt, clip: false)
  set par(leading: 0.4em)
  it
}

#let base-footer(it) = {
  set block(spacing: 0pt, clip: false)
  set par(leading: 0.4em)
  it
  metadata((marker: "PAGE-END"))
}

/** Localización
 *
 * Las siguientes son funciones de utilidad general para mejor
 * soporte del español.
 **/
/// Arreglo con los nombres de meses en español.
#let meses = ("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")

/// Aplica el formato "[day] de [month repr: long] del [year]" en español
/// 
/// fecha (datetime): fecha a dar formato.
/// -> str
#let formato-fecha(fecha) = {
  return str(fecha.day()) + " de " + meses.at(fecha.month()) + " del " + str(fecha.year())
}

/// Show rule que cambia el formato de los número para usar coma decimal.
///
/// doc (content): documento a aplicar reglas
/// -> content
#let formato-numeros(doc) = {
  // https://github.com/typst/typst/issues/1093#issuecomment-1536620129
  show regex("\d+.\d+"): it => {
    if it.func() == heading {
      show ".": ","
    }
    it
  }
  
  show math.equation: it => {
    show regex("\d+.\d+"): it => {
      show ".": {","+h(0pt)}
      it
    }
    it
  }
  
  doc
}

/** Elements
 *
 * Estas funciones generan elementos para usarse como parte del documento.
 */
/// Repite un contenido `count` veces con `padding` entre ellos.
/// Si `count` es `auto`, se utiliza tanto espacio como haya disponible.
/// - body    (content, str, int): Contenido a repetir.
/// - padding (length)           : Espaciado entre repeticiones.
/// - count   (int, auto)        : Cantidad de repeticiones.
/// -> content
#let rep(padding: 0pt, count: auto, body) = context {
  if count != auto {
    stack(dir: ltr, spacing: padding, ..range(count + 1).map(_ => body))
  } else {
    layout(size => context {
      let width = measure(body).width
      let real-count = calc.quo((size.width - width).pt(), (width + padding).pt())
      stack(dir: ltr, spacing: padding, ..range(count-real + 1).map(_ => body))
    })
  }
}

/** Portadas
 * 
 * 
 **/ 
#let portada1(
  
) = {
  
}
