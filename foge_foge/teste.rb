# #Não pode
# def bemvindo(nome)
#     puts "Bem vindo #{nome}"
# end
#lambda
bemvindo = -> (nome){
    puts "Bem vindo #{nome}"
}

minhafuncao = bemvindo
minhafuncao.call("Rodolfo")