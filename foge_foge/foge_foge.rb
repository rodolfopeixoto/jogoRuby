require_relative 'ui'

  def le_mapa(numero)
    texto = File.read("mapa#{numero}.txt")
    mapa = texto.split("\n")
  end

  def joga(nome)
    #nosso jogo
  end

  def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
  end