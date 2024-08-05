programa {
  inclua biblioteca Util --> u

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

      escreva("THE BOYS - GAME\n\n")

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

          escreva("[SOLDIER BOY]\n")
          u.aguarde(1000)
          escreva("CAPITÃO PÁTRIA? É ASSIM QUE TE CHAMAM?\n ")
          u.aguarde(2000)
          escreva("RÍDICULO\n\n")
          u.aguarde(3000)
          
          escreva("[CAPITÃO PÁTRIA]\n")
          u.aguarde(1000)
          escreva("RIDÍCULO? EU SOU VOCÊ! SOU SEU SANGUE…\n\n")
          u.aguarde(3000)

         limpa()  

         escreva("[SOLDIER BOY]\n")
         u.aguarde(1000)
         escreva("VOCÊ É P… UMA DECEPÇÃO\n\n")
         u.aguarde(2000)

         escreva("[CAPITÃO PÁTRIA]\n")
         u.aguarde(1000)
         escreva("CALA A BOCA E VAMOS AO QUE INTERESSA\n\n")
         u.aguarde(2000)

         escreva("[SOLDIER BOY]\n")
         u.aguarde(1000)
         escreva("TEM CERTEZA QUE A MOCINHA NÃO DESEJA COMEÇAR?\n\n")
         u.aguarde(2000)

         limpa()

         enquanto (contagem != 0) {
            escreva("Disputa iniciando em: ", contagem, "...")
            u.aguarde(1000)
            contagem--
	          limpa()
          }

          faca {
            /** 
             * `Faca`: Executa o jogo primeiro e ao terminar a rodada servirá para continuar (S/s) ou retornar ao menu (N/n).
             * `Faca`: Caso contrário, será enviado uma mensagem de caractere inválido.
             */

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

               // Caso a nova posição do jogador for maior que 20, ela será definida para 20 novamente e aparecer corretamente no `escreva` abaixo.
                se (posicaoJogador1 > 20) {
                  posicaoJogador1 = 20
                }

                escreva("JOGADOR: ", jogadorAtual, " - Capitão Pátria \n")
                escreva("DADO: ", dado, "\n")
                escreva("POSICAO ATUAL: ", posicaoJogador1, "/20\n\n")

                /**
                 * Funcionalidades
                 */
                se (posicaoJogador1 == 2) {
                  posicaoJogador1 = 5
                  escreva("[CASA 2] Capitão Pátria voou para a casa 5.\n\n")
                }
                senao se (posicaoJogador1 == 3) {
                  // Sortear mais 3 casas
                  posicaoJogador1 = posicaoJogador1 + u.sorteia(1, 3)
                  escreva("[CASA 3] Capitão Pátria tirou a sorte grande e sorteou um dado de 3 lados para se mover.\n\n")
                }
                senao se (posicaoJogador1 == 7) {
                  // Impedir o jogador na próxima rodada
                  impedirJogador = 1
                  escreva("[CASA 7] Capitão Pátria foi impedido de jogar a próxima rodada.\n\n")
                }
                senao se (posicaoJogador1 == 10) {
                  // Trocar as posições
                  posicaoAuxiliar = posicaoJogador1
                  posicaoJogador1 = posicaoJogador2
                  posicaoJogador2 = posicaoAuxiliar
                  //diálogos dos personagens
                  escreva("[CASA 10] O capitão teve sua casa trocada com a de Soldier Boy.\n\n")
                  limpa()
                  escreva("[SOLDIER BOY]\n")
                  escreva("VOCÊ DIZ SER DO MEU SANGUE, MAS...\n")
                  u.aguarde(2000) //acrescenta um tempo entre uma frase e outra
                  escreva("SE EU TIVESSE TE CRIADO, TERIA TE TORNADO MELHOR , E NÃO FRACO, PATÉTICO E CHORÃO\n")
                  u.aguarde(2000) //tempo em milissegundos
                  escreva("VOCÊ NÃO PASSA DE UM CÓPIA BARATA...\n\n")
                  u.aguarde(2000)

                  escreva("[CAPITÃO PÁTRIA]\n")
                  u.aguarde(1000)
                  escreva("O QUE? , EU NÃO SOU A CÓPIA \n")
                  u.aguarde(2000)
                  escreva("NÃO, NÃO...\n")
                  u.aguarde(2000)
                  escreva("EU NÃO SOU A CÓPIA...\n")
                  u.aguarde(2000)
                  escreva("EU SOU O UPGRADE!!!\n|n")
                }
                senao se (posicaoJogador1 == 12) {
                  // Retroceder 1 casa
                  posicaoJogador1 = posicaoJogador1 - 1
                  escreva("[CASA 12] Capitão teve de voltar uma casa.\n\n")
                }
                senao se (posicaoJogador1 == 15) {
                  faca {
                    escreva("[CASA 15] Você terá de cantar uma canção ou sofrerá as consequências de um poderoso vírus.\n\n")
                    escreva("[SOLDIER BOY]\n")
                    u.aguarde(1000)
                    escreva("PARECE QUE A SITUAÇÃO NÃO É MUITO AGRADÁVEL...\n \n")
                    u.aguarde(2000)

                    escreva("[CAPITÃO PÁTRIA]\n")
                    u.aguarde(1000)
                    escreva("CALA A BOCA!\n\n")
                    u.aguarde(2000)

                    escreva("Aceita o desafio ou irá sucumbir? (S/n)\nR: ")
                    leia(respostaDesafio)
                    limpa()
                  }
                  enquanto(respostaDesafio != 'S' e respostaDesafio != 's' e respostaDesafio != 'N' e respostaDesafio != 'n') // Enquanto a resposta for diferente de (S/s) e (N/n) a pergunta repete até que a condição seja atendida 

                  se (respostaDesafio == 'S' ou respostaDesafio == 's') { // Verifica se a resposta é (S/s)
                    escreva("Você provou que não é só mais um super...\n\n")
                    u.aguarde(3000)
                    limpa()
                    escreva("[SOLDIER BOY]\n")
                    u.aguarde(1000)
                    escreva("ESSE É MEU GAROTO...\n")
                    u.aguarde(2000)
                    escreva("TÁ SE TORNANDO UM HOMENZINHO...\n")
                    u.aguarde(2000)
                    limpa()

                    escreva("Continue jogando...\n\n")
                  }
                  senao { // Se a resposta não é (S/s) e nem um caractere diferente de (S/s) ou (N/n), então a resposta foi (N/n)
                    
                    escreva("[SOLDIER BOY]\n")
                    u.aguarde(1000)
                    escreva("AINDA CONTINUA SENDO O MESMO DE SEMPRE...\n\n")
                    u.aguarde(3000)

                    escreva("[CAPITÃO PÁTRIA]\n")
                    u.aguarde(1000)
                    escreva("QUIETO INSETO\n")
                    u.aguarde(2000)
                    escreva("VOU TE ESMAGAARRR \n\n")
                    u.aguarde(3000)
                    limpa()
                    escreva("Terá de voltar duas casas por ter desafiado o tabuleiro!\n\n")

                    posicaoJogador1 = posicaoJogador1 - 2 // Punição ao jogador: Voltar duas casas
                  }
                }
                senao se (posicaoJogador1 == 19) {
                  // Voltar o jogador para casa (1)
                  posicaoJogador1 = 1
                  escreva("[SOLDIER BOY]\n")
                  u.aguarde(1000)
                  escreva("VOCÊ É SINÔNIMO DE FRACASSO!\n")
                  u.aguarde(3000)
                  escreva("DEVIA TER VERGONHA DE FALAR QUE É SANGUE DO MEU SANGUE!\n\n ")
                  u.aguarde(3000)
                  limpa()

                  escreva("[CAPITÃO PÁTRIA]\n") 
                  u.aguarde(1000)
                  escreva("ISSO NÃO VAI FICAR ASSIM...")
                  u.aguarde(3000)
                  limpa()

                  escreva("[SOLDIER BOY]\n")
                  u.aguarde(1000)
                  escreva("OLHA...\n")
                  u.aguarde(2000)
                  escreva("ACHO QUE JÁ TÃO ESPERANDO LÁ TRÁS (tuFFFOO) HA HA AHA...\n\n")
                  u.aguarde(3000)
                  limpa()

                  escreva("[CASA 19] Capitão Pátria voltou para o começo do jogo.\n\n")
                  u.aguarde(2000)
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
                
                // Caso a nova posição do jogador for maior que 20, ela será definida para 20 novamente e aparecer corretamente no `escreva` abaixo.
                se (posicaoJogador2 > 20) {
                  posicaoJogador2 = 20
                }

                escreva("JOGADOR: ", jogadorAtual, " - Soldier Boy \n")
                escreva("DADO: ", dado, "\n")
                escreva("POSICAO ATUAL: ", posicaoJogador2, "/20\n\n")

                /**
                 * Funcionalidades
                 */
                se (posicaoJogador2 == 2) {
                  // Mover o jogador para casa (5)
                  posicaoJogador2 = 5
                  escreva("[CASA 2] Soldier Boy saltou para casa 5.\n\n")
                }
                senao se (posicaoJogador2 == 3) {
                  // Sortear mais 3 casas
                  posicaoJogador2 = posicaoJogador2 + u.sorteia(1, 3)
                  escreva("[CASA 3] Soldier Boy tirou a sorte grande e sorteou um dado de 3 lados para se mover.\n\n")
                }
                senao se (posicaoJogador2 == 7) {
                  // Impedir o jogador na próxima rodada
                  impedirJogador = 1
                  escreva("[CASA 7] Soldier Boy foi impedido de jogar a próxima rodada.\n\n")
                }
                senao se (posicaoJogador2 == 10) {
                  // Trocar as posições
                  posicaoAuxiliar = posicaoJogador1
                  posicaoJogador1 = posicaoJogador2
                  posicaoJogador2 = posicaoAuxiliar
                  escreva("[CASA 10] Soldier Boy teve sua casa trocada com a do Capitão Pátria.\n\n")

                  escreva("[CASA 10] O capitão teve sua casa trocada com a de Soldier Boy.\n\n")
                  limpa()
                  escreva("[SOLDIER BOY]\n")
                  escreva("VOCÊ DIZ SER DO MEU SANGUE, MAS...\n")
                  u.aguarde(2000)
                  escreva("SE EU TIVESSE TE CRIADO, TERIA TE TORNADO MELHOR , E NÃO FRACO, PATÉTICO E CHORÃO\n")
                  u.aguarde(2000)
                  escreva("VOCÊ NÃO PASSA DE UM CÓPIA BARATA...\n\n")
                  u.aguarde(2000)

                  escreva("[CAPITÃO PÁTRIA]\n")
                  u.aguarde(1000)
                  escreva("O QUE?, EU NÃO SOU A CÓPIA \n")
                  u.aguarde(2000)
                  escreva("NÃO, NÃO...\n")
                  u.aguarde(2000)
                  escreva("EU NÃO SOU A CÓPIA...\n")
                  u.aguarde(2000)
                  escreva("EU SOU O UPGRADE!!!\n")
                }
                
                senao se (posicaoJogador2 == 12) {
                  // Retroceder 1 casa
                  posicaoJogador2 = posicaoJogador2 - 1

		 escreva("[CAPITÃO PÁTRIA]\n")
                  u.aguarde(1000)
                  escreva("EU TINHA VOCÊ COMO MEU HERÓI DE INFÂNCIA...\n")
                  u.aguarde(2000)

                   escreva("[SOLDIER BOY]\n")
                   u.aguarde(1000)
                   escreva("( ͡° ͜ʖ ͡°)\n")
                   u.aguarde(2000)
                   limpa()	
                  escreva("[CASA 12] Soldier Boy retrocedeu uma casa.\n\n")
                }
                senao se (posicaoJogador2 == 15) {
                  faca {
                     escreva("[CASA 15] Você terá de cantar uma canção ou sofrerá as consequências de um poderoso vírus.\n\n")
                    escreva("[CAPITÃO PÁTRIA]\n")
                    u.aguarde(1000)
                    escreva("O JOGO TÁ QUENTE PARA O SEU LADO, NÃO... \n \n")
                    u.aguarde(2000)
                    limpa()

                    escreva("[SOLDIER BOY]\n")
                    u.aguarde(1000)
                    escreva("AAHH\n\n")
                    u.aguarde(2000)
                    escreva("JÁ VIVI COISAS PIORES *cuspe*\n\n")
                    u.aguarde(2000)
                    escreva("ISSO NÃO É NADA PARA UM  SOLDADO n\n")
                    u.aguarde(2000)
                    limpa()

                    escreva("Aceita o desafio ou irá sucumbir? (S/n)\nR: ")
                    leia(respostaDesafio)
                    limpa()
                  }
                  enquanto(respostaDesafio != 'S' e respostaDesafio != 's' e respostaDesafio != 'N' e respostaDesafio != 'n') // Enquanto a resposta for diferente de (S/s) e (N/n) a pergunta repete até que a condição seja atendida 

                  se (respostaDesafio == 'S' ou respostaDesafio == 's') { // Verifica se a resposta é (S/s)
                    escreva("Você provou que não é só mais um super...\n")
                    u.aguarde(2000)
                    limpa()

                    escreva("[CAPITÃO PÁTRIA]\n")
                    u.aguarde(1000)
                    escreva("VOCÊ ERA O ÚNICO QUASE TÃO FORTE QUANTO EU…\n\n")
                    u.aguarde(2000)

                    escreva("[SOLDIER BOY]\n")
                    u.aguarde(1000)
                    escreva("SE ACHA FORTE AMIGO? \n")
                    u.aguarde(2000)
                    escreva("TÁ USANDO UMA CAPA\n\n")
                    u.aguarde(2000)
                    limpa()

                    escreva("Continue jogando...\n\n")
                  }
                  senao { // Se a resposta não é (S/s) e nem um caractere diferente de (S/s) ou (N/n), então a resposta foi (N/n)
                    escreva("[CAPITÃO PÁTRIA]\n")
                    u.aguarde(1000)
                    escreva("PENSEI QUE FOSSE MELHOR QUE ISTO...\n")
                    u.aguarde(2000)
                    escreva("MAS É ISTO QUE TE RESUME AFINAL\n")
                    u.aguarde(2000)

                    escreva("[SOLDIER BOY]\n")
                    u.aguarde(1000)
                    escreva("AQUI É SOLDADO!  \n")
                    u.aguarde(2000)
                    escreva("NÃO CANTO QUALQUER M...\n\n")
                    u.aguarde(2000)
		    limpa()		

                    escreva("Terá de voltar duas casas por ter  desafiado o tabuleiro!\n\n")
                    posicaoJogador2 = posicaoJogador2 - 2 // Punição ao jogador: Voltar duas casas
                  }
                }
                senao se (posicaoJogador2 == 19) {
                  // Voltar o jogador para casa (1)
                  posicaoJogador2 = 1
                  escreva("[CASA 19] Soldier Boy voltou para o começo do jogo.\n\n")
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
              escreva("[CASA 20] Capitão Pátria Venceu!\n\n")
              escreva("EU AVISEI...")
              u.aguarde(2000)
              escreva("EU SOU \n", u.aguarde(1000),  "O \n", u.aguarde(2000),"UPGRADE!\n")
              u.aguarde(2000)
              pontuacaoJogador1++
            }
            senao se (posicaoJogador2 == 20) {
              escreva("[CASA 20] Soldier Boy Venceu!\n\n")
              escreva("NUNCA SE ESQUEÇA O QUÃO PATÉTICO QUE VOCÊ É...\n")
              u.aguarde(2000)
              escreva("NÃO OUSE SE COMPARAR A MIM...\n\n")
              u.aguarde(2000)
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
          escreva("Pontuacao do Jogador 1: [Capitão Pátria] ", pontuacaoJogador1, "\n")
          escreva("Pontuacao do Jogador 2: [Soldier Boy] ", pontuacaoJogador2, "\n\n")

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
