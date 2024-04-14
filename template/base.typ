#let base-header(it) = {
  metadata((marker: "PAGE-START"))
  set block(spacing: 0pt, clip: false)
  set par(leading: 0.4em)
  it
}

#let base-footer(it) = {
  set block(spacing: 0pt, clip: false)
  set par(leading: 0.4em)
  line(length: 100%, stroke: 0.4pt)
  v(8pt)
  it
  metadata((marker: "PAGE-END"))
}

#let base-table-of-contents(body) = [
  #body
]

#let base-front-page(page-args, body) = {
  page(header: none, footer: none, ..page-args)[
    #body
    #counter(page).update(0)
  ]
}

#let base-indice(type, body) = {
  set text(weight: "regular")
  if type == "page" {
    set align(right)
    body
  } else {
    body
  } 
}
