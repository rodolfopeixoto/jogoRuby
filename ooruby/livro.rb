class Livro
  attr_reader :titulo, :preco, :ano_lancamento, :editora, :tipo

  def initialize(titulo, preco, ano_lancamento,possui_reimpressao, editora, tipo, possui_sobrecapa, numero)
    @titulo             = titulo
    @ano_lancamento     = ano_lancamento
    @preco              = calcula_preco(preco)
    @possui_reimpressao = possui_reimpressao
    @editora            = editora
    @tipo               = tipo
    @possui_sobrecapa   = possui_sobrecapa
    @numero             = numero

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