# Fix-it

> **Status do Projeto:** Em Desenvolvimento 

## Visão Geral

O **Fix-it** é um jogo educacional em desenvolvimento utilizando a engine GameMaker e a linguagem GML Code. É um RPG top-down em pixel art onde o jogador atua como consultor de automação, visitando quatro empresas distintas para diagnosticar e resolver problemas operacionais por meio de soluções tecnológicas.

O foco é aplicar conceitos de lógica de programação, estruturas de dados e game design, criando uma experiência educativa que conecta inovação tecnológica com a transformação de negócios locais.

---

## As Quatro Empresas

| Empresa | Dificuldade | Problemas Principais |
| :--- | :--- | :--- |
| **Lanchonete** | Fácil | Fila no caixa, equipamento quebrado, armazenamento |
| **Mecânica** | Médio | Gestão de estoque, manutenção de equipamentos |
| **Hospital** | Desafiador | Insumos críticos, emergências, comunicação |
| **Indústria** | Complexo | Produção em linha, segurança operacional, eficiência |

---

## Funcionalidades Implementadas

* **Movimentação:** 8 direções fluidas com animações de idle e movimento para o protagonista.
* **Colisão:** Sistema de colisão sólido baseado em tilemap.
* **Lupa:** Ferramenta de interação proximal (20px) para detectar e inspecionar problemas próximos.
* **Scanner:** Mecânica de varredura com pulso visual que detecta problemas em um raio de 150px (custa moedas).
* **Diagnóstico:** Interface navegável de múltipla escolha com 4 opções de solução por problema.
* **Sistema de Dados Centralizado:** Arquivo `scr_problemas.gml` gerencia todos os dados (nome, empresa, opções e porcentagem de coesão) para facilitar adições sem duplicar objetos.

---

## Mecânica de Coesão

Toda solução escolhida pelo jogador recebe uma pontuação de 0% a 100% de **Coesão de Automação**, ensinando que a qualidade da integração tecnológica determina o impacto real:

* **100% (Verde):** Solução integrada, sistemas comunicam-se, eficiência máxima.
* **50%:** Solução parcial, melhoria notável mas incompleta.
* **10% – 30%:** Gambiarra, melhoria mínima, criação de débito técnico.
* **0%:** Sem efeito ou piora a situação.

Cada solução também gera moedas (calculadas pela coesão dividida por 10) e incrementa a métrica global, com feedback em tempo real no HUD.

---

## Controles Padrão

| Ação | Entrada (Teclado) |
| :--- | :--- |
| **Mover** | WASD ou Setas |
| **Interagir (Lupa/NPC)** | E |
| **Ativar Scanner** | R |
| **Navegar no Menu** | ↑ / ↓ |
| **Confirmar** | E ou Enter |
| **Sair (Debug)** | Esc |

---

## Estrutura do Projeto

```text
Fix-it/
├── Fix-it.yyp                  # Arquivo principal
├── objects/
│   ├── obj_prota/              # Protagonista (movimento, lupa)
│   ├── obj_scanner/            # Scanner com pulse visual
│   ├── obj_lupa/               # Detector proximal
│   ├── obj_diagnostico/        # UI de escolha de soluções
│   ├── obj_problema/           # Instância de problema
│   ├── obj_porta/              # Transição entre salas
│   ├── obj_men/                # HUD de mensagens
│   ├── obj_npc1/               # NPC com diálogo
│   ├── obj_dialog/             # Caixa de diálogo
│   ├── obj_global/             # Singleton de variáveis globais
│   └── obj_col/                # Colisões (camada auxiliar)
├── scripts/
│   └── scr_problemas.gml       # Banco de dados de problemas
├── rooms/
│   ├── Room1/                  # Lanchonete (primária)
│   ├── Room2/                  # Lanchonete (interior)
│   ├── gamer/                  # Hub - Escritório G.A.M.E.R
│   └── Hosp/                   # Hospital
├── sprites/                    # Animações, backgrounds, ferramentas e NPCs
├── tilesets/                   # Colisões e visuais
├── options/                    # Configurações por plataforma
└── .gitignore, .gitattributes  # Controle de versão
```
## Tecnologias Utilizadas

* **GameMaker Studio 2** (Versão 2026+)
* **GML (GameMaker Language)** para controle total da lógica.
* **Git e GitHub** para controle de versão (feature branches).
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
   git clone [https://github.com/yakuza7coder/fix-it.git](https://github.com/yakuza7coder/fix-it.git)

2. Abra o GameMaker Studio 2 no seu computador.

3. Clique na opção "Abrir" e navegue até a pasta clonada.

4. Selecione o arquivo Fix-it.yyp.

5. Pressione a tecla F5 (ou clique em Play) para rodar o jogo 
