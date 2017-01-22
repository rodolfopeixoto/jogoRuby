puts "Bem vindo ao jogo da advinhação"
puts "Qual é o seu nome?"
nome = gets
puts "\n\n\n\n"
puts "Começaremos o jogo para você, " + nome

puts "Escolhendo um número secreto entre 0 e 200..."
numero_secreto = 175
puts "Escolhido... que tal advinha hoje o número secreto?"


puts "\n\n\n\n"
puts "Tentativa 1"
puts "Entre com o número"
chute = gets
puts "Será que acertou? Você chutou \n" + chute
puts chute.to_i == numero_secreto