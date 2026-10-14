# Fix-it

> **Status do Projeto:** Em Desenvolvimento

## Visão Geral

O **Fix-it** é um jogo educacional em desenvolvimento na engine GameMaker, com GML. É um RPG top-down em pixel art onde o jogador é um consultor de automação da **G.A.M.E.R Technologies**. Ele visita pequenos comércios para diagnosticar problemas operacionais e aplicar soluções tecnológicas.

O foco é aplicar lógica de programação, estruturas de dados e game design, conectando inovação tecnológica com a transformação de negócios locais.

---

## As Empresas

| Empresa | Estado | Problemas Principais |
| :--- | :--- | :--- |
| **Lanchonete** | Implementada (missão 1) | Caixa travado, fila no caixa, freezer, cozinha lenta |
| **Hospital** | Implementado (missão 2) | Falta de soro, rastreio de insumos |

---

## Funcionalidades Implementadas

* **Movimentação:** 8 direções com animações de idle e movimento. Diagonal normalizada e Shift para correr.
* **Colisão:** Sistema sólido baseado em tilemap.
* **Táxi de abertura:** O carro desce a avenida, deixa o protagonista e vai embora. A cutscene acontece uma vez por jogo.
* **Gerente:** Aborda o jogador ao chegar à G.A.M.E.R, conduz a recepção, dá a despedida e a missão do hospital.
* **Lupa:** Interação proximal com problemas.
* **Investigação por evidências:** O scanner revela o sintoma e a lupa registra uma observação. O tablet só abre o diagnóstico depois da varredura e apresenta as duas pistas.
* **Scanner:** Varredura com radar animado. Cada uso desconta 12 s do relógio; não custa moedas.
* **Diagnóstico e fluxo (tablet):** Com as pistas, o jogador escolhe uma hipótese antes da solução e configura entrada, processamento, validação e saída. Um diagnóstico incompatível reduz a coesão.
* **Simulação operacional:** Restaurante compara fila, pedidos e retrabalho; hospital compara tempo de busca, itens localizados e divergências de estoque.
* **Campanha mensurável:** Eficiência, confiabilidade, integração, orçamento e dívida técnica persistem entre as missões. Treinamento da equipe afeta a confiabilidade; escolhas frágeis podem gerar uma falha extra para investigar.
* **Especializações:** Bom desempenho desbloqueia bônus de integração e de custo para as próximas intervenções.
* **Tempo total:** O limite de 4 minutos é compartilhado entre restaurante e hospital; sair da missão pausa o relógio, mas não o reinicia.
* **Spawn por porta:** O protagonista nasce perto da porta de onde veio.
* **Rota da avenida:** A linha guia do caminho até o hospital, com aviso quando o jogador se afasta.
* **Sistema de Dados Centralizado:** Problemas em `scr_problemas.gml`, diálogos em `scr_dialogos.gml`.

---

## Mecânica de Coesão

Cada solução escolhida recebe uma pontuação de 0% a 100% de **Coesão de Automação**:

* **100% (Verde):** Solução integrada com as quatro etapas do fluxo configuradas para integração total.
* **50%:** Solução parcial, melhoria notável mas incompleta.
* **10% – 30%:** Gambiarra, melhoria mínima, criação de débito técnico.
* **0%:** Sem efeito ou piora a situação.

Cada escolha gera moedas (coesão dividida por 10) e entra na média de coesão da campanha, que define o final.

### Tempo

* **Acerto (coesão 50% ou mais):** não altera o relógio.
* **Escolha fraca (20% a 49%):** -10 s.
* **Escolha ruim (abaixo de 20%):** -20 s.

O desconto aparece em vermelho embaixo do timer, igual ao custo do scanner.

---

## Fluxo de Jogo

O progresso é controlado pela variável global `global.etapa`, que começa em 0 e é zerada por `reset_jogo()`.

| Etapa | Onde | O que acontece | Avança quando |
| :---: | :--- | :--- | :--- |
| 0 | `inicio` / `gamer` | Táxi leva à G.A.M.E.R. O gerente aborda ao cruzar o gatilho. | O gerente chega ao jogador (recepção) |
| 1 | `gamer` | Porta do escritório liberada. Indicador aponta para ela. | Equipar as três ferramentas |
| 2 | `escritorio` | Equipar scanner, lupa e tablet. A saída fica liberada. | Voltar à gamer e ouvir a despedida (E) |
| 3 | `gamer` | Missão da lanchonete liberada. | Concluir todos os problemas da lanchonete |
| 4 | `gamer` | Volta da missão. A saída da gamer fica bloqueada até falar com o gerente. | E no gerente (missão do hospital) |
| 5 | `inicio` | Porta do hospital liberada. Rota ativa na avenida. | Concluir todos os problemas do hospital |

Depois das duas missões, o gerente dá a fala final e a campanha termina.

### Travas

* **Saída da gamer (etapa 0):** o gerente ainda não falou. Aparece "Não vai falar comigo?…".
* **Saída da gamer (etapa 1 e 2):** falta equipar ou falar sobre a tarefa. Aparece o aviso correspondente.
* **Escritório (etapa 0):** só depois da recepção.
* **Saída do escritório (etapas 0 e 1):** só com as três ferramentas.
* **Lanchonete (etapa < 3):** só depois da despedida.
* **Saída da gamer (etapa 4):** só depois de ouvir a missão do hospital.
* **Hospital (etapa < 5):** só depois da missão do hospital.

### Missões

* **Lanchonete e Hospital:** a missão é concluída quando não resta nenhum problema na sala. Problemas resolvidos ficam resolvidos ao sair e voltar à sala.
* **Final:** ao concluir as duas missões e ouvir a fala final do gerente, a campanha termina.
* **Tempo esgotado:** a missão termina com derrota (fim de jogo, volta ao menu).

---

## Controles Padrão

| Ação | Entrada (Teclado) |
| :--- | :--- |
| **Mover** | WASD ou Setas |
| **Correr** | Shift |
| **Interagir (Lupa, NPC, porta, gerente, equipamento)** | E |
* **Ativar Scanner** | R |
* **Escolher diagnóstico/solução** | ↑ / ↓ |
* **Navegar em diálogos** | W / S |
| **Avançar diálogo** | Espaço / Z |
* **Confirmar diagnóstico/solução** | E ou Enter |
| **Editar etapa do fluxo** | ← / →; E ou Enter confirma cada etapa |
| **Cancelar / voltar** | X ou Esc |

## Avaliação de aprendizagem

O jogo registra escolhas e indicadores para apoiar testes com participantes. Esses dados, por si só, não demonstram melhora de aprendizagem; qualquer conclusão deve vir de uma avaliação apropriada e ser relatada com transparência.

---

## Estrutura do Projeto

```text
Fix-it/
├── Fix-it.yyp                     # Arquivo principal
├── objects/
│   ├── obj_prota/                 # Protagonista (movimento, lupa, ferramentas)
│   ├── obj_uber/                  # Táxi da abertura (cutscene)
│   ├── obj_ger/                   # Gerente (abordagem, diálogos, despedida)
│   ├── obj_gatilho_gerente/       # Gatilho que inicia a abordagem do gerente
│   ├── obj_rota/                  # Linha guia da avenida e aviso de rota
│   ├── obj_ind/                   # Indicador visual da etapa (persistente)
│   ├── obj_hubp/                  # Ponto do equipamento no escritório
│   ├── obj_hub/                   # Painel de equipamento (tela)
│   ├── obj_hubeq/                 # Botão de cada ferramenta
│   ├── obj_scanner/               # Scanner (radar e aparelho de mão)
│   ├── obj_lupa/                  # Detector proximal de problemas
│   ├── obj_problema/              # Instância de problema (persiste os resolvidos)
│   ├── obj_tablet/                # Tela de diagnóstico e resultado
│   ├── obj_spawn/                 # Ponto de nascimento do protagonista após uma porta
│   ├── obj_porta*/ e *_p_*/       # Portas entre salas (gates de etapa e spawn)
│   ├── obj_dialogo/               # Caixa de diálogo
│   ├── obj_dialog/                # Balão "E" de interação
│   ├── obj_men/                   # HUD de mensagens temporárias
│   ├── obj_misaof/                # Tela de resultado (missão, campanha, derrota)
│   ├── obj_global/                # Singleton de variáveis globais e timer
│   ├── obj_fade/                  # Transição entre salas (persistente)
│   ├── obj_npc*/ obj_maura/ etc.  # NPCs e atendentes
│   └── obj_jogajoga/              # Botão de iniciar no menu
├── scripts/
│   ├── scr_problemas/             # Banco de problemas e resolve_problem
│   ├── scr_dialogos/              # Banco de diálogos (get_dialogo_data)
│   ├── scr_transicoes/            # fade_to_room e reset_jogo / cobrar_scanner
│   ├── scr_indicador/             # alvo_da_etapa (para onde o indicador aponta)
│   └── scr_rota/                  # dist_ponto_segmento (geometria da rota)
├── rooms/
│   ├── Menu/                      # Tela inicial (persistentes ficam aqui)
│   ├── inicio/                    # Avenida: táxi, rota e porta do hospital
│   ├── gamer/                     # Hub: escritório do gerente
│   ├── escritorio/                # Equipamento (ferramentas)
│   ├── restaurante/               # Missão 1: lanchonete
│   └── Hosp/                      # Missão 2: hospital
├── sprites/                       # Animações, backgrounds, ferramentas e NPCs
├── tilesets/                      # Colisões e visuais
├── sounds/                        # Música e efeitos
├── fonts/                         # Fonte pixel (fnt_undertale)
├── options/                       # Configurações por plataforma
└── .gitignore, .gitattributes     # Controle de versão
```

---

## Convenções de Desenvolvimento

* **Variáveis globais:** toda variável `global.*` nova precisa entrar em `reset_jogo()` (em `scr_transicoes.gml`), com o valor inicial. Senão, um novo jogo herda o estado anterior.
* **Objetos persistentes:** `obj_global`, `obj_fade`, `obj_ind` e `obj_jogajoga` existem uma única vez, na sala `Menu`. Não colocar cópias nas outras salas.
* **Portas:** a porta envia `global.spawn_alvo` com o nome do spawn de destino antes de trocar de sala. O `obj_spawn` de destino tem o mesmo nome em `spawn_id`. Ao mudar um nome, atualize os dois lados.
* **Diálogos:** cada fala é um case em `get_dialogo_data()`. O nome do falante aparece acima da caixa.
* **Escala e velocidade:** o `obj_prota` calcula `move_spd` a partir da escala da instância na sala, em relação a uma escala de referência.
* **Debug da rota:** `debug_rota` em `obj_rota/Create_0.gml`. Com `true`, a linha aparece em qualquer etapa. Deixar `false` antes do push.
* **Mover problemas no editor:** o identificador de um problema resolvido usa a sala, o `problem_id` e a posição. Reposicionar um problema resolvido faz ele voltar.

---

## Tecnologias Utilizadas

* **GameMaker Studio 2** (Versão 2026+)
* **GML (GameMaker Language)** para controle total da lógica.
* **Git e GitHub** para controle de versão.
* **Artes em Pixel Art** (Sprites de 16px a 1024px).

---

## Pré-requisitos

* **GameMaker Studio 2** (2026+) instalado.
* **Git** instalado para controle de versão.
* Acesso ao repositório no GitHub.

---

## Como Executar o Projeto

1. Clone o repositório utilizando o terminal:
```bash
   git clone https://github.com/yakuza7coder/fix-it.git
```

2. Abra o GameMaker Studio 2 no seu computador.

3. Clique em "Abrir" e navegue até a pasta clonada.

4. Selecione o arquivo `Fix-it.yyp`.

5. Pressione F5 (ou clique em Play) para rodar o jogo. O jogo começa pelo Menu.