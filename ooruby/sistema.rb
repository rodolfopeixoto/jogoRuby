require_relative 'livro'
require_relative 'estoque'




  algoritmos   =  Livro.new("Algoritmos", 100, 1998,true, "")
  arquitetura  =  Livro.new("Introdução a Arquitetura e Design de Software", 100, 1998, true, "")
  programmer   =  Livro.new("The Pragmatic Programmer", 100, 1999, true, "")
  ruby         =  Livro.new("Programming Ruby", 100, 2004, true, "")

  estoque = Estoque.new
  estoque << algoritmos << ruby << programmer << arquitetura << ruby << ruby
  estoque.vende ruby
  estoque.vende ruby
  estoque.vende ruby
  estoque.vende algoritmos
  estoque.vende algoritmos
  puts estoque.livro_que_mais_vendeu_por_titulo.titulo