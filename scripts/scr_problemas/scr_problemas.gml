
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

        case "falha_conexao":
            return {
                nome: "Falha inesperada de comunicacao",
                empresa: "Operacao",
                resistencia_equipe: 35,
                opcoes: [
                    { texto: "Criar fila local com sincronizacao e validacao ao reconectar", coesao: 100, explicacao: "O processo continua durante a queda e confere os dados antes de sincronizar.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "", custo: 12, treinamento: 80 },
                    { texto: "Reenviar manualmente cada pedido depois da queda", coesao: 60, explicacao: "Recupera parte da operacao, mas ainda permite registros duplicados.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "", custo: 6, treinamento: 45 },
                    { texto: "Desligar a integracao durante o horario de pico", coesao: 30, explicacao: "Evita alguns erros de comunicacao, mas separa novamente os sistemas.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "", custo: 3, treinamento: 20 },
                    { texto: "Ignorar os avisos e continuar repetindo os registros", coesao: 10, explicacao: "A causa permanece e os dados duplicados se acumulam.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "", custo: 1, treinamento: 0 }
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
                nome: "Pedidos acumulados entre caixa e cozinha",
        empresa: "Lanchonete",
        opcoes: [
                        { texto: "Integrar caixa, cozinha e estoque numa fila compartilhada", coesao: 100,
                            explicacao: "O pedido chega uma vez a todas as etapas. A simulacao reduz espera e retrabalho, com maior custo inicial.",
                            sprite_resultado: "spr_sol_autoatendimento", dialogo_bronca: "", demite: false, acao_especial: "cliente_autoatendimento", custo: 24, treinamento: 65 },
                        { texto: "Padronizar o registro manual e conferir cada pedido", coesao: 65,
                            explicacao: "Custa menos e reduz erros, mas a equipe ainda precisa transferir as informacoes manualmente.",
                            sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "", custo: 10, treinamento: 80 },
                        { texto: "Adicionar outro caixa sem mudar o fluxo da cozinha", coesao: 40,
                            explicacao: "Aumenta a capacidade de pagamento, mas os pedidos ainda podem acumular antes do preparo.",
                            sprite_resultado: "spr_sol_contratar", dialogo_bronca: "", demite: false, acao_especial: "", custo: 20, treinamento: 35 }
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

case "faltaSoro":
        return {
                nome: "Falta de soro em uma ala",
                empresa: "Hospital",
                opcoes: [
                        { texto: "Conferir o estoque por ala e registrar cada remanejamento", coesao: 100,
                            explicacao: "A equipe consulta o mesmo registro e sabe o que esta disponivel em cada ala, sem depender de informacoes fragmentadas.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "" },
                        { texto: "Contar as caixas numa planilha no fim do turno", coesao: 60,
                            explicacao: "Ajuda a enxergar o estoque, mas a informação chega tarde e depende de atualização manual.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "" },
                        { texto: "Dividir o estoque igualmente entre todas as alas", coesao: 30,
                            explicacao: "Parece justo, mas ignora diferenças de demanda e prescrições entre as equipes.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "" },
                        { texto: "Esperar o próximo pedido do fornecedor sem avisar as equipes", coesao: 10,
                            explicacao: "A falta continua invisível e cada ala só descobre quando precisa do material.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "" }
                ]
        };

case "rastreio_soro":
        return {
                nome: "Lotes e validade sem rastreamento",
                empresa: "Hospital",
                opcoes: [
                        { texto: "Registrar lote, validade, consumo e ala num sistema compartilhado com alertas", coesao: 100,
                            explicacao: "As equipes veem o mesmo estoque, encontram primeiro os lotes que vencem e repõem antes da ruptura.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "" },
                        { texto: "Etiquetar as caixas e conferir tudo manualmente uma vez por semana", coesao: 60,
                            explicacao: "Melhora a identificação, mas o intervalo entre conferências ainda esconde mudanças urgentes.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "" },
                        { texto: "Comprar mais caixas para garantir que nunca falte", coesao: 30,
                            explicacao: "Aumenta o volume sem melhorar o controle e pode deixar material parado até vencer.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "" },
                        { texto: "Só atualizar o estoque quando uma caixa acabar", coesao: 10,
                            explicacao: "O alerta chega tarde demais: a equipe só descobre o problema na hora de usar o material.", sprite_resultado: noone, dialogo_bronca: "", demite: false, acao_especial: "" }
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

function get_evidencia_texto(_id_problema, _ferramenta) {
    switch (_id_problema) {
        case "Caixa":
            return (_ferramenta == "scanner")
                ? "Scanner: o caixa perde comunicacao com o pinpad e a impressora."
                : "Lupa: o cabo de dados esta frouxo; reiniciar mascara a causa.";
        case "freezer":
            return (_ferramenta == "scanner")
                ? "Scanner: a temperatura sobe mesmo com o freezer ligado."
                : "Lupa: a vedacao esta comprometida e ha insumos descongelando.";
        case "lentidao_cozinha":
            return (_ferramenta == "scanner")
                ? "Scanner: pedidos acumulam entre preparo e entrega."
                : "Lupa: equipamentos e tarefas ficam concentrados na mesma bancada.";
        case "faltaSoro":
            return (_ferramenta == "scanner")
                ? "Scanner: uma ala esta sem soro enquanto outras mantem estoque."
                : "Lupa: as transferencias entre alas nao deixam registro comum.";
        case "rastreio_soro":
            return (_ferramenta == "scanner")
                ? "Scanner: o estoque nao sinaliza lotes proximos do vencimento."
                : "Lupa: caixas iguais de lotes diferentes estao misturadas.";
        case "lanchonete_fila":
            return (_ferramenta == "scanner")
                ? "Scanner: o caixa processa pedidos mais devagar que a chegada."
                : "Lupa: pedidos e disponibilidade do estoque sao conferidos separados.";
        case "falha_conexao":
            return (_ferramenta == "scanner")
                ? "Scanner: a comunicacao entre as etapas cai durante os picos."
                : "Lupa: a equipe repete registros quando a conexao retorna.";
    }

    return (_ferramenta == "scanner")
        ? "Scanner: ha um gargalo recorrente no processo."
        : "Lupa: etapas e registros nao estao sincronizados.";
}

function get_diagnostico_data(_id_problema) {
    switch (_id_problema) {
        case "Caixa":
            return {
                pergunta: "Qual causa explica melhor as pistas?",
                opcoes: [
                    "Cabo de dados e comunicacao com Pinpad/impressora falham.",
                    "O caixa precisa ser substituido por um modelo novo.",
                    "A equipe do salao esta atendendo poucos clientes."
                ],
                indice_correto: 0
            };
        case "freezer":
            return {
                pergunta: "Qual causa explica melhor as pistas?",
                opcoes: [
                    "A vedacao e o controle de temperatura falharam.",
                    "A equipe esta preparando pedidos devagar.",
                    "O estoque esta sendo atualizado tarde."
                ],
                indice_correto: 0
            };
        case "lentidao_cozinha":
            return {
                pergunta: "Qual causa explica melhor as pistas?",
                opcoes: [
                    "As etapas e os equipamentos estao mal distribuidos.",
                    "O estoque do hospital esta desatualizado.",
                    "O caixa precisa de mais uma maquina de pagamento."
                ],
                indice_correto: 0
            };
        case "faltaSoro":
            return {
                pergunta: "Qual causa explica melhor as pistas?",
                opcoes: [
                    "Os registros fragmentados escondem o estoque disponivel por ala.",
                    "Todas as alas precisam receber a mesma quantidade.",
                    "O hospital precisa apenas comprar mais materiais."
                ],
                indice_correto: 0
            };
        case "rastreio_soro":
            return {
                pergunta: "Qual causa explica melhor as pistas?",
                opcoes: [
                    "Lotes e validade nao sao rastreados num registro comum.",
                    "As equipes precisam guardar caixas em mais lugares.",
                    "O consumo so precisa ser contado no fim do mes."
                ],
                indice_correto: 0
            };
        case "falha_conexao":
            return {
                pergunta: "Qual causa explica melhor as pistas?",
                opcoes: [
                    "A queda nao tem fila local nem validacao ao reconectar.",
                    "O estoque fisico esta baixo.",
                    "A equipe precisa repetir todos os pedidos manualmente."
                ],
                indice_correto: 0
            };
    }

    return {
        pergunta: "Qual causa explica melhor as pistas?",
        opcoes: [
            "As etapas do processo nao compartilham os mesmos registros.",
            "E preciso apenas adicionar mais equipamentos.",
            "O problema vai desaparecer sem uma mudanca."
        ],
        indice_correto: 0
    };
}

function evidencia_coletada(_id_problema, _ferramenta) {
    if (!variable_global_exists("evidencias_coletadas")) global.evidencias_coletadas = [];

    for (var i = 0; i < array_length(global.evidencias_coletadas); i++) {
        var _evidencia = global.evidencias_coletadas[i];
        if (_evidencia.sala == room && _evidencia.problema == _id_problema && _evidencia.fonte == _ferramenta) {
            return true;
        }
    }

    return false;
}

function registrar_evidencia(_id_problema, _ferramenta) {
    if (evidencia_coletada(_id_problema, _ferramenta)) return false;

    array_push(global.evidencias_coletadas, {
        sala: room,
        problema: _id_problema,
        fonte: _ferramenta
    });
    return true;
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

function simular_operacao(_eficiencia, _confiabilidade, _integracao, _id_problema) {
    if (_id_problema == "faltaSoro" || _id_problema == "rastreio_soro") {
        var _tempo_busca = max(1, 12 - floor(_eficiencia / 15) - floor(_integracao / 30));
        var _divergencias = max(0, 6 - floor(_confiabilidade / 25) - floor(_integracao / 35));
        return {
            fila_inicial: _tempo_busca,
            fila_final: _tempo_busca,
            processados: max(0, 12 - _tempo_busca),
            falhas: _divergencias
        };
    }

    var _chegadas = [4, 8, 5];
    var _fila = 12;
    var _fila_inicial = _fila;
    var _processados = 0;
    var _falhas = 0;
    var _capacidade = max(1, floor(_eficiencia / 25) + 1);
    var _falhas_turno = floor((100 - _confiabilidade) / 40);

    for (var i = 0; i < array_length(_chegadas); i++) {
        _fila += _chegadas[i];
        var _feito = max(0, _capacidade - _falhas_turno);
        _feito = min(_feito, _fila);
        _fila -= _feito;
        _processados += _feito;
        _falhas += _falhas_turno;
    }

    _fila = max(0, _fila - floor(_integracao / 50));
    return {
        fila_inicial: _fila_inicial,
        fila_final: _fila,
        processados: _processados,
        falhas: _falhas
    };
}

function atualizar_especializacoes() {
    var _media = (global.coesao_count > 0) ? global.coesao_total / global.coesao_count : 0;
    if (!global.pericia_integracao && global.coesao_count >= 2 && _media >= 70) {
        global.pericia_integracao = true;
    }
    if (!global.pericia_operacao && global.coesao_count >= 4 && _media >= 60) {
        global.pericia_operacao = true;
    }
}
//
/// resolve_problem(_problema, _indice_opcao)
/// coloca a escolha, atualiza os globais, e devolve uma estruturazinha c os dados
// fiz isso pq a tela precisava de um problema alvo, nisso iria bugar tudo e o tablet iria fechar, quebrei cabeça mais deu
function resolve_problem(_problema, _indice_opcao, _etapas_fluxo, _diagnostico_correto) {
    var _opcoes = _problema.problem_data.opcoes;

    if (_indice_opcao < 0 || _indice_opcao >= array_length(_opcoes)) {
        show_debug_message("ERRO: indice de opcao invalido em resolve_problem");
        return undefined;
    }

    var _opcao = _opcoes[_indice_opcao];
    var _coesao_solucao = _opcao.coesao;
    var _etapas_escolhidas = (array_length(_etapas_fluxo) == 4) ? _etapas_fluxo : [0, 0, 0, 0];
    var _soma_etapas = 0;
    for (var _i = 0; _i < array_length(_etapas_escolhidas); _i++) {
        _soma_etapas += clamp(_etapas_escolhidas[_i], 0, 2);
    }
    var _nota_fluxo = round((_soma_etapas / 8) * 100);
    var _desconto_diagnostico = _diagnostico_correto ? 0 : 20;
    var _coesao = max(0, round((_coesao_solucao * 0.7) + (_nota_fluxo * 0.3)) - _desconto_diagnostico);
    var _custo = variable_struct_exists(_opcao, "custo")
        ? _opcao.custo
        : max(1, 20 - floor(_coesao_solucao / 8));
    if (global.pericia_operacao) _custo = max(0, _custo - 2);
    var _treinamento = variable_struct_exists(_opcao, "treinamento")
        ? _opcao.treinamento
        : clamp(round((_coesao_solucao + _nota_fluxo) / 2), 0, 100);
    var _resistencia = variable_struct_exists(_problema.problem_data, "resistencia_equipe")
        ? _problema.problem_data.resistencia_equipe
        : 45;
    var _bonus_integracao = global.pericia_integracao ? 10 : 0;
    var _eficiencia = clamp(round(_coesao * 0.55 + _nota_fluxo * 0.45), 0, 100);
    var _confiabilidade = clamp(round(_coesao * 0.55 + _etapas_escolhidas[2] * 12.5 + _treinamento * 0.15 - max(0, _resistencia - _treinamento) * 0.25), 0, 100);
    var _integracao = clamp(round(_coesao * 0.45 + (_soma_etapas / 8) * 55 + _bonus_integracao), 0, 100);
    var _sim_antes = simular_operacao(global.ind_eficiencia, global.ind_confiabilidade, global.ind_integracao, _problema.problem_id);
    var _evento = "";
    var _moedas_ganhas = _coesao div 10;
    var _tempo_delta = 0;

    if (_coesao >= 50) _tempo_delta = 0;
    else if (_coesao >= 20) _tempo_delta = -10;
    else _tempo_delta = -20;
	
	  if (_tempo_delta != 0) {
      global.tempo_flash_t = 90;
      global.tempo_flash_txt = (_tempo_delta > 0 ? "+" : "") + string(_tempo_delta) + "s";
      global.tempo_flash_cor = (_tempo_delta > 0) ? c_lime : c_red;
  }

    if (global.timer_ativo) {
        var _tempo_anterior = global.tempo_restante;
        global.tempo_restante = clamp(global.tempo_restante + _tempo_delta, 0, 600);
		if (_tempo_delta < 0) {
        global.tempo_flash_t = 90;
		global.tempo_flash_txt = string(_tempo_delta) + "s"; 
    }
        _tempo_delta = global.tempo_restante - _tempo_anterior;
    }

    var _orcamento_antes = global.orcamento;
    var _divida_gerada = max(0, _custo - _orcamento_antes);
    global.orcamento = max(0, _orcamento_antes - _custo);
    global.divida_tecnica += _divida_gerada;

    var _eficiencia_antes = global.ind_eficiencia;
    var _confiabilidade_antes = global.ind_confiabilidade;
    var _integracao_antes = global.ind_integracao;
    global.ind_eficiencia = clamp(round(_eficiencia_antes + (_eficiencia - _eficiencia_antes) * 0.25), 0, 100);
    global.ind_confiabilidade = clamp(round(_confiabilidade_antes + (_confiabilidade - _confiabilidade_antes) * 0.25), 0, 100);
    global.ind_integracao = clamp(round(_integracao_antes + (_integracao - _integracao_antes) * 0.25), 0, 100);
    var _sim_depois = simular_operacao(global.ind_eficiencia, global.ind_confiabilidade, global.ind_integracao, _problema.problem_id);

    global.coesao_total += _coesao;
    global.coesao_count += 1;
    atualizar_especializacoes();
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

    if (_problema.problem_id != "falha_conexao" && _confiabilidade < 35 && !global.falha_gerada_missao) {
        global.falha_gerada_missao = true;
        global.evento_operacional = "Uma queda de conexao gerou registros duplicados. Investigue o novo problema.";
        _evento = global.evento_operacional;
        array_push(global.historico_eventos, {
            sala: room,
            texto: global.evento_operacional
        });
        var _falha = instance_create_depth(_problema.x + 32, _problema.y, _problema.depth, obj_problema);
        with (_falha) setup_problem("falha_conexao");
    }

    if (array_length(global.relatorios_missao) == 0) {
        global.metricas_missao_antes = {
            eficiencia: _eficiencia_antes,
            confiabilidade: _confiabilidade_antes,
            integracao: _integracao_antes
        };
    }
    array_push(global.relatorios_missao, {
        problema: _problema.problem_data.nome,
        coesao: _coesao,
        custo: _custo,
        evento: _evento
    });
    _problema.coesao_resolucao = _coesao;
    _problema.is_solved = true;

    return {
        nome_problema: _problema.problem_data.nome,
        coesao: _coesao,
        coesao_resposta: _coesao_solucao,
        diagnostico_correto: _diagnostico_correto,
        moedas_ganhas: _moedas_ganhas,
        tempo_delta: _tempo_delta,
        explicacao: _opcao.explicacao,
        custo: _custo,
        orcamento: global.orcamento,
        divida_gerada: _divida_gerada,
        treinamento: _treinamento,
        resistencia: _resistencia,
        eficiencia_antes: _eficiencia_antes,
        eficiencia_depois: global.ind_eficiencia,
        confiabilidade_antes: _confiabilidade_antes,
        confiabilidade_depois: global.ind_confiabilidade,
        integracao_antes: _integracao_antes,
        integracao_depois: global.ind_integracao,
        fila_antes: _sim_antes.fila_final,
        fila_depois: _sim_depois.fila_final,
        processados_antes: _sim_antes.processados,
        processados_depois: _sim_depois.processados,
        falhas_antes: _sim_antes.falhas,
        falhas_depois: _sim_depois.falhas,
        evento: _evento,
        pericia_integracao: global.pericia_integracao,
        pericia_operacao: global.pericia_operacao,
        fluxo: _etapas_escolhidas
    };
}