#let nueva-pagina-primer-heading(doc) = {
  show heading: it => context {
    if counter(heading).get() == (1,) {
      pagebreak(weak: true)
      it
    } else {
      it
    }
  }
  doc
}

#let numero-pagina-romano-hasta-primer-heading(doc) = {
  show page: it => {
    context {
      let next-headings = query(heading)
      let curr-page = here().page()
      let next-heading = none
      for head in next-headings {
        if head.numbering != none {
          if head.location().page() == curr-page + 1 {
            next-heading = head
          }
          break
        }
      }
      if next-heading != none {
        set page(numbering: "1")
        counter(page).update(0)
      }
    }
    it
  }
  
  set page(numbering: "i")
  
  doc
}
