Visão Geral

O Fix-it é um jogo educacional em desenvolvimento utilizando a engine GameMaker e a linguagem GML Code. O projeto é um RPG top-down pixel art onde o jogador atua como consultor de automação, visitando quatro empresas distintas (Lanchonete, Mecânica, Hospital e Indústria) para diagnosticar e resolver problemas operacionais através de soluções tecnológicas conectadas.

O foco é aplicar conceitos de lógica de programação, estruturas de dados e game design, criando uma experiência educativa que conecta inovação tecnológica com transformação de negócios locais.
As Quatro Empresas
Empresa  	Dificuldade	         Problemas	                                                   
Lanchonete	Fácil	      Fila no caixa, equipamento quebrado, armazenamento	            
Mecânica 	Médio	      Gestão de estoque, manutenção de equipamentos	         
Hospital 	Desafiador 	Insumos críticos, emergências, comunicação interdepartamental	
Indústria 	Complexo   	Produção em linha, segurança operacional, eficiência de recursos	

Funcionalidades Implementadas:

Movimentação fluida do protagonista (8 direções) com animações de idle e movimento
Sistema de colisão baseado em tilemap
Lupa: ferramenta de interação proximal (20px) que detecta e inspeciona problemas próximos
Scanner: mecânica de varredura com pulse visual, detecta problemas em raio de 150px, custa moedas (ativado com R)
Sistema de Diagnóstico: UI navegável com 4 opções de solução por problema, entrada via teclado (↑↓ para navegar, E/Enter para confirmar)

Sistema de Dados Centralizado:

scr_problemas.gml: armazena dados de todos os problemas em switch statement com get_problem_data(_id) e setup_problem(_id)
Estrutura de dados: nome, empresa, 4 opções com texto e valor de coesão (0–100%)
Suporta fácil adição de novos problemas sem duplicar objetos

Mecânica de Coesão:

Toda solução que você escolhe recebe uma pontuação de 0–100% em "Coesão de Automação":

100% (Verde): Solução integrada, sistemas comunicam-se, eficiência máxima
50%: Solução parcial, melhoria notável mas incompleta
10–30%: Gambiarra, melhoria mínima, débito técnico criado
0%: Sem efeito ou piora a situação

Esta mecânica ensina que tecnologia isolada é inútil a qualidade da integração determina o impacto real.
Rastreamento global de moedas (global.moedas) e coesão (global.coesao_total, global.coesao_count)
Cada solução escolhida gera: moedas (coesão ÷ 10) + incremento na métrica global
HUD em tempo real mostra feedback ao resolver problemas

Estrutura do Projeto:
Fix-it/
├── Fix-it.yyp                    # Arquivo principal
├── objects/
│   ├── obj_prota/                # Protagonista (movimento, lupa)
│   ├── obj_scanner/              # Scanner com pulse visual
│   ├── obj_lupa/                 # Detector proximal
│   ├── obj_diagnostico/          # UI de escolha de soluções
│   ├── obj_problema/             # Instância de problema
│   ├── obj_porta/                # Transição entre salas
│   ├── obj_men/                  # HUD de mensagens
│   ├── obj_npc1/                 # NPC com diálogo
│   ├── obj_dialog/               # Caixa de diálogo
│   ├── obj_global/               # Singleton para globals terem uma única instância
│   └── obj_col/                  # Colisões (camada auxiliar)
├── scripts/
│   └── scr_problemas.gml         # Banco de dados de problemas
├── rooms/
│   ├── Room1/                    # Lanchonete (primária)
│   ├── Room2/                    # Lanchonete (interior)
│   ├── gamer/                    # Hub - Escritório G.A.M.E.R
│   └── Hosp/                     # Hospital
├── sprites/
│   ├── spr_prota_*.yy            # Animações do protagonista
│   ├── LUNCH_bg, GAMER_bg, spr_hosp  # Backgrounds
│   ├── lupa, spr_tablet          # Ferramentas visuais
│   ├── Sprite33, spr_caixadedealogo  # NPCs
│   └── (várias decorações)
├── tilesets/
│   ├── LUNCH_tiles, GAMER_tiles, tiles_hosp  # Colisões e visuals
│   └── tile_col                  # Tilemap de colisão
├── options/                      # Configurações por plataforma
└── .gitignore, .gitattributes    # Controle de versão

Controles Padrão:
Ação	            Entrada
Mover	          WASD ou Setas
Interagir       (Lupa/NPC)	E
Ativar Scanner	   Tecla R
Navegar Menu	     ↑↓
Confirmar	     E ou Enter
Sair (debug)	        Esc


Tecnologias Utilizadas
GameMaker Studio 2 (versão 2026+)
GML (GameMaker Language) para lógica completa
GitHub (yakuza7coder/fix-it) com feature branches
Pixel Art (sprites 16–1024px)
Pré-requisitos
GameMaker Studio 2 (2026+) instalado
Git para controle de versão
Conexão com github.com/yakuza7coder/fix-it


Como Executar o Projeto
Clone o repositório:
bash
   git clone https://github.com/yakuza7coder/fix-it.git
Abra GameMaker Studio 2.
Clique em "Abrir" e navegue até a pasta clonada.
Selecione Fix-it.yyp.
Pressione F5 (ou clique em Play) para rodar o jogo.
