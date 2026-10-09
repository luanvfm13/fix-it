
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
              explicacao: "Organiza a fila física, mas não conversa com o estoque — o atendente ainda checa disponibilidade na mão.",
              sprite_resultado: "spr_sol_totemsenha", dialogo_bronca: "", demite: false, acao_especial: "cliente_senha" },
            { texto: "Totem de Autoatendimento integrado ao estoque", coesao: 100,
              explicacao: "O pedido já sai direto do estoque em tempo real, sem intermediário — automação de ponta a ponta.",
              sprite_resultado: "spr_sol_autoatendimento", dialogo_bronca: "", demite: false, acao_especial: "cliente_autoatendimento" },
            { texto: "Contratar mais funcionários para atendimento manual", coesao: 30,
              explicacao: "Resolve na força bruta, mas não automatiza nada — o gargalo pode voltar assim que o movimento aumentar.",
              sprite_resultado: "spr_sol_contratar", dialogo_bronca: "", demite: false, acao_especial: "" },
            { texto: "Pedir para o caixa acelerar o atendimento", coesao: 10,
              explicacao: "Não muda o processo, só sobrecarrega quem já está sobrecarregado.",
              sprite_resultado: "", dialogo_bronca: "bronca_fila_reclamar", demite: false, acao_especial: "" }
        ]
    };

case "Caixa":
    return {
        nome: "Caixa Infuncional",
        empresa: "Lanchonete",
        opcoes: [
            { texto: "Desligar e ligar", coesao: 60,
              explicacao: "Resolve boa parte das travas de software, mas não investiga a causa — pode voltar a falhar em breve.",
              sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "npc_desligaliga" },
            { texto: "Fechar o caixa até comprar um novo", coesao: 40,
              explicacao: "Elimina o sintoma trocando o equipamento inteiro, mas para a operação e gasta mais do que precisava.",
              sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "remove_atendente" },
            { texto: "Verificar o cabo de dados do Pinpad e limpar o cache do spooler da impressora térmica", coesao: 100,
              explicacao: "Diagnóstico correto direto na causa raiz do problema — resolve sem trocar nada nem parar o funcionamento.",
              sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "" },
            { texto: "Bater no caixa até o caixa funcionar", coesao: 10,
              explicacao: "Não é diagnóstico nem manutenção — na melhor das hipóteses não muda nada, na pior danifica o equipamento.",
              sprite_resultado: noone, dialogo_bronca: "bronca_caixa_bater", demite: false, acao_especial: "" }
        ]
    };

case "freezer":
    return {
        nome: "Pane no Refrigerador e Risco de Perda de Alimentos",
        empresa: "Lanchonete",
        opcoes: [
            { texto: "Manter os alimentos no refrigerador quebrado e torcer para o técnico chegar logo.", coesao: 20,
              explicacao: "Não resolve nada ativamente — só posterga a decisão e arrisca perder tudo se o técnico demorar.",
              sprite_resultado: noone, dialogo_bronca: "bronca_freezer_torcer", demite: false },

            { texto: "Cozinhar imediatamente os ingredientes que começaram a descongelar para não perder.", coesao: 30,
              explicacao: "Reduz o desperdício no curto prazo, mas é reativo, não trata a causa da pane nem protege o resto do estoque.",
              sprite_resultado: noone, dialogo_bronca: "bronca_freezer_cozinhar", demite: false },

            { texto: "Servir os produtos mesmo com alteração de odor, mascarando o sabor com tempero.", coesao: 0,
              explicacao: "Risco grave de segurança alimentar, mascarar não elimina contaminação, só esconde o sintoma do cliente.",
              sprite_resultado: noone, dialogo_bronca: "bronca_freezer_mascarar", demite: true },

            { texto: "Transferir insumos críticos para freezers parceiros e descartar o que estragou.", coesao: 100,
              explicacao: "Resposta de resiliência real: protege o que ainda é seguro, descarta o resto sem repassar risco ao cliente.",
              sprite_resultado: noone, dialogo_bronca: "", demite: false }
        ]
    };
        

case "lentidao_cozinha":
    return {
        nome: "Cozinha com Lentidão de Entrega",
        empresa: "Lanchonete",
        opcoes: [
            { texto: "Colocar equipamentos mais novos e práticos.", coesao: 60,
              explicacao: "Melhora a velocidade do equipamento, mas sem reorganizar o fluxo o ganho fica pela metade.",
               sprite_resultado: noone, dialogo_bronca: "", demite: false },
            { texto: "Usar equipamentos antigos e comprar comida congelada.", coesao: 10,
              explicacao: "Não ataca a causa da lentidão, só troca um problema de processo por um de qualidade.",
               sprite_resultado: noone, dialogo_bronca: "", demite: false },
            { texto: "Organizar e melhorar equipamentos da cozinha.", coesao: 100,
              explicacao: "Trata processo e ferramenta juntos, é o que de fato acelera a produção.",
               sprite_resultado: noone, dialogo_bronca: "", demite: false },
            { texto: "Distribuir as tarefas para cada um.", coesao: 40,
              explicacao: "Ajuda a organizar pessoas, mas sozinho não compensa gargalo de equipamento.",
               sprite_resultado: noone, dialogo_bronca: "", demite: false }
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

/// get_categoria_coesao(_media)
/// Traduz a média de coesão numa categoria pra mostrar no final 
function get_categoria_coesao(_media) {
    if (_media >= 90) {
        return { titulo: "Automação Total", cor: c_lime,
                 texto: "Suas soluções integraram os sistemas de ponta a ponta, eficiência máxima." };
    } else if (_media >= 50) {
        return { titulo: "Integração Parcial", cor: c_yellow,
                 texto: "Boas melhorias, mas ainda há lacunas de automação pra fechar." };
    } else if (_media >= 20) {
        return { titulo: "Gambiarra Técnica", cor: c_orange,
                 texto: "As soluções resolveram pouco e criaram dívida técnica pro futuro." };
    } else {
        return { titulo: "Sem Efeito", cor: c_red,
                 texto: "Praticamente nada mudou, os problemas continuam de verdade." };
    }
}

/// criar_ordem_embaralhada(_qtd) é aql ngc que nõs comentamos de escolher aleatoriamente
function criar_ordem_embaralhada(_qtd) {
    var _ordem = array_create(_qtd);
    for (var i = 0; i < _qtd; i++) _ordem[i] = i;
    for (var i = _qtd - 1; i > 0; i--) {
        var _j = irandom(i);
        var _tmp = _ordem[i];
        _ordem[i] = _ordem[_j];
        _ordem[_j] = _tmp;
    }
    return _ordem;
}
//
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
	    var _sr = _opcao[$ "sprite_resultado"];
    if (is_string(_sr) && _sr != "") {
        var _spr = asset_get_index(_sr);
        if (_spr != -1 && asset_get_type(_sr) == asset_sprite) {
            var _dec = instance_create_depth(_problema.x, _problema.y, _problema.depth, obj_solucao_instalada);
            _dec.sprite_index = _spr;
        }
    }
    var _acao = _opcao[$ "acao_especial"];
    if (is_string(_acao) && _acao != "") {
        switch (_acao) {
            case "npc_desligaliga":
                var _f_desliga = instance_create_depth(_problema.x - 60, _problema.y, _problema.depth - 1, obj_funcionario_generico);
                _f_desliga.rota = [ { x: _f_desliga.x, y: _f_desliga.y }, { x: _problema.x, y: _problema.y } ];
                _f_desliga.dialogo_id = "info_caixa_desligaliga";
                break;

            case "remove_atendente":
                if (instance_exists(_problema.atendente_vinculado)) {
                    instance_destroy(_problema.atendente_vinculado);
                }
                break;

            case "cliente_senha":
                var _f_senha = instance_create_depth(_problema.x - 60, _problema.y, _problema.depth - 1, obj_funcionario_generico);
                _f_senha.rota = [ { x: _f_senha.x, y: _f_senha.y }, { x: _problema.x, y: _problema.y } ];
                _f_senha.espera = 30;
                break;

            case "cliente_autoatendimento":
                var _f_auto = instance_create_depth(_problema.x - 60, _problema.y, _problema.depth - 1, obj_funcionario_generico);
                _f_auto.rota = [ { x: _f_auto.x, y: _f_auto.y }, { x: _problema.x, y: _problema.y }, { x: _problema.x + 50, y: _problema.y + 40 } ];
                _f_auto.espera = 45;
                break;
        }
    }

    if (variable_struct_exists(_opcao, "dialogo_bronca") && _opcao.dialogo_bronca != "") {
        global.bronca_pendente = _opcao.dialogo_bronca;
    }

    if (variable_struct_exists(_opcao, "demite") && _opcao.demite) {
        global.foi_demitido = true;
    }
    _problema.is_solved = true;

    return {
        nome_problema: _problema.problem_data.nome,
        coesao: _coesao,
        moedas_ganhas: _moedas_ganhas,
        explicacao: _opcao.explicacao
    };
}