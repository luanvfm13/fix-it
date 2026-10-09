/// scr_dialogos.gml, msm esquema do scr_problemas, centralização de conversas e puxa por id
/// 1. Copie o case "modelo_exemplo" aqui embaixo
/// 2. Troque o texto do case pelo ID novo
/// 3. Preencha os nós (cada nó tem texto + opções; cada opção aponta pro proximo_id de outro nó)
/// 4. Pra usar: setup_dialogo("id_do_dialogo") na instância de obj_dialogo

function get_dialogo_data(_id) {
    switch (_id) {
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