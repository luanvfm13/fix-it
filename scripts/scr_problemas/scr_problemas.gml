
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
                    { texto: "Opção 1 (melhor solução)", coesao: 100, explicacao: "Explique aqui por que essa opção integra bem os sistemas e resolve o problema de raiz." },
                    { texto: "Opção 2", coesao: 60, explicacao: "Explique aqui por que essa opção resolve parte do problema, mas deixa lacunas." },
                    { texto: "Opção 3", coesao: 40, explicacao: "Explique aqui por que essa opção é uma gambiarra — melhora pouco e cria dívida técnica." },
                    { texto: "Opção 4 (pior solução)", coesao: 10, explicacao: "Explique aqui por que essa opção não resolve nada de verdade ou até piora a situação." }
                ]
            };


        // problemaxxx abaixus:


        case "lanchonete_fila":
            return {
                nome: "Fila no Caixa",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Sistema de senha e chamada por número", coesao: 60,
                      explicacao: "Organiza a fila física, mas não conversa com o estoque — o atendente ainda checa disponibilidade na mão." },
                    
					{ texto: "Totem de Autoatendimento integrado ao estoque", coesao: 100,
                      explicacao: "O pedido já sai direto do estoque em tempo real, sem intermediário — automação de ponta a ponta, o cliente nunca espera por informação que o sistema já tem." },
                    
					{ texto: "Contratar mais funcionários para atendimento manual", coesao: 30,
                      explicacao: "Resolve na força bruta, mas não automatiza nada — o gargalo pode voltar assim que o movimento aumentar de novo." },
                    
					{ texto: "Pedir para o caixa acelerar o atendimento", coesao: 10,
                      explicacao: "Não muda o processo, só sobrecarrega quem já está sobrecarregado — o problema estrutural continua exatamente igual." }
                ]
            };

		case "Caixa":
            return {
                nome: "Caixa Infuncional",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Desligar e ligar", coesao: 60,
                      explicacao: "Resolve boa parte das travas de software, mas não investiga a causa — pode voltar a falhar em breve." },
                   
				   { texto: "Fechar o caixa até comprar um novo", coesao: 40,
                      explicacao: "Elimina o sintoma trocando o equipamento inteiro, mas para a operação e gasta mais do que precisava." },
                    
					{ texto: "Verificar o cabo de dados do Pinpad e limpar o cache do spooler da impressora térmica", coesao: 100,
                      explicacao: "Diagnóstico correto direto na causa raiz do problema — resolve sem trocar nada nem parar o funcionamento." },
                   
				   { texto: "Bater no caixa até o caixa funcionar", coesao: 10,
                      explicacao: "Não é diagnóstico nem manutenção — na melhor das hipóteses não muda nada, na pior danifica o equipamento." }
                ]
            };
	    case "vazoGais":
            return {
                nome: "Vazamento de Gás na Linha dos Fogões",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Ignorar o cheiro e acelerar os pedidos para terminar o expediente mais rápido.", coesao: 10,
                      explicacao: "Coloca todo mundo em risco real de explosão/intoxicação só pra não perder tempo — a pior escolha possível em segurança." },
                    
					{ texto: "Desligar apenas o fogão que está vazando e continuar usando os outros queimadores.", coesao: 60,
                      explicacao: "Reduz o risco imediato, mas não isola a fonte real do vazamento na tubulação — o perigo pode continuar por trás da parede." },
                   
				   { texto: "Fechar o registro central imediatamente, evacuar a área e abrir todas as janelas.", coesao: 100,
                      explicacao: "Protocolo correto de segurança: corta o fornecimento na origem e protege as pessoas antes de qualquer outra coisa." },
                    
					{ texto: "Vedar o cano com fita isolante provisória sem interromper o serviço.", coesao: 40,
                      explicacao: "É uma gambiarra perigosa — fita isolante não sela gás, só esconde o problema por um tempo curto." }
                ]
            };

	        case "freezer":
            return {
                nome: "Pane no Refrigerador e Risco de Perda de Alimentos",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Manter os alimentos no refrigerador quebrado e torcer para o técnico chegar logo.", coesao: 40,
                      explicacao: "Não resolve nada ativamente — só posterga a decisão e arrisca perder tudo se o técnico demorar." },
                   
				   { texto: "Cozinhar imediatamente os ingredientes que começaram a descongelar para não perder.", coesao: 60,
                      explicacao: "Reduz o desperdício no curto prazo, mas é reativo — não trata a causa da pane nem protege o resto do estoque." },
                   
				   { texto: "Servir os produtos mesmo com alteração de odor, mascarando o sabor com tempero.", coesao: 10,
                      explicacao: "Risco grave de segurança alimentar — mascarar não elimina contaminação, só esconde o sintoma do cliente." },
                   
				   { texto: "Transferir insumos críticos para freezers parceiros e descartar o que estragou.", coesao: 100,
                      explicacao: "Resposta de resiliência real: protege o que ainda é seguro, descarta o resto sem repassar risco ao cliente." }
                ]
            };
        
        case "lentidao_cozinha":
            return {
                nome: "Cozinha com Lentidão de Entrega",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Colocar equipamentos mais novos e práticos.", coesao: 60,
                      explicacao: "Melhora a velocidade do equipamento, mas sem reorganizar o fluxo de trabalho o ganho fica pela metade." },
                   
				   { texto: "Usar equipamentos antigos e comprar comida congelada.", coesao: 10,
                      explicacao: "Não ataca a causa da lentidão — só troca um problema de processo por um problema de qualidade do produto." },
                    
					{ texto: "Organizar e melhorar equipamentos da cozinha.", coesao: 100,
                      explicacao: "Trata processo e ferramenta juntos — layout eficiente + equipamento adequado é o que de fato acelera a produção." },
                   
				   { texto: "Distribuir as tarefas para cada um.", coesao: 40,
                      explicacao: "Ajuda a organizar pessoas, mas sozinho não compensa gargalo de equipamento ou de espaço físico." }
                ]
            };
    }

    show_debug_message("AVISO: problem_id '" + string(_id) + "' não existe em scr_problemas");
    return {
        nome: "Problema não configurado",
        empresa: "?",
        opcoes: [
            { texto: "(sem dados)", coesao: 0,  explicacao: "(sem dados)" },
            { texto: "(sem dados)", coesao: 0,  explicacao: "(sem dados)" },
            { texto: "(sem dados)", coesao: 0,  explicacao: "(sem dados)" },
            { texto: "(sem dados)", coesao: 0,  explicacao: "(sem dados)" }
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


/// resolve_problem(_problema, _opcao_index)
/// coloca a escolha, atualiza os globais, e devolve uma estruturazinha c os dados
// fiz isso pq a tela precisava de um problema alvo, nisso iria bugar tudo e o tablet iria fechar, quebrei cabeça mais deu
function resolve_problem(_problema, _opcao_index) {
    var _opcoes = _problema.problem_data.opcoes;

    if (_opcao_index < 0 || _opcao_index >= array_length(_opcoes)) {
        show_debug_message("ERRO: opcao_index inválido em resolve_problem");
        return undefined;
    }

    var _opcao = _opcoes[_opcao_index];
    var _coesao = _opcao.coesao;
    var _moedas_ganhas = _coesao div 10;

    global.coesao_total += _coesao;
    global.coesao_count += 1;
    global.moedas += _moedas_ganhas;

    _problema.is_solved = true;

    return {
        nome_problema: _problema.problem_data.nome,
        coesao: _coesao,
        moedas_ganhas: _moedas_ganhas,
        explicacao: _opcao.explicacao
    };
}