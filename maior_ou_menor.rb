puts "########################################################"
puts "\tSeja-bem vindo ao jogo da advinhação"
puts "########################################################"
puts "\n\n"

puts "Qual é o seu nome?"
nome = gets
puts "\n\n"

puts "---------------------------------------------"
puts "Começaremos o jogo para você, " + nome
puts "---------------------------------------------"
puts "\n"

puts "Escolha um número secreto entre 0 e 200..."
numero_secreto = 175
puts "Escolhido... que tal advinha hoje o número secreto?"

limite_de_tentativas = 5

for tentativa in 1..limite_de_tentativas
        puts "\n\n"
        puts "Tentativa " + tentativa.to_s + " de " + limite_de_tentativas.to_s
        puts "Entre com o número"
        chute = gets
        puts "Será que acertou? Você chutou \n" + chute

        acertou = numero_secreto == chute.to_i

        if acertou
            puts "**************************************"
            puts "Acertou!"
            puts "**************************************"
            puts "\n"
            break
        else

            maior = numero_secreto > chute.to_i

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
        end
end