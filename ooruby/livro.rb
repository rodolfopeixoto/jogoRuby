class Livro
  attr_reader :titulo, :preco, :ano_lancamento

  def initialize(titulo, preco, ano_lancamento)
    @titulo         = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)

  end

  def calcula_preco(base)
    base *= 0.7 if ano_lancamento < 2000
  end

end

  def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
      puts "Newsletter/Liquidacao"
      puts livro.titulo
      puts livro.preco
    end
  end

  algoritmos = Livro.new("Algoritmos", 100, 1998)
  livro_para_newsletter(algoritmos)