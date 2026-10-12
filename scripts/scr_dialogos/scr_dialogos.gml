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
			"1": {nome: "Senhora", texto : "Como que pode um gerente tão compromissado largar os estabelecimentos um caos assim, vixe.", opcoes: [{texto: "Continuar", proximo_id: 2}]},
			"2": {nome: "Senhora", texto: "E ainda sobra pros pobres coitados que 'trabaiam' ai. Na minha época era preso.", opcoes: []}
		};

	case "bronca_caixa_bater":
    return {
        "1": { nome: "", texto: "Bater no caixa só piorou tudo... Agora nem a trava do teclado funciona direito.", opcoes: [ { texto: "Continuar", proximo_id: 2 } ] },
        "2": { nome: "Gerente", texto: "Sério que você bateu no equipamento? Isso não é jeito de resolver nada.", opcoes: [] }
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
                    texto: "Antes de ir a seu teste, passe no seu escritório pra equipar o equipamento que você deverá usar. Boa sorte, e cuidado pra não ser demitido logo no primeiro dia.",
                    opcoes: []
                }
            };
		        case "gerente_nao_despediu_equipado":
            return {
                "1": { nome: "Gerente", texto: "Ei, aonde vai? Nem falou comigo sobre sua tarefa!", opcoes: [] }
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
        case "npc_dica_lanchonete":
            return {
                "1": {
                    nome: "",
                    texto: "Use a lupa perto de um problema para investigar.",
                    opcoes: []
                }
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