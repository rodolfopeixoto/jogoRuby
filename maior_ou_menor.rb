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
    nome

  end

  def sorteia_numero_secreto(dificuldade)
    case dificuldade
      when 1
        maximo = 30
      when 2
        maximo = 60
      when 3
        maximo = 100
      when 4
        maximo = 150
      else
        maximo = 200
    end

    puts "Escolha um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1
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

  def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja? (1 - fácil, 5 - difícil)"
    dificuldade = gets.to_i
  end

  nome = da_boas_vindas
  dificuldade = pede_dificuldade
  numero_secreto = sorteia_numero_secreto dificuldade

  pontos_ate_agora = 1000

limite_de_tentativas = 5
chutes = []

for tentativa in 1..limite_de_tentativas
  chute          = pede_um_numero chutes, tentativa, limite_de_tentativas
  chutes << chute

  if nome == "Rodolfo"
    puts "Acertou!"
    break
  end

  pontos_a_perder  = (chute - numero_secreto).abs / 2.0
  pontos_ate_agora -= pontos_a_perder

  break if verifica_se_acertou numero_secreto, chute
end

puts "Você ganhou #{pontos_ate_agora} pontos."
# puts "\n #{numero_secreto}"