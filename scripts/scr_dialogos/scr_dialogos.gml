/// scr_dialogos.gml, msm esquema do scr_problemas, centralização de conversas e puxa por id
/// 1. Copie o case "modelo_exemplo" aqui embaixo
/// 2. Troque o texto do case pelo ID novo
/// 3. Preencha os nós (cada nó tem texto + opções; cada opção aponta pro proximo_id de outro nó)
/// 4. Pra usar: setup_dialogo("id_do_dialogo") na instância de obj_dialogo

function get_dialogo_data(_id) {
    switch (_id) {

        case "gerente_intro":
            return {
                "1": {
                    nome: "Gerente",
                    texto: "Ah, você deve ser o novo agente de campo! Bem-vindo à G.A.M.E.R Technologies.",
                    opcoes: [ { texto: "Continuar", proximo_id: 2 } ]
                },
                "2": {
                    nome: "Gerente",
                    texto: "Nosso trabalho é simples: visitamos pequenos comércios e aplicamos Gestão, Automação, Modernização, Eficiência e Resiliência.",
                    opcoes: [ { texto: "Continuar", proximo_id: 3 } ]
                },
                "3": {
                    nome: "Gerente",
                    texto: "Use o Scanner (tecla R) pra achar os gargalos operacionais, e a Lupa (tecla E) pra inspecionar de perto.",
                    opcoes: [ { texto: "Continuar", proximo_id: 4 } ]
                },
                "4": {
                    nome: "Gerente",
                    texto: "Antes de ir a campo, passe no seu escritório pra equipar o equipamento. Boa sorte!",
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