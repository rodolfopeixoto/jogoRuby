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

  def initialize
    @livros = []
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



  algoritmos = Livro.new("Algoritmos", 100, 1998,true)
  estoque = Estoque.new
  estoque.adiciona(algoritmos)
  baratos = estoque.mais_barato_que(80)
  estoque.adiciona  Livro.new("The Pragmatic Programmer", 100, 1999, true)
  estoque.adiciona  Livro.new("Programming Ruby", 100, 2004, true)
  estoque.exporta_csv