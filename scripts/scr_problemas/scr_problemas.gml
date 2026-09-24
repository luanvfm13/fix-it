
/// aq vai fica tds os problemas do jg
/// Cada problema tem um "problem_id" q e tipo um código
/// COMO ADICIONAR UM PROBLEMA NOVO:
/// 1. Copie um bloco "case" inteiro aqui embaixo
/// 2. Troque o texto do case pelo ID novo
/// 3. Preencha nome, empresa e as 4 opções
/// só seguir o molde, n tem dificuldade
///  p usar na instancia na room e so clccr setup_problem("id_do_problema");

function get_problem_data(_id) {
    switch (_id) {

             // MODELO, copia e altera p fz varios problema novos
        case "modelo_exemplo":
            return {
                nome: "Nome do Problema",
                empresa: "Nome da Empresa",
                opcoes: [
                    { texto: "Opção 1 (melhor solução)", coesao: 100 },
                    { texto: "Opção 2", coesao: 60 },
                    { texto: "Opção 3", coesao: 40 },
                    { texto: "Opção 4 (pior solução)", coesao: 10 }
                ]
            };


        // problemaxxx abaixus:


        case "lanchonete_fila":
            return {
                nome: "Fila no Caixa",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Sistema de senha e chamada por número", coesao: 60 },
                    { texto: "Totem de Autoatendimento integrado ao estoque", coesao: 100 },
                    { texto: "Contratar mais funcionários para atendimento manual", coesao: 30 },
                    { texto: "Pedir para o caixa acelerar o atendimento", coesao: 10 }
                ]
            };

		case "Caixa":
            return {
                nome: "Caixa Infuncional",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Desligar e ligar", coesao: 60 },
                    { texto: "Fechar o caixa até comprar um novo", coesao: 40 },
                    { texto: "Verificar o cabo de dados do Pinpad e limpar o cache do spooler da impressora térmica", coesao: 100 },
                    { texto: "Bater no caixa até o caixa funcionar", coesao: 10 }
                ]
            };

	    case "vazoGais":
            return {
                nome: "Vazamento de Gás na Linha dos Fogões",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Ignorar o cheiro e acelerar os pedidos para terminar o expediente mais rápido.", coesao: 10 },
                    { texto: "Desligar apenas o fogão que está vazando e continuar usando os outros queimadores.", coesao: 60 },
                    { texto: "Fechar o registro central imediatamente, evacuar a área e abrir todas as janelas.", coesao: 100 },
                    { texto: "Vedar o cano com fita isolante provisória sem interromper o serviço.", coesao: 40 }
                ]
            };

	        case "freezer":
            return {
                nome: "Pane no Refrigerador e Risco de Perda de Alimentos",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Manter os alimentos no refrigerador quebrado e torcer para o técnico chegar logo.", coesao: 40 },
                    { texto: "Cozinhar imediatamente os ingredientes que começaram a descongelar para não perder.", coesao: 60 },
                    { texto: "Servir os produtos mesmo com alteração de odor, mascarando o sabor com tempero.", coesao: 10 },
                    { texto: "Transferir insumos críticos para freezers parceiros e descartar o que estragou.", coesao: 100 }
                ]
            };
        
        case "modelo_exemplo":
            return {
                nome: "Cozinha com Lentidão de Entrega",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Colocar equipamentos mais novos e práticos.", coesao: 60 },
                    { texto: "Usar equipamentos antigos e comprar comida congelada.", coesao: 10 },
                    { texto: "Organizar e melhorar equipamentos da cozinha.", coesao: 100 },
                    { texto: "Distribuir as tarefas para cada um.", coesao: 40 }
                ]
            };
    }

    show_debug_message("AVISO: problem_id '" + string(_id) + "' não existe em scr_problemas");
    return {
        nome: "Problema não configurado",
        empresa: "?",
        opcoes: [
            { texto: "(sem dados)", coesao: 0 },
            { texto: "(sem dados)", coesao: 0 },
            { texto: "(sem dados)", coesao: 0 },
            { texto: "(sem dados)", coesao: 0 }
        ]
    };
}


/// setup_problem(_id)
/// Chame isso no Creation Code de cada instância de obj_problema,
/// na Room. Define o ID certo e já carrega os dados junto.
///
/// Exemplo de uso (dentro da Creation Code da instância):
///     setup_problem("lanchonete_fila");
function setup_problem(_id) {
    problem_id = _id;
    problem_data = get_problem_data(_id);
}


// n meche aq, é sobre o resolvimento de probrema
function resolve_problem(_problema, _opcao_index) {
    var _opcoes = _problema.problem_data.opcoes;

    if (_opcao_index < 0 || _opcao_index >= array_length(_opcoes)) {
        show_debug_message("ERRO: opcao_index inválido em resolve_problem");
        return;
    }

    var _opcao = _opcoes[_opcao_index];
    var _coesao = _opcao.coesao;

    global.coesao_total += _coesao;
    global.coesao_count += 1;
    global.moedas += (_coesao div 10); // so isso q vai mecher, dps vai decidir a quantidade de moedas/ inflação do joguin

    _problema.is_solved = true;

    if (instance_exists(obj_men)) {
        obj_men.text = "Coesão: " + string(_coesao) + "% | Moedas: " + string(global.moedas);
        obj_men.tempo = 120;
    }
}