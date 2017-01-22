  def da_boas_vindas
    puts "########################################################"

    puts "\tSeja-bem vindo ao jogo da advinhação"

    puts "########################################################"

    puts "\n\n"

    puts "Qual é o seu nome?"
    nome = gets.strip

    puts "\n\n"

    puts "---------------------------------------------"
    puts "Começaremos o jogo para você, #{nome} "
    puts "---------------------------------------------"
    puts "\n"

  end

  def sorteia_numero_secreto
    puts "Escolha um número secreto entre 0 e 200..."
    sorteado = 175
    puts "Escolhido... que tal advinha hoje o número secreto?"
    sorteado
  end

  def pede_um_numero(chutes,tentativa, limite_de_tentativas)
    puts "\n\n"
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    puts "Chutes até agora: #{chutes} "
    puts "Entre com o número"
    chute = gets.strip
    puts "Será que acertou? Você chutou \n #{chute}"
    chute.to_i
  end

  def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute
    if acertou
      puts "**************************************"
      puts "Acertou!"
      puts "**************************************"
      puts "\n"
      return true
    end

    maior = numero_secreto > chute
      if maior
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts "O número secreto é maior!"
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
        puts "\n"
      else
        puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
        puts "O número secreto é menor!"
        puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
        puts "\n"
      end
      false
  end

  da_boas_vindas
  numero_secreto = sorteia_numero_secreto

  pontos_ate_agora = 1000

limite_de_tentativas = 5
chutes = []

for tentativa in 1..limite_de_tentativas
  chute          = pede_um_numero chutes, tentativa, limite_de_tentativas
  chutes << chute

  pontos_a_perder  = (chute - numero_secreto) / 2
  pontos_ate_agora -= pontos_a_perder

  break if verifica_se_acertou numero_secreto, chute
end

puts "Você ganhou #{pontos_ate_agora} pontos."