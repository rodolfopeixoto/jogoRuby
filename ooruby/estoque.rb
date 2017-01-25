require_relative 'contador'

class Estoque

  attr_accessor :livros

  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end

  def quantidade_de_vendas_de_titulo(produto, &campo)
   @vendas.count { |venda| campo.call(venda) == campo.call(produto) }
  end

  def livro_que_mais_vendeu_por_titulo
    livro_que_mais_vendeu_por(&:titulo)
  end

  def livro_que_mais_vendeu_por_ano
   livro_que_mais_vendeu_por(&:ano_lancamento)
  end

  def livro_que_mais_vendeu_por_editora
    livro_que_mais_vendeu_por(&:editora)
  end

  def livro_que_mais_vendeu_por(&campo)
    @vendas.sort { |v1,v2|
      quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)
    }
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

  def << (livro)
    @livros << livro if livro
    self
  end

  def vende(livro)
   @livros.delete livro
   @vendas << livro
  end

  def maximo_necessario
    @livros.maximo_necessario
  end
end