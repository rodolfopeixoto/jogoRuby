module Contador
  def << (livro)
    push (livro)
    if @maximo_necessario.nil? || @maximo_necessario < size
      @maximo_necessario = size
    end
    self
  end

  def maximo_necessario
    @maximo_necessario
  end
end

class Livro
  attr_reader :titulo, :preco, :ano_lancamento

  def initialize(titulo, preco, ano_lancamento,possui_reimpressao)
    @titulo         = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @possui_reimpressao = possui_reimpressao

  end

  def calcula_preco(base)
    if @ano_lancamento < 2006
      if @possui_reimpressao
        base * 0.9
      else
        base * 0.95
      end
    elsif @ano_lancamento <= 2010
      base * 0.96
    else
      base
    end
  end


   def possui_reimpressao?
         @possui_reimpressao
     end

  def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
      puts "Newsletter/Liquidacao"
      puts livro.titulo
      puts livro.preco
    end
  end

  def to_csv
    "#{@titulo}, #{ano_lancamento}, #{@preco}"
  end


end

class Estoque

  attr_accessor :livros

  def initialize
    @livros = []
    @livros.extend Contador
  end

  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end

  def mais_barato_que(valor)
    @livros.select do |livro|
      livro.preco <= valor
    end
  end

  def total
    @livros.size
  end

  def adiciona(livro)
    @livros << livro if livro
  end
end


  algoritmos   =  Livro.new("Algoritmos", 100, 1998,true)
  arquitetura  =  Livro.new("Introdução a Arquitetura e Design de Software", 100, 1998, true)
  programmer   =  Livro.new("The Pragmatic Programmer", 100, 1999, true)
  ruby         =  Livro.new("Programming Ruby", 100, 2004, true)

  estoque = Estoque.new
  estoque.livros << algoritmos
  estoque.livros << arquitetura
  estoque..livros << programmer << ruby
  puts estoque.livros_maximo_necessario