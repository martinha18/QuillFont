#let blue = rgb("365F91")
#let gray = rgb("808080")
#let light_gray = rgb("A6A6A6")

#let cover(title: "", authors: (), string_date) = {
  let render_authors = grid(columns: authors.len(),
                            column-gutter: 15pt,
                            ..authors.map(it => [
                              #text(size:12pt, weight: "bold", it.name) \
                              #text(size: 11pt, it.number)
                            ])
                           )
                           
  {
    set page(paper: "a4", margin: (x: 0cm, y:0cm))
    
    rect(fill: blue, height: 100%, width: 23.3%)
    
    place(bottom + left,dx: 10pt,dy:-40pt, {
      text(weight: "bold", size: 110pt, fill: white, [PI])
      text(weight: "bold", size: 110pt, fill: blue, [])
    })
  
    {
      set place(top+left, dx: 200pt)
      place(dy: 120pt, image( "imagens/EEUM_logo.png", height: 8%))
      place(dy: 200pt, {
        text(size: 10pt, weight: "bold", fill: gray, [Universidade do Minho\ ])
        text(size: 9pt, fill: gray, [Escola de Engenharia\ Mestrado em Engenharia Informática\ ])
        text(size: 9pt, fill: light_gray, [])
      })
      place(dy: 300pt, {
  
      // podes alterar o espaçamento entre paragrafos com `set par()` acho
        text(size: 20pt, fill: blue, weight: "bold", [Unidade Curricular de \ Engenharia Gramatical\ ])
        text(size: 10pt, [Ano Letivo de 2024/2025])
      })
      place(dy: 520pt, text(size: 18pt, weight: "bold", title))
      place(dy: 590pt, render_authors)
      
      place(dy: 640pt, text(size: 12pt, string_date))
    }
  }
}


// quando tiveres a fazer os autores mete usa a variavel, faz tambem o titulo e a data da mesma forma