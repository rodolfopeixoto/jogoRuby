require_relative 'livro'
require_relative 'estoque'




  algoritmos            =  Livro.new("Algoritmos", 100, 1998,true, "", "livro")
  arquitetura           =  Livro.new("Introdução a Arquitetura e Design de Software", 100, 1998, true, "", "livro")
  programmer            =  Livro.new("The Pragmatic Programmer", 100, 1999, true, "", "livro")
  ruby                  =  Livro.new("Programming Ruby", 100, 2004, true, "", "livro")
  revistona             = Livro.new("Revista de Ruby", 10, 2012, true, "Revistas", "revista")
  online_arquitetura    = Livro.new("Introdução a Arquitetura e Design de Software", 50, 2012, true, "", "ebook")

  estoque = Estoque.new
  estoque << algoritmos << ruby << programmer << arquitetura << ruby << ruby << revistona << revistona << online_arquitetura
  estoque.vende ruby
  estoque.vende ruby
  estoque.vende ruby
  estoque.vende algoritmos
  estoque.vende algoritmos
  estoque.vende revistona
  estoque.vende online_arquitetura
puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
puts estoque.ebook_que_mais_vendeu_por_titulo.titulo