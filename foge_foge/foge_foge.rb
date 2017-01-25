require_relative 'ui'

  def le_mapa(numero)
    arquivo = "mapa#{numero}.txt"
    texto = File.read arquivo
    mapa = texto.split("\n")
  end

def encontra_jogador(mapa)
    caracter_do_heroi = "H"
    mapa.each_with_index do |linha_atual, linha|
        coluna_do_heroi = linha_atual.index caracter_do_heroi
        if coluna_do_heroi
            return [linha, coluna_do_heroi]
        end
    end
    # não achei!
end

def calcula_nova_posicao(heroi, direcao)
    heroi = heroi.dup
    movimentos = {
        "W" => [-1, 0],
        "S" => [+1, 0],
        "A" => [0, -1],
        "D" => [0, +1]
        }
    movimento = movimentos[direcao]
    heroi[0] += movimento[0]
    heroi[1] += movimento[1]
    heroi
end

def posicao_valida?(mapa, posicao)
    linhas = mapa.size
    colunas = mapa[0].size

    estourou_linha = posicao[0] < 0 || posicao[0] >= linhas
    estourou_coluna = posicao[1] < 0 || posicao[1] >= colunas

    if estourou_linha || estourou_coluna
        return false
    end
    valor_atual = mapa[posicao[0]][posicao[1]]
    if valor_atual == "X" || valor_atual == "F"
        return false
    end

    true
end

def posicoes_validas_a_partir(mapa, posicao)
  posicoes  = []
  baixo     = [posicao[0] + 1, posicao[1]]
  if posicao_valida? mapa, baixo
    posicoes << baixo
  end
  cima      = [posicao[0], posicao[1] + 1]
  if posicao_valida? mapa, cima
    posicoes << cima
  end
  direita   = [posicao[0], posicao[1] + 1]]
  if posicao_valida? mapa, direita
    posicoes << direita
  end
  esquerda  = [posicao[0], posicao[1] - 1]
  if posicao_valida? mapa, esquerda
    posicoes << esquerda
  end
  posicoes
end

  def copia_mapa(mapa)
    novo_mapa = []
    mapa.each do |linha|
      nova_linha = linha.dup.tr "F", " "
      novo_mapa << nova_linha
    end
    novo_mapa
  end

def move_fantasma(mapa,linha,coluna)
  posicoes = posicoes_validas_a_partir mapa, [linha,coluna]

  return if posicoes.empty?

  posicao = posicoes[0]
  if posicao_valida? mapa, posicao
    mapa[linha][coluna] = " "
    mapa[posicao[0]][posicao[1]] = "F"
  end

end

def move_fantasmas(mapa)
  caractere_do_fantasma = "F"
  mapa.each_with_index do | linha_atual, linha |
    linha_atual.chars.each_with_index do |caracteres_atual, coluna|
      eh_fantasma = caracteres_atual == caractere_do_fantasma
      if eh_fantasma
        move_fantasma mapa, linha, coluna
      end
    end
  end
end



def joga(nome)
    mapa = le_mapa(2)
    while true
        desenha mapa
        direcao = pede_movimento #W

        heroi = encontra_jogador mapa
        nova_posicao = calcula_nova_posicao heroi, direcao
        if !posicao_valida? mapa, nova_posicao
            next
        end

        mapa[heroi[0]][heroi[1]] = " "
        mapa[nova_posicao[0]][nova_posicao[1]] = "H"

        move_fantasmas mapa
    end
end

  def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
  end