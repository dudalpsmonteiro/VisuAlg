algoritmo "MonitoramentoServidores"
var
   idServidor, piorServidor, continuar: caractere
   qtdAmostras, i: inteiro
   tempoAmostra, somaTempos, mediaServidor, maiorMedia: real

inicio
   maiorMedia <- -1
   piorServidor <- ""

   repita
      escreva("Informe o identificador do servidor (ex: SRV-01): ")
      leia(idServidor)

      repita
         escreva("Informe a quantidade de amostras coletadas para ", idServidor, ": ")
         leia(qtdAmostras)
         se (qtdAmostras <= 0) entao
            escreval("Quantidade invalida! Informe pelo menos 1 amostra.")
         fimse
      ate (qtdAmostras > 0)

      somaTempos <- 0

      para i de 1 ate qtdAmostras faca
         escreva("Digite o tempo de resposta da amostra ", i, " (em ms): ")
         leia(tempoAmostra)
         somaTempos <- somaTempos + tempoAmostra
      fimpara

      mediaServidor <- somaTempos / qtdAmostras

      escreval("--------------------------------------------------")
      escreval("Servidor: ", idServidor)
      escreval("Quantidade de amostras lidas: ", qtdAmostras)
      escreval("Tempo medio de resposta: ", mediaServidor:0:2, " ms")
      escreval("--------------------------------------------------")

      se (mediaServidor > maiorMedia) entao
         maiorMedia <- mediaServidor
         piorServidor <- idServidor
      fimse

      escreva("Deseja registrar outro servidor? (S para Sim / N para Nao): ")
      leia(continuar)
      escreval("")

   ate (continuar = "N") ou (continuar = "n")

   escreval("==================================================")
   escreval("FECHAMENTO DIARIO - FILA DE MANUTENCAO")
   escreval("Servidor com pior desempenho: ", piorServidor)
   escreval("Maior tempo medio de resposta: ", maiorMedia:0:2, " ms")
   escreval("==================================================")
fimalgoritmo
