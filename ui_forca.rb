  def da_boas_vindas
    puts "Bem vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n"
    puts "Começaremos o jogo para você, #{nome}."
  end

  def escolha_palavra_secreta
   puts "Escolhendo uma plavrava secreta..."
   palavra_secreta = "programador"
   puts "Palavra secreta com #{palavra_secreta} letras... boa sorte!"
   palavra_secreta
  end

  def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quer_jogar = quero_jogar.upcase == "N"
  end

  def pede_um_chute(chutes, erros)
    puts "\n\n"
    puts "Erros ate agora: #{erros}"
    puts "Chutes ate agora: #{chutes}"
    puts "Entre com uma letra ou uma palavra"
    chute = gets.strip
    puts "Será que você acertou? Você chutou #{chute}"
    chute
  end

  def avisa_chute_efetuado(chute)
    puts "Você já chutou #{chute}"
  end

  def avisa_letra_nao_encontrada
    puts "Letra não encontrada."
  end

  def avisa_letra_encontrada(total_encontrado)
    puts "Letra encontrada #{total_encontrado} vezes."
  end

  def avisa_acertou_a_palavra
    puts "Parabéns! Acertou"
  end

  def avisa_errou_a_palavra
    puts "Que pena... errou"
  end

  def avisa_pontos(pontos_ate_agora)
    puts "Você ganhou #{pontos_ate_agora} pontos."
  end
