#import "@preview/icu-datetime:0.1.2": fmt-date

#let capa_semFotos(
  unidadeCurricular : "Unidade Curricular",
  titulo : "Titulo do documento",
  tipoDocumento : "Tipo do documento",
  grupoPratico : none,
  siglaCurso : "<sigla do Curso>",
  anoCurso : "<ano do curso>",
  semestre : "<semestre do curso>",
  autores : (),
  data : bool,
  doc
) = {

  set text(lang: "pt")
  align(center, [
    #v(10%)
    #image("imagens/EEUM_logo.png", width: 30%)
    #v(10%)
    #text(30pt, unidadeCurricular, weight: "medium")
    #v(1%)
    #text(20pt, titulo)
    #v(1%)
    #text(15pt, tipoDocumento)
    #v(0.5%)
    #if(grupoPratico != none) {
      text(12pt,  [Grupo *#grupoPratico*])
    }
    #line(length: 60%)
    #v(1%)
    #text(12pt, siglaCurso + " - " + anoCurso + "º Ano - " + semestre + "º Semestre")
  ])
  
  v(30pt)
  align(bottom + left, [
      #text("Trabalho realizado por:", weight: "semibold")
      #linebreak()
      #linebreak()
      #for autor in autores.sorted() {
        autor.at(1) + " - " + autor.at(0)
        linebreak()
      }
  ])


  v(30pt)
  
  if data == true {
    align(right, [
      #align(bottom + right, [Braga, #fmt-date(datetime.today(), locale: "pt", length: "long")])
    ])
    
  }
  pagebreak(weak: true)
  doc
}

#let report_conf(
  table_of_contens : true,
  table_of_figures : false,
  table_of_tables : false,
  header : false,
  unidadeCurricular : none,
  siglaCurso : none,
  anoCurso : none,
  semestreCurso : none,
  doc
) = {
  
  if table_of_contens == true {
    outline(title: "Índice")
    pagebreak()
  }

  if table_of_figures {
    outline(
      title: [Lista de Figuras],
      target: figure.where(kind: image)
    )
    pagebreak(weak: true)
  }

  if table_of_tables {
    outline(
      title: [Lista de Tabelas],
      target: figure.where(kind: table)
    )
    pagebreak(weak: true)
  }

  set page(
    header : [
      #grid(
        columns: (2fr, 1fr),
        align(left, [
          #text(11pt, fill: rgb(0, 0, 0, 70%),
          [*#unidadeCurricular*]
        )
          
        ]),
        align(right, [
          #text(11pt, fill: rgb(0,0,0,70%),  siglaCurso + " - " + anoCurso + "º ano, " + semestreCurso + "º Semestre")
          
        ])
        
      )
      #line(length: 100%, stroke: rgb(0, 0, 0, 70%))
    ],
    numbering: "1"
  )

  set heading(numbering: "1.")
  set par(
  first-line-indent: 1em,
  justify: true,
)
  doc
}

#let questao(
  numero : none,
  texto : none
) = {
  rect(stroke: 1pt,
    radius: 10%,
    fill: rgb(224, 224, 224, 50%),
    [
        #text(size: 13pt, [
          *Questão #numero*
        ])
        #linebreak()
        *#texto*
    ])
  
}

#let alinea(
  numero : none,
  texto : none
) = {
  rect(stroke: 1pt,
    radius: 10%,
      fill: rgb(224, 224, 224, 50%),
  [
    #text(size: 12pt, [
      *Alínea #numero)*
    ])
      #linebreak()
      *#texto*
  ])

}