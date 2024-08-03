programa {
  inclua biblioteca Util --> u

  /*
   * IDEIAS:
   * 
   
   * Fazer um dado de 6 lados para escolher o jogador que começará jogando.
   */

  funcao inicio() {
    inteiro
      opcaoMenu = 0

    caracter
      botaoPausar,
      botaoJogarNovamente,
      respostaDesafio

    inteiro
      dado = 0,
      posicaoJogador1 = 0,
      posicaoJogador2 = 0,
      pontuacaoJogador1 = 0,
      pontuacaoJogador2 = 0,
      jogadorAtual = 1, // Variável que salva a vez do jogador (jogadorAtual: 1 ou 2).
      impedirJogador = 0, // Variável para impedir o jogador de jogar a próxima rodada.
      posicaoAuxiliar = 0, // Variável auxiliar para trocar as posições dos jogadores na funcionalidade da casa Nº 10.
      contagem = 3 // Variável para o temporizador que antece o jogo
         

    enquanto (opcaoMenu != 3) {
      limpa()

      escreva("1. Jogar\n")
      escreva("2. Verificar Placar\n")
      escreva("3. Fechar o Jogo\n")

      escreva("R: ")
      leia(opcaoMenu)

      limpa()

      escolha (opcaoMenu) {
        caso 1: {
          /**
           * 1. Jogar
           */

      enquanto(contagem != 0){
			  escreva("Disputa iniciando em: ", contagem, "...")
			  u.aguarde(1000)
			  contagem--
			  limpa()
		    }

          faca {
            // Começar o jogo sempre com as variáveis nos valores padrões
            posicaoJogador1 = 0
            posicaoJogador2 = 0
            jogadorAtual = 1
            impedirJogador = 0

            enquanto (posicaoJogador1 < 20 e posicaoJogador2 < 20) {
              limpa()
            
              dado = u.sorteia(1, 6) //Sorteio do numero da casa a ser ocupada pelo jogADOR

              se (jogadorAtual == 1) {
                posicaoJogador1 = posicaoJogador1 + dado

                se (posicaoJogador1 > 20) {
                  posicaoJogador1 = 20
                }

                escreva("JOGADOR: ", jogadorAtual, "\n")
                escreva("DADO: ", dado, "\n")
                escreva("POSICAO ATUAL: ", posicaoJogador1, "/20 \n\n")

                /**
                 * Funcionalidades
                 */
                se (posicaoJogador1 == 2) {
                  posicaoJogador1 = 5
                  escreva("[CASA 2] O jogador 1 saltou para casa 5.\n\n")
                }
                senao se (posicaoJogador1 == 3) {
                  // Sortear mais 3 casas
                  posicaoJogador1 = posicaoJogador1 + u.sorteia(1, 3)
                  escreva("[CASA 3] O jogador 1 sorteou um dado de 3 lados para se mover.\n\n")
                }
                senao se (posicaoJogador1 == 7) {
                  // Impedir o jogador na próxima rodada
                  impedirJogador = 1
                  escreva("[CASA 7] O jogador 1 foi impedido de jogar a próxima rodada.\n\n")
                }
                senao se (posicaoJogador1 == 10) {
                  // Trocar as posições
                  posicaoAuxiliar = posicaoJogador1
                  posicaoJogador1 = posicaoJogador2
                  posicaoJogador2 = posicaoAuxiliar
                  escreva("[CASA 10] O jogador 1 teve sua casa trocada pelo jogador 1.\n\n")
                }
                senao se (posicaoJogador1 == 12) {
                  // Retroceder 1 casa
                  posicaoJogador1 = posicaoJogador1 - 1
                  escreva("[CASA 12] O jogador 1 retrocedeu uma casa.\n\n")
                }
                senao se (posicaoJogador1 == 15) {
                  faca{
                 	escreva("Você terá de cantar uma canção ou sofrerá as consequências do composto V. \n\n")
                 	escreva("Aceita o desafio ou irá sucumbir? [S/N]")
                 	leia(respostaDesafio)
                 	limpa()
                 }enquanto(respostaDesafio != 'S' e respostaDesafio != 'N') //enquanto a  resposta for diferente de S e N a pergunta repete até que a condição seja atendida 

                 se(respostaDesafio == 'S' ou respostaDesafio == 's'){ //verifica se a resposta é sim
                 	escreva("Você provou que não é só mais um super... \n")
                 	escreva("Continue jogando... \n ")
                 }
                 senao{ // se a resposta não é s e nem um caractere diferente de S ou N, então a resposta foi N  
                 	escreva("Você é só mais um covarde... \n")
                 	escreva("Terá de voltar duas casas por ter me desafiado! \n")
                 	posicaoJogador1 = posicaoJogador1 - 2 //punição ao jogador -  voltar duas casas
                 }
                }
                senao se (posicaoJogador1 == 19) {
                  // Voltar o jogador para casa (1)
                  posicaoJogador1 = 1
                  escreva("[CASA 19] O jogador 1 voltou para o começo do jogo.\n\n")
                }

                // Alternar
                se (impedirJogador == 0) {
                  jogadorAtual = 2
                }
                senao {
                  impedirJogador = 0
                }
              } senao {
                posicaoJogador2 = posicaoJogador2 + dado

                se (posicaoJogador2 > 20) {
                  posicaoJogador2 = 20
                }

                escreva("JOGADOR: ", jogadorAtual, "\n")
                escreva("DADO: ", dado, "\n")
                escreva("POSICAO ATUAL: ", posicaoJogador2, "/20 \n\n")

                /**
                 * Funcionalidades
                 */
                se (posicaoJogador2 == 2) {
                  // Mover o jogador para casa (5)
                  posicaoJogador2 = 5
                  escreva("[CASA 2] O jogador 2 saltou para casa 5.\n\n")
                }
                senao se (posicaoJogador2 == 3) {
                  // Sortear mais 3 casas
                  posicaoJogador2 = posicaoJogador2 + u.sorteia(1, 3)
                  escreva("[CASA 3] O jogador 2 sorteou um dado de 3 lados para se mover.\n\n")
                }
                senao se (posicaoJogador2 == 7) {
                  // Impedir o jogador na próxima rodada
                  impedirJogador = 1
                  escreva("[CASA 7] O jogador 2 foi impedido de jogar a próxima rodada.\n\n")
                }
                senao se (posicaoJogador2 == 10) {
                  // Trocar as posições
                  posicaoAuxiliar = posicaoJogador1
                  posicaoJogador1 = posicaoJogador2
                  posicaoJogador2 = posicaoAuxiliar
                  escreva("[CASA 10] O jogador 2 teve sua casa trocada pelo jogador 1.\n\n")
                }
                senao se (posicaoJogador2 == 12) {
                  // Retroceder 1 casa
                  posicaoJogador2 = posicaoJogador2 - 1
                  escreva("[CASA 12] O jogador 2 retrocedeu uma casa.\n\n")
                }
                senao se (posicaoJogador2 == 15) {
                 faca{
                 	escreva("Você terá de cantar uma canção ou sofrerá as consequências do composto V. \n\n")
                 	escreva("Aceita o desafio ou irá sucumbir? [S/N]")
                 	leia(respostaDesafio)
                 	limpa()
                 }enquanto(respostaDesafio != 'S' e respostaDesafio != 'N')

                 se(respostaDesafio == 'S' ou respostaDesafio == 's'){
                 	escreva("Você provou que não é só mais um super... \n")
                 	escreva("Continue jogando... \n ")
                 }
                 senao{
                 	escreva("Você é só mais um covarde... \n")
                 	escreva("Terá de voltar duas casas por ter me desafiado! \n")
                 	posicaoJogador2 = posicaoJogador2 - 2
                 }
                }
                senao se (posicaoJogador2 == 19) {
                  // Voltar o jogador para casa (1)
                  posicaoJogador2 = 1
                  escreva("[CASA 19] O jogador 2 voltou para o começo do jogo.\n\n")
                }

                // Alternar
                se (impedirJogador == 0) {
                  jogadorAtual = 1
                }
                senao {
                  impedirJogador = 0
                }
              }

              se (posicaoJogador1 == 20 ou posicaoJogador2 == 20) {
                escreva("Houve um ganhador!\n\nInsira qualquer caractere para retornar.\nR: ")
              } senao {
                escreva("Insira qualquer caractere para jogar o dado para o jogador [", jogadorAtual, "]...\nR: ")
              }

              leia(botaoPausar)
            }

            limpa()

            se (posicaoJogador1 == 20) {
              escreva("[CASA 20] O jogador 1 venceu.\n\n")
              pontuacaoJogador1++
            }
            senao se (posicaoJogador2 == 20) {
              escreva("[CASA 20] O jogador 2 venceu.\n\n")
              pontuacaoJogador2++
            }

            faca {
              escreva("Jogar novamente? (S/n)\nR: ")
              leia(botaoJogarNovamente)

              se (botaoJogarNovamente != 'S' ou botaoJogarNovamente != 's' ou botaoJogarNovamente != 'N' ou botaoJogarNovamente != 'n') {
                escreva("\nOpção inválida! Por favor, insira (S/s) para jogar novamente ou (N/n) para sair.\n")
              }
            }
            enquanto (botaoJogarNovamente != 'S' e botaoJogarNovamente != 's' e botaoJogarNovamente != 'N' e botaoJogarNovamente != 'n')
          }
          enquanto (botaoJogarNovamente != 'N' e botaoJogarNovamente != 'n')

          pare
        }
        caso 2: {
          /**
           * 2. Verificar Placar
           */

          limpa()
          escreva("Placar:\n\n")
          escreva("Pontuacao do Jogador 1: ", pontuacaoJogador1, "\n")
          escreva("Pontuacao do Jogador 2: ", pontuacaoJogador2, "\n\n")

          escreva("Insira qualquer caracter para retornar ao menu principal...\nR: ")
          leia(botaoPausar)

          pare
        }
        caso 3: {
          /**
           * 3. Fechar o Jogo
           */

          limpa()
          escreva("Jogo encerrado.\n")
          pare
        }
      }
    }
  }
}
