/// scr_dialogos.gml, msm esquema do scr_problemas, centralização de conversas e puxa por id
/// 1. Copie o case "modelo_exemplo" aqui embaixo
/// 2. Troque o texto do case pelo ID novo
/// 3. Preencha os nós (cada nó tem texto + opções; cada opção aponta pro proximo_id de outro nó)
/// 4. Pra usar: setup_dialogo("id_do_dialogo") na instância de obj_dialogo

function get_dialogo_data(_id) {
    switch (_id) {
		case "despedida_taxi":
    return {
        "1": {
            nome: "Você",
            texto: "Valeu por me trazer. Já está pago no aplicativo. Tenha um ótimo dia!",
            opcoes: [ { texto: "Continuar", proximo_id: 2 } ]
        },
        "2": {
            nome: "Motorista",
            texto: "Valeu, um ótimo dia pra você também, vou indo.",
            opcoes: []
        }
    };
		case "bronca_freezer_torcer":
    return {
        "1": { nome: "Gerente", texto: "Deixou os alimentos lá apodrecendo e só ficou torcendo? Isso não é gestão de risco, é esperar o pior acontecer.", opcoes: [] }
    };
		case "bronca_fila_reclamar":
    return {
        "1": { nome: "", texto: "Você ficou ali reclamando com os clientes, sem resolver nada de verdade.", opcoes: [ { texto: "Continuar", proximo_id: 2 } ] },
        "2": { nome: "Gerente", texto: "Reclamar não é solução. A gente precisa de automação, não de discussão com cliente.", opcoes: [] }
    };

		case "bronca_freezer_cozinhar":
    return {
        "1": { nome: "Gerente", texto: "Cozinhou tudo correndo sem nem avaliar o que dava pra salvar? Resolveu o problema de hoje e criou um de amanhã.", opcoes: [] }
    };

		case "bronca_freezer_mascarar":
    return {
        "1": { nome: "Gerente", texto: "Você serviu comida estragada pros clientes!? Isso é risco sério à saúde das pessoas...", opcoes: [ { texto: "Continuar", proximo_id: 2 } ] },
        "2": { nome: "Gerente", texto: "...não posso ter alguém assim representando a empresa.", opcoes: [] }
    };
	case "info_caixa_desligaliga":
    return {
        "1": { nome: "", texto: "Desligou e ligou de novo... mas nada mudou.", opcoes: [] }
    };

        case "escritorio_maquina":
    return {
        "1": { nome: "Você", texto: "Uma máquina de apoio. A carcaça está gasta, mas ainda parece funcionar.", opcoes: [] }
    };

        case "escritorio_bancada":
    return {
        "1": { nome: "Você", texto: "Uma bancada de trabalho. Tem marcas de uso e algumas ferramentas guardadas por perto.", opcoes: [] }
    };

        case "escritorio_arquivo":
    return {
        "1": { nome: "Você", texto: "Um gaveteiro de arquivos. Os documentos estão separados por assunto e prontos para consulta.", opcoes: [] }
    };
		
		case "guia_gamer":
    return { "1": { nome: "", texto: "A G.A.M.E.R fica na recepção do prédio. Entre pela porta e fale com o gerente.", opcoes: [] } };
		
		case "guia_escritorio":
    return { "1": { nome: "", texto: "Pegue as ferramentas no escritório. Sem elas, não dá para começar o trabalho.", opcoes: [] } };
		
		case "guia_gerente":
    return { "1": { nome: "", texto: "O gerente ainda quer falar com você antes da próxima missão.", opcoes: [] } };
		
		case "guia_lanchonete":
    return { "1": { nome: "", texto: "A lanchonete fica pela saída da avenida. Siga para lá quando estiver pronto.", opcoes: [] } };
		
		case "guia_gerente_hosp":
    return { "1": { nome: "", texto: "Antes do hospital, passe pelo gerente e ouça a missão.", opcoes: [] } };
		
		case "guia_hospital":
    return { "1": { nome: "", texto: "O hospital fica na avenida. A rota no chão mostra o caminho.", opcoes: [] } };
        
		case "escritorio_armario":
    return {
        "1": { nome: "Você", texto: "Um armário de armazenamento. Melhor deixar tudo organizado antes de sair para o próximo atendimento.", opcoes: [] }
    };

        case "escritorio_mesa":
    return {
        "1": { nome: "Você", texto: "Uma mesa de apoio cheia de coisas do escritório. Nada aqui parece precisar de atenção agora.", opcoes: [] }
    };

        case "escritorio_computadores":
    return {
        "1": { nome: "Você", texto: "Os computadores do escritório. Um deles está ligado, com relatórios e chamados abertos na tela.", opcoes: [] }
    };
		case "teste_d":
	return {
		"1": {nome : "Maura", texto: "O 1 DS É LULAAAAAAAAAAAA", opcoes: [] }
	};
		case "veia":
		return {
            "1": {nome: "Dona", texto: "Quer uma história de presidente? Tenho duas na ponta da língua: o primeiro ou o homem que levou a capital pra Brasília?", opcoes: [
                {texto: "Conta do primeiro", proximo_id: 2},
                {texto: "Quero saber de Brasília", proximo_id: 3}
            ]},
            "2": {nome: "Dona", texto: "Marechal Deodoro da Fonseca foi o primeiro presidente do Brasil, depois da Proclamação da República, em 1889. Começou a República com farda e tudo.", opcoes: [{texto: "E o de Brasília?", proximo_id: 3}]},
            "3": {nome: "Dona", texto: "Juscelino Kubitschek prometeu cinquenta anos de progresso em cinco. Brasília foi inaugurada em 1960, no meio do cerrado. Aí sim foi mudança de endereço.", opcoes: [{texto: "Me conta mais uma", proximo_id: 4}]},
            "4": {nome: "Dona", texto: "Tancredo Neves foi eleito em 1985, mas adoeceu antes da posse e morreu. Quem assumiu foi o vice, José Sarney. Política às vezes parece novela, só que ninguém escolhe o final.", opcoes: []}
		};

        case "maura_inicio":
        return {
            "1": {nome: "Maura", texto: "Você é o consultor novo? Sou a Maura. Só um aviso: no almoço a fila dobra a esquina e o gerente finge que não vê.", opcoes: [
                {texto: "Por onde começo?", proximo_id: 2},
                {texto: "Vou falar com a equipe", proximo_id: 3}
            ]},
            "2": {nome: "Maura", texto: "Pelo caixa. Quando a maquininha engasga, o pedido inteiro para atrás dela.", opcoes: [{texto: "Vou dar uma olhada", proximo_id: 4}]},
            "3": {nome: "Maura", texto: "Boa. O pessoal sabe qual botão trava, que horas acontece e quem fica esperando.", opcoes: [{texto: "Vou perguntar", proximo_id: 4}]},
            "4": {nome: "Maura", texto: "Depois me conta se resolveu. Se travar de novo amanhã, conta como meia solução, viu?", opcoes: []}
        };

        case "atendente_inicio":
        return {
            "1": {nome: "Atendente", texto: "Se resolver a maquininha, te devo um café. Hoje já fiz pedido, caixa e suporte técnico pra ela.", opcoes: [
                {texto: "O que ela faz?", proximo_id: 2},
                {texto: "E se eu só acelerar?", proximo_id: 3}
            ]},
            "2": {nome: "Atendente", texto: "A tela congela, o pedido some e eu tenho que perguntar tudo de novo. Às vezes a cozinha já fez o primeiro.", opcoes: [{texto: "Vou investigar", proximo_id: 4}]},
            "3": {nome: "Atendente", texto: "Aí eu corro, a maquininha pensa e a fila me vê suar. Não muda muita coisa.", opcoes: [{texto: "Justo", proximo_id: 4}]},
            "4": {nome: "Atendente", texto: "Se consertar a causa, paro de decorar pedido de cliente. O café fica por minha conta.", opcoes: []}
        };

        case "dionisia_inicio":
        return {
            "1": {nome: "Dionísia", texto: "Pra chegar até aqui contei três buracos e perdi a conta antes da esquina. Meu café então... nem se fala.", opcoes: [{texto: "A rua está tão ruim assim?", proximo_id: 2}]},
            "2": {nome: "Dionísia", texto: "Ruim? Se chover, tu não sabe a várzea que fica, Deus é mais.", opcoes: []}
        };

        case "everaldo_inicio":
        return {
            "1": {nome: "Everaldo", texto: "Caiu o wi-fi? Culpa do prefeito. Acabou o pão de queijo? Também. Se meu Corinthians perder eu mato esse cavalo ", opcoes: [{texto: "E os buracos da rua?", proximo_id: 2}]},
            "2": {nome: "Everaldo", texto: "Aí eu culpo com razão! Essa calçada parece fase de plataforma: pula o buraco ou perde uma vida. Se ao menos ele ensinasse o Yuri Alberto a chutar no gol", opcoes: []}
        };

        case "loirin_inicio":
        return {
            "1": {nome: "Loirin", texto: "Toda terça, meio-dia e vinte, a fila chega na porta. O gerente ainda chama de surpresa.", opcoes: [{texto: "Ninguém avisou?", proximo_id: 2}]},
            "2": {nome: "Loirin", texto: "Avisei. Ele anotou no guardanapo e perdeu o guardanapo.", opcoes: []}
        };

        case "wilson_inicio":
        var _curiosidades_jogos = [
            "Pac-Man se chamava Puck Man no Japão. Mudaram o nome antes de lançar nos EUA porque era fácil transformar o P em outra letra no fliperama.",
            "Mario apareceu primeiro como Jumpman, no Donkey Kong de 1981. O nome Mario veio depois; o bigode ajudava a enxergar o rosto nos pixels da época.",
            "Tetris foi criado por Alexey Pajitnov em 1984. O nome mistura 'tetra', por causa das peças de quatro quadrados, com tênis, o esporte favorito do criador.",
            "O cabo Link do Game Boy ajudou Pokémon a virar conversa de recreio: dava pra trocar criaturas com outra pessoa, em vez de só jogar sozinho."
        ];
        return {
            "1": {nome: "Wilson", texto: _curiosidades_jogos[irandom(array_length(_curiosidades_jogos) - 1)], opcoes: []}
        };

	case "bronca_caixa_bater":
    return {
        "1": { nome: "", texto: "Bater no caixa só piorou tudo... Agora nem a trava do teclado funciona direito.", opcoes: [ { texto: "Continuar", proximo_id: 2 } ] },
        "2": { nome: "Gerente", texto: "Sério que você bateu no equipamento? Isso não é jeito de resolver nada.", opcoes: [] }
    };
        case "gerente_final":
            return {
                "1": {
                    nome: "Gerente",
                    texto: "Acabei de conferir seus relatórios. Lanchonete e hospital concluídos. O pessoal mandou agradecer; o Wilson perguntou se isso dá conquista.",
                    opcoes: [
                        { texto: "O mérito é da equipe", proximo_id: 2 },
                        { texto: "E agora, chefe?", proximo_id: 3 }
                    ]
                },
                "2": {
                    nome: "Gerente",
                    texto: "Ótimo! assim que se fala, você conseguiu, fez tudo certo, todo mundo está contente",
                    opcoes: [ { texto: "Foi trabalho de todo mundo", proximo_id: 4 } ]
                },
                "3": {
                    nome: "Gerente",
                    texto: "Agora sim, tudo certo, chega, por hoje feche o tablet e vá tomar uma cerveja..",
                    opcoes: [ { texto: "Justo", proximo_id: 4 } ]
                },
                "4": {
                    nome: "Gerente",
                    texto: "Bom trabalho, consultor. A porta da G.A.M.E.R fica aberta. Fim de expediente.",
                    opcoes: []
                }
            };

        case "gerente_final_parcial":
            return {
                "1": { nome: "Gerente", texto: "As duas missoes foram concluidas. Seus relatorios mostram boas melhorias, mas alguns processos ainda dependem de conferencias manuais.", opcoes: [ { texto: "O que posso melhorar?", proximo_id: 2 } ] },
                "2": { nome: "Gerente", texto: "Na proxima, acompanhe os indicadores juntos. Integrar etapas ajuda, mas treinamento e validacao tambem contam.", opcoes: [] }
            };

        case "gerente_final_baixo":
            return {
                "1": { nome: "Gerente", texto: "Voce concluiu as duas missoes, mas os relatorios ainda mostram filas e falhas importantes.", opcoes: [ { texto: "Entendi", proximo_id: 2 } ] },
                "2": { nome: "Gerente", texto: "Reveja as pistas antes de escolher. Uma solucao precisa melhorar o processo sem deixar de lado confiabilidade e equipe.", opcoes: [] }
            };

        case "toten":
            return {
                "1": { nome: "Totem", texto: "Sou o totem de autoatendimento. Os pedidos seguem direto para a cozinha e o estoque, sem depender do caixa. Assim a fila anda mais rápido.", opcoes: [] }
            };

        case "gerente_intro":
            return {
                "1": {
                    nome: "Gerente",
                    texto: "Ah, você deve ser o novo consultor de campo! Bem-vindo à G.A.M.E.R Meu querido.",
                    opcoes: [ { texto: "Continuar", proximo_id: 2 } ]
                },
                "2": {
                    nome: "Gerente",
                    texto: "Nosso trabalho é simples: visitamos pequenos comércios e aplicamos Gestão, Automação, Modernização, Eficiência e Resiliência. Isso que significa nossa sigla.",
                    opcoes: [ { texto: "Continuar", proximo_id: 3 } ]
                },
                "3": {
                    nome: "Gerente",
                    texto: "Use o Scanner (tecla R) pra achar os gargalos operacionais, e a Lupa (tecla E) pra inspecionar de perto. Logo após o tablet vai subir e você pode escolher a opção mais adequada.",
                    opcoes: [ { texto: "Continuar", proximo_id: 4 } ]
                },
                "4": {
                    nome: "Gerente",
                    texto: "Equipe o scanner e o tablet no escritório. Depois da lanchonete, volte aqui e use a porta azul para visitar o hospital. Quando concluir as duas missões, volte para me contar como foi.",
                    opcoes: []
                }
            };
		        case "gerente_nao_despediu_equipado":
            return {
                "1": { nome: "Gerente", texto: "Ei, aonde vai? Nem falou comigo sobre sua tarefa!", opcoes: [] }
            };
		    case "fora_da_rota":
            return {
                "1": { nome: "", texto: "Você saiu da rota. Siga a avenida até o hospital.", opcoes: [] }
            };
        case "escritorio_sem_equipar":
            return {
                "1": { nome: "", texto: "Você ainda não equipou todas as ferramentas. Pegue o scanner, a lupa e o tablet antes de sair.", opcoes: [] }
            };

        case "lanchonete_bloqueada":
            return {
                "1": { nome: "", texto: "Antes de entrar no restaurante, passe na G.A.M.E.R. e receba sua missão com o gerente.", opcoes: [] }
            };
			
		case "gerente_lembrete":
            return {
                "1": { nome: "Gerente", texto: "Ainda não equipou as ferramentas? Passe no seu escritório antes de sair.", opcoes: [] }
            };

        case "gerente_despedida":
            return {
                "1": { nome: "Gerente", texto: "Ótimo, você está equipado. Sua primeira missão é na lanchonete, pela saída da avenida.", opcoes: [ { texto: "Continuar", proximo_id: 2 } ] },
                "2": { nome: "Gerente", texto: "O caixa de lá travou e ninguém sabe por quê. Mostre o que a automação pode fazer por eles. Boa sorte, agente!", opcoes: [] }
            };
		 case "gerente_nao_falou":
            return {
                "1": { nome: "Gerente", texto: "Não vai falar comigo? Quer perder pontos logo no seu primeiro dia?", opcoes: [] }
            };
		case "gerente_nao_despediu":
            return {
                "1": { nome: "Gerente", texto: "Ei, aonde vai? Ainda não pegou suas ferramentas e nem falou comigo sobre a missão!", opcoes: [] }
            };
		        case "gerente_hospital":
            return {
                "1": { nome: "Gerente", texto: "Boa, a lanchonete voltou a funcionar! Agora o hospital precisa de ajuda com o estoque de insumos. Siga pela avenida até lá.", opcoes: [] }
            };

        case "gerente_lembrete_hosp":
            return {
                "1": { nome: "Gerente", texto: "A porta do hospital fica na avenida. Não se perca no caminho.", opcoes: [] }
            };

        case "gerente_nao_missao_hosp":
            return {
                "1": { nome: "Gerente", texto: "Ei! Antes de sair, passe aqui e ouça a missão do hospital.", opcoes: [] }
            };

        case "hospital_bloqueado":
            return {
                "1": { nome: "", texto: "O hospital precisa de uma missão nossa. Antes, passe na G.A.M.E.R. e receba a orientação do gerente.", opcoes: [] }
            };	
        case "npc_dica_lanchonete":
            return {
                "1": {
                    nome: "",
                    texto: "Use a lupa perto de um problema para investigar.",
                    opcoes: []
                }
            }
			
		case "at": 
		return {
			  "1": {
    nome: "Jonas (Atendente)",
    texto: "Oi, boa noite... Olha, já vou te adiantando: o freezer pifou de vez e o sorvete virou sopa. Para piorar, o sistema do caixa caiu. Vai querer arriscar pedir algo?",
    opcoes: [
      { texto: "Mas nem o refrigerante tá gelado? Como vou pagar?", proximo_id: 2 },
      { texto: "Que bagunça! Cadê o gerente para resolver isso?", proximo_id: 3 }
    ]
  },
  "2": {
    nome: "Jonas (Atendente)",
    texto: "Gelado? O refrigerante tá morno que parece chá! sinta-se livre para tentar resolver, pior ainda só este caixa.",
    opcoes: []
  },
  "3": {
    nome: "Jonas (Atendente)",
    texto: "O gerente? Aquele sumiu faz horas! Aposto que foi embora para não ter que escutar o barulho infernal que esse freezer tá fazendo enquanto derrete as coisas.",
    opcoes: []
  }
		}
		case "musga":
        if (global.musica_ativa) {
            return {
                "1": {nome: "Troca-troca", texto: "Haloooooooooooooooooooooo, quer desligar a musica???", opcoes: [
                    {texto: "Desliga a música", proximo_id: 2, musica_ativa: false},
                    {texto: "Deixa tocar", proximo_id: 3}
                ]},
                "2": {nome: "Troca-troca", texto: "Fechou chefe.", opcoes: []},
                "3": {nome: "Troca-troca", texto: "Ja que insiste...", opcoes: []}
            };
        }

        return {
            "1": {nome: "Troca-troca", texto: "heyyy, quer a musga denovo? ", opcoes: [
                {texto: "Liga a música", proximo_id: 2, musica_ativa: true},
                {texto: "Prefiro o silêncio", proximo_id: 3}
            ]},
            "2": {nome: "Troca-troca", texto: "belezura", opcoes: []},
            "3": {nome: "Troca-troca", texto: "taokei.", opcoes: []}
        };

        case "fluvio_inicio":
        return {
            "1": {nome: "Flávio", texto: "E aí, tudo bem? Notei que o freezer tá dando problema, mas já chamou o técnico? Se precisar de ajuda pra resolver, é só falar.", opcoes: [{texto: "Freezer estragado", proximo_id: 2}, {texto: "Tá funcionando agora", proximo_id: 3}] }};
            "2": {nome: "Flávio", texto: "Sem freezer a gente perde tudo. O lucro some e o cliente fica chateado. Conseguiu consertar ou precisa de mais alguma coisa?", opcoes: [] }};
            "3": {nome: "Flávio", texto: "Se precisar de mais alguma coisa, é só chamar. Bom trabalho!", opcoes: [] }};
        };
        case "lavio_inicio":
        return {
            "1": {nome: "Lávio", texto: "Tava organizando o estoque quando vi que some coisa sumiu. Alguém mexeu sem perguntar? Se for cliente reclamando, já anotei quem foi.", opcoes: [{texto: "Algo sumiu do estoque", proximo_id: 2}, {texto: "Tava tudo no lugar", proximo_id: 3}] }};
            "2": {nome: "Lávio", texto: "Ah, aquela atendente meio desajeitada... Disse que tava arrumando e sumiu o pão. Preciso verificar o que sobrou.", opcoes: [] }};
            "3": {nome: "Lávio", texto: "Fica esperto com o estoque. Nada some sem motivo.", opcoes: [] }};
        };
        case "leandra_inicio":
        return {
            "1": {nome: "Leandra", texto: "Você é o novo consultor? O gerente falou que tô no turno errado, mas parece que ele tava confundido mesmo. Então... e agora?", opcoes: [{texto: "Sobre o turno", proximo_id: 2}, {texto: "Sobre a missão", proximo_id: 3}] }};
            "2": {nome: "Leandra", texto: "Ah, o turno da noite tá um caos. Pilha de mensagens, cliente reclamando de tudo quanto é lado. Se organize, porque eu tô saturada.", opcoes: [] }};
            "3": {nome: "Leandra", texto: "Missão? Na lanchonete? Já ouvi falar, mas ainda não fui lá. Deixe eu terminar aqui primeiro, combinado?", opcoes: [] }};
        };
        case "loucoquevaifalarcoisas_inicio":
        return {
            "1": {nome: "O Louco", texto: "As vozes mandaram que o freezer é o centro do universo e que o sorvete cura tudo! O que você acha?", opcoes: [{texto: "Sorvete cura?", proximo_id: 2}, {texto: "Freezer é centro?", proximo_id: 3}] }};
            "2": {nome: "O Louco", texto: "Não é o sorvete não! É a energia! Tudo energia! Já viu aqueles potes? Guardam a memória do cosmos!", opcoes: [] }};
            "3": {nome: "O Louco", texto: "Fala sério, o freezer queimou e agora as vozes ficaram mais altas. Tem mais alguém vendo isso ou é só eu?", opcoes: [] }};
        };
        case "nelipefeto_inicio":
        return {
            "1": {nome: "Nélio Feto", texto: "Ei, rapaziada! O wi-fi caiu de novo? Quem tá responsá por isso aqui? Se for o provedor, ja estou na hora de reclamar.", opcoes: [{texto: "Wi-fi caiu", proximo_id: 2}, {texto: "Tudo funcionando", proximo_id: 3}] }};
            "2": {nome: "Nélio Feto", texto: "Essa internet lenta é pior que buraco na estrada. Pedido some, cliente irritado, gerente nervoso. Tava esperando melhorar sozinho, mas não melhora.", opcoes: [] }};
            "3": {nome: "Nélio Feto", texto: "Se arrumar, avisa aqui. Eu tô ficando velho pra essas modernices.", opcoes: [] }};
        };
        case "tonyjark_inicio":
        return {
            "1": {nome: "Tony Jark", texto: "E aí, consultor! Tava dando uma olhada no scanner e vi que o freezer tava na porcentagem crítica. Geladeira velha mesmo, tem que renova.", opcoes: [{texto: "Freezer crítico", proximo_id: 2}, {texto: "Tava dando uma olhada", proximo_id: 3}] }};
            "2": {nome: "Tony Jark", texto: "Critico mesmo! Sorvete derretendo, cliente reclamando, gerente ficando louco. Se consertar, ganha um desconto no próximo pedido.", opcoes: [] }};
            "3": {nome: "Tony Jark", texto: "Desconto? Show. Se precisar de mais alguma coisa, é só chamar. Tchu!", opcoes: [] }};
        };
        case "threepacsentadolado_inicio":
        return {
            "1": {nome: "Três Pacentes", texto: "Ei! O senhor viu o que aconteceu com o freezer? Parece que o compressor desistiu da vida. Triste dia pra geladeira!", opcoes: [{texto: "Freezer parado", proximo_id: 2}, {texto: "O que aconteceu?", proximo_id: 3}] }};
            "2": {nome: "Três Pacentes", texto: "Compressor desistiu! Agora é geladeira normal, sem aquele frio de antes. O sorvete tava bom, hein? Agora é ruim.", opcoes: [] }};
            "3": {nome: "Três Pacentes", texto: "E o sorvete? O senhor gosta de sorvete? Eu gosto de sorvete. Sorvete bom é sorvete quente... ou frio. De qualquer jeito, bom.", opcoes: [] }};
        };
        case "qporra_inicio":
        return {
            "1": {nome: "", texto: "Eita, mais um problema pra resolver. O freezer tava viajando denovo. Que porra é essa?", opcoes: [{texto: "Freezer viajando", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "Sério? Outra vez? Quando a gente acha que já resolveu, surge outro. É sempre alguma coisa aqui.", opcoes: [] }};
            "3": {nome: "", texto: "Bom, tem que lidar. Scanner na mão e ver o que tá acontecendo com o sistema.", opcoes: [] }};
        };
        case "marcelo_inicio":
        return {
            "1": {nome: "Marcelo", texto: "E aí, consultor! Tava olhando pra fila e percebi que a fila dobra a esquina no almoço. O gerente finge que não vê, mas todo mundo vê.", opcoes: [{texto: "Fila dobra na esquina", proximo_id: 2}, {texto: "Gerente finge", proximo_id: 3}] }};
            "2": {nome: "Marcelo", texto: "Fingir não vê não resolve nada. A fila cresce, cliente irritado, pedido some. Se tem jeito de organizar, chama eu, que eu aviso o pessoal.", opcoes: [] }};
            "3": {nome: "Marcelo", texto: "Vou anotando aí. Se precisar de ajuda com fila ou estoque, é só chamar. Tá ligado?", opcoes: [] }};
        };
        case "sidney_inicio":
        return {
            "1": {nome: "Sidney", texto: "E aí, tudo bem? O gerente falou que tô no turno errado, mas parece que ele tava confundido mesmo. Então... e agora?", opcoes: [{texto: "Sobre o turno", proximo_id: 2}, {texto: "Sobre a missão", proximo_id: 3}] }};
            "2": {nome: "Sidney", texto: "Ah, o turno da manhã tá mais tranquilo. Mas a fila ainda anda devagar. Se organizar, a gente melhora.", opcoes: [] }};
            "3": {nome: "Sidney", texto: "Missão? Na lanchonete? Já ouvi falar, mas ainda não fui lá. Deixe eu terminar aqui primeiro, combinado?", opcoes: [] }};
        };
        case "emerson_inicio":
        return {
            "1": {nome: "Emerson", texto: "E aí, consultor! Tava testando o scanner e o freezer mostrou que o sistema tava caindo. Tecnologia velha, dá problema. Tava testando mesmo.", opcoes: [{texto: "Scanner caindo", proximo_id: 2}, {texto: "Tava testando", proximo_id: 3}] }};
            "2": {nome: "Emerson", texto: "Sistema caindo mesmo! Scanner trava, freezer marca errado, gerente ficando louco. Se arrumar, anota aqui pra gente não repetir.", opcoes: [] }};
            "3": {nome: "Emerson", texto: "Vou anotando. Se precisar de mais teste, é só chamar. Tecnologia da gente é assim mesmo.", opcoes: [] }};
        };
        case "dona_deolane_inicio":
        return {
            "1": {nome: "Dona Deolane", texto: "Quer uma história de presidente? Tenho duas na ponta da língua: o primeiro ou o homem que levou a capital pra Brasília?", opcoes: [{texto: "Conta do primeiro", proximo_id: 2}, {texto: "Quero saber de Brasília", proximo_id: 3}] }};
            "2": {nome: "Dona Deolane", texto: "Marechal Deodoro da Fonseca foi o primeiro presidente do Brasil, depois da Proclamação da República, em 1889. Começou a República com farda e tudo.", opcoes: [{texto: "E o de Brasília?", proximo_id: 3}] }};
            "3": {nome: "Dona Deolane", texto: "Juscelino Kubitschek prometeu cinquenta anos de progresso em cinco. Brasília foi inaugurada em 1960, no meio do cerrado. Aí sim foi mudança de endereço.", opcoes: [{texto: "Me conta mais uma", proximo_id: 4}] }};
            "4": {nome: "Dona Deolane", texto: "Tancredo Neves foi eleito em 1985, mas adoeceu antes da posse e morreu. Quem assumiu foi o vice, José Sarney. Política às vezes parece novela, só que ninguém escolhe o final.", opcoes: [] }};
        };
        case "gerente_demitido_inicio":
        return {
            "1": {nome: "Gerente Demitido", texto: "Ei, você é o novo consultor? Escutei que tava chegando alguém. Aqui tá feio, freezer queimado, gerente sumiu. Precisa de ajuda?", opcoes: [{texto: "Freezer queimado", proximo_id: 2}, {texto: "Gerente sumiu", proximo_id: 3}] }};
            "2": {nome: "Gerente Demitido", texto: "Freezer queimou de vez. Sorvete derretido, cliente chateado, prejuízo grande. Se consertar, a gente comemora. Se não, a gente luta pra sobreviver.", opcoes: [] }};
            "3": {nome: "Gerente Demitido", texto: "Gerente sumiu faz semanas. Sumiu mesmo, sumiu de fininho. Ninguém sabe onde foi. Pode ser que tenha ido embora pra não ter que ver esse desastre.", opcoes: [] }};
            "4": {nome: "Gerente Demitido", texto: "Se achar notícias, avisa aqui. A gente precisa continuar, mesmo com todo esse caos.", opcoes: [] }};
        };
        case "gerente_deslike_inicio":
        return {
            "1": {nome: "Gerente Deslike", texto: "E aí, consultor? Tava olhando pra fila e vi que a galera t reclamando do atendimento. O sistema caiu, freezer tava viajando, unica coisa que nao tava faltando era problema.", opcoes: [{texto: "Fila reclamando", proximo_id: 2}, {texto: "Sistema caindo", proximo_id: 3}] }};
            "2": {nome: "Gerente Deslike", texto: "Sistema caindo de novo! Scanner trava, freezer marca errado, cliente irritado. Se arrumar, anota aqui. Se nao, a culpa vai pra mim denovo.", opcoes: [] }};
            "3": {nome: "Gerente Deslike", texto: "E aquela atendente meio desajeitada... Disse que tava arrumando e sumiu o pão. Preciso verificar o que sobrou.", opcoes: [] }};
            "4": {nome: "Gerente Deslike", texto: "Fica esperto com o estoque. Nada some sem motivo. Se precisar de mais alguma coisa, é só chamar.", opcoes: [] }};
        };
        case "gerente_joinha_inicio":
        return {
            "1": {nome: "Gerente Joinha", texto: "E aí, tudo bem? Tava olhando o relatório e vi que as filas t alongando. O scanner t travando denovo, parece que tem algo errado com o sistema.", opcoes: [{texto: "Fila alongando", proximo_id: 2}, {texto: "Scanner travando", proximo_id: 3}] }};
            "2": {nome: "Gerente Joinha", texto: "Scanner travando denovo! Sistema caindo, freezer viajando, cliente reclamando. Se arrumar, anota aqui pra gente nao repetir o mesmo erro.", opcoes: [] }};
            "3": {nome: "Gerente Joinha", texto: "E aquela atendente meio desajeitada... Disse que tava arrumando e sumiu o pão. Preciso verificar o que sobrou.", opcoes: [] }};
            "4": {nome: "Gerente Joinha", texto: "Fica esperto com o estoque. Nada some sem motivo. Se precisar de mais alguma coisa, é só chamar.", opcoes: [] }};
        };
        case "gerente_palmas_inicio":
        return {
            "1": {nome: "Gerente Palmas", texto: "E aí, consultor! Tava olhando pro freezer e vi que tava na porcentagem crítica. Mais uma vez! Geladeira velha mesmo, tem que renova ou ta na hora de desistir.", opcoes: [{texto: "Freezer crítico", proximo_id: 2}, {texto: "Tava olhando", proximo_id: 3}] }};
            "2": {nome: "Gerente Palmas", texto: "Critico mesmo! Sorvete derretendo, cliente reclamando, gerente ficando louco. Se consertar, ganha um desconto no próximo pedido. Ou nao. Sua escolha.", opcoes: [] }};
            "3": {nome: "Gerente Palmas", texto: "Desconto? Show. Se precisar de mais alguma coisa, é só chamar. Tchu! Se nao, boa sorte lidando com esse freezer velho.", opcoes: [] }};
            "4": {nome: "Gerente Palmas", texto: "Se nao consertar, nao vem reclamar pra mim. Freezer velho da aquela vida, todo mundo ja sabe.", opcoes: [] }};
        };
        case "npc1costas_inicio":
        return {
            "1": {nome: "", texto: "Fala do lado de cá. Tava olhando pro movimento da rua e vi que tem carro dobrando na esquina. Cuidado pra nao se machucar.", opcoes: [{texto: "Carro na esquina", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "E ai, consultor? Tava observando o movimento. Tem cliente chegando, fila andando, o de sempre. Nada de estranho acontecendo.", opcoes: [] }};
            "3": {nome: "", texto: "Se precisar de mais alguma coisa, é só chamar. Cuidado com as esquinas.", opcoes: [] }};
        };
        case "npc2costas_inicio":
        return {
            "1": {nome: "", texto: "Fala do lado de cá. Tava olhando pro movimento da rua e vi que tem carro dobrando na esquina. Cuidado pra nao se machucar.", opcoes: [{texto: "Carro na esquina", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "E ai, consultor? Tava observando o movimento. Tem cliente chegando, fila andando, o de sempre. Nada de estranho acontecendo.", opcoes: [] }};
            "3": {nome: "", texto: "Se precisar de mais alguma coisa, é só chamar. Cuidado com as esquinas.", opcoes: [] }};
        };
        case "npc3costas_inicio":
        return {
            "1": {nome: "", texto: "Fala do lado de cá. Tava olhando pro movimento da rua e vi que tem carro dobrando na esquina. Cuidado pra nao se machucar.", opcoes: [{texto: "Carro na esquina", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "E ai, consultor? Tava observando o movimento. Tem cliente chegando, fila andando, o de sempre. Nada de estranho acontecendo.", opcoes: [] }};
            "3": {nome: "", texto: "Se precisar de mais alguma coisa, é só chamar. Cuidado com as esquinas.", opcoes: [] }};
        };
        case "npc4costas_inicio":
        return {
            "1": {nome: "", texto: "Fala do lado de cá. Tava olhando pro movimento da rua e vi que tem carro dobrando na esquina. Cuidado pra nao se machucar.", opcoes: [{texto: "Carro na esquina", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "E ai, consultor? Tava observando o movimento. Tem cliente chegando, fila andando, o de sempre. Nada de estranho acontecendo.", opcoes: [] }};
            "3": {nome: "", texto: "Se precisar de mais alguma coisa, é só chamar. Cuidado com as esquinas.", opcoes: [] }};
        };
        case "npc5costas_inicio":
        return {
            "1": {nome: "", texto: "Fala do lado de cá. Tava olhando pro movimento da rua e vi que tem carro dobrando na esquina. Cuidado pra nao se machucar.", opcoes: [{texto: "Carro na esquina", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "E ai, consultor? Tava observando o movimento. Tem cliente chegando, fila andando, o de sempre. Nada de estranho acontecendo.", opcoes: [] }};
            "3": {nome: "", texto: "Se precisar de mais alguma coisa, é só chamar. Cuidado com as esquinas.", opcoes: [] }};
        };
        case "npc6costas_inicio":
        return {
            "1": {nome: "", texto: "Fala do lado de cá. Tava olhando pro movimento da rua e vi que tem carro dobrando na esquina. Cuidado pra nao se machucar.", opcoes: [{texto: "Carro na esquina", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "E ai, consultor? Tava observando o movimento. Tem cliente chegando, fila andando, o de sempre. Nada de estranho acontecendo.", opcoes: [] }};
            "3": {nome: "", texto: "Se precisar de mais alguma coisa, é só chamar. Cuidado com as esquinas.", opcoes: [] }};
        };
        case "npc7costas_inicio":
        return {
            "1": {nome: "", texto: "Fala do lado de cá. Tava olhando pro movimento da rua e vi que tem carro dobrando na esquina. Cuidado pra nao se machucar.", opcoes: [{texto: "Carro na esquina", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "E ai, consultor? Tava observando o movimento. Tem cliente chegando, fila andando, o de sempre. Nada de estranho acontecendo.", opcoes: [] }};
            "3": {nome: "", texto: "Se precisar de mais alguma coisa, é só chamar. Cuidado com as esquinas.", opcoes: [] }};
        };
        case "npc8costas_inicio":
        return {
            "1": {nome: "", texto: "Fala do lado de cá. Tava olhando pro movimento da rua e vi que tem carro dobrando na esquina. Cuidado pra nao se machucar.", opcoes: [{texto: "Carro na esquina", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "E ai, consultor? Tava observando o movimento. Tem cliente chegando, fila andando, o de sempre. Nada de estranho acontecendo.", opcoes: [] }};
            "3": {nome: "", texto: "Se precisar de mais alguma coisa, é só chamar. Cuidado com as esquinas.", opcoes: [] }};
        };
        case "npc9costas_inicio":
        return {
            "1": {nome: "", texto: "Fala do lado de cá. Tava olhando pro movimento da rua e vi que tem carro dobrando na esquina. Cuidado pra nao se machucar.", opcoes: [{texto: "Carro na esquina", proximo_id: 2}, {texto: "Tava tranquilo", proximo_id: 3}] }};
            "2": {nome: "", texto: "E ai, consultor? Tava observando o movimento. Tem cliente chegando, fila andando, o de sempre. Nada de estranho acontecendo.", opcoes: [] }};
            "3": {nome: "", texto: "Se precisar de mais alguma coisa, é só chamar. Cuidado com as esquinas.", opcoes: [] }};
        };
        // MODELO, copia e altera p criar diálogos novos
        case "modelo_exemplo":
            return {
                "1": {
                    nome: "Nome do NPC",
                    texto: "Texto da primeira fala.",
                    opcoes: [
                        { texto: "Escolha A", proximo_id: 2 },
                        { texto: "Escolha B", proximo_id: 3 }
                    ]
                },
                "2": { nome: "", texto: "Resultado da escolha A.", opcoes: [] },
                "3": { nome: "", texto: "Resultado da escolha B.", opcoes: [] }
            };
    }

    show_debug_message("AVISO: dialogo_id '" + string(_id) + "' não existe em scr_dialogos");
    return {
        "1": {
            nome: "???",
            texto: "(diálogo não configurado: " + string(_id) + ")",
            opcoes: []
        }
    };
}

/// setup_dialogo(_id)
/// Chame isso NA instância de obj_dialogo logo após criá-la (veja obj_npc1/Step_0.gml).
function setup_dialogo(_id) {
    dialogo_id = _id;
    dados_dialogo = get_dialogo_data(_id);
    no_atual = "1";
}