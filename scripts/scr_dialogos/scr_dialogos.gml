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