#import "conf.typ": capa_semFotos, report_conf
#import "docs/Ise.typ"
#import "docs/IIhep.typ"
#import "docs/IIIin.typ"
#import "docs/IVae.typ"
#import "docs/Vam.typ"
#import "docs/VIem.typ"
#import "docs/VIIpo.typ"
#import "docs/VIIIpf.typ"
#import "docs/IXgcn.typ"
#import "docs/Xaf.typ"

// Variaveis

#let unidadeCurricular = "Projeto Informático"
#let siglaCurso = "MEI"
#let anoCurso = "2"
#let semestreCurso = "1"

// Document Show configurations

// Legendas de tabelas por cima
#show figure.where(
  kind: table
): set figure.caption(position: top)


// Configuração do estilo do indice
#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}


// Geração da capa
#show: doc => capa_semFotos(
  unidadeCurricular : unidadeCurricular,
  titulo : "QuillFont",
  tipoDocumento : "Plano de Negócios",
  siglaCurso : siglaCurso,
  anoCurso : anoCurso,
  semestre : semestreCurso,
  autores : (
    /*("Nome do aluno", "Número do aluno"),*/
    ("Ana Margarida Marinho Lopes", "PG55921"),
    ("Bruno Alexandre Carvalho Silva", "PG55923"),
    ("Marta Sofia Matos Castela Queirós Gonçalves", "PG55983"),
    ("Rui Pedro Pádua Gonçalves", "PG56011"),
  ),
  data : false, // Mostrar data no documento
  doc,
)

// Geração das indices, header e footer
#show: doc => report_conf(
  table_of_contens : true,
  table_of_figures : true, // Lista de figuras
  table_of_tables : false, // Lista de tabelas
  header : false, // Cabeçalho com nome da UC
  unidadeCurricular : unidadeCurricular,
  siglaCurso : siglaCurso,
  anoCurso : anoCurso,
  semestreCurso : semestreCurso,
  doc,
)

// Capitulos do documento
#Ise
#pagebreak()
#IIhep
#pagebreak()
#IIIin
#pagebreak()
#IVae
#pagebreak()
#Vam
#pagebreak()
#VIem
#pagebreak()
#VIIpo
#pagebreak()
#VIIIpf
#pagebreak()
#IXgcn
#pagebreak()
#Xaf
#pagebreak()
#bibliography(title: "Referências", "references.bib")

