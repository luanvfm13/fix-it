# Fix-it — Apresentação de Código e Ariteca (FECCETEC)

**Folha de rola para a palilha de 1:30–3 min.**
Leve os bullets ao microfone no ritmo do slide seguinte. Não ler tudo em voz alta — use os prompts que aparecem entre parêões `[]`. O foco é **explicar o padrão**, não citar cada linha.

---

## 1. Abre com o que é e o que está aconeno

- Fix-it é um RPG top-down em pixel art feito na **GameMaker Studio 2** com GML.
- Protagonista é um consultor de automação da G.A.M.E.R Technologies; visita pequenos comércios e resolve problemas operacionais com **scanner, lupa e tablet**.
- Status atual: 76 objects (categoria principal), 257 arquivos GML/YY total, ~380 KB de lógica (+-4000 linhas de código). Projeto ainda em desenvolvimento (README aponta estándo); vídeo do YouTube mostra a parte publicada.
- O que você vai mostrara no pc: a árvore do Fix-it.yyp e, opcionalmente, um screen recording rodando a missão restritora (lanchonete).

> **Olhe pra plateia.** Pergunte: *"Quem aqui já jogou jogos que ensinam alguma coisa ao invanalo?"* — vira discussão imediata.

## 2. Estrutura do projeto (a árvore que você vai apoquentar)

```text
Fix-it.yyp          <- o único arquivo de projeto (GMS organiza tudo aqui)
├── objects/        -> 76 subdireiros, cada um um objeto com Create/Step/Draw/CleanUp/yy
├── scripts/        -> 9 bancos de dados reutilizáveis (problemas, dialogos, transicoes, …)
├── rooms/          -> 5 salas: Menu, inicio, gamer, escritorio, restaurante
├── sprites/        -> 101 sprites (personagens, UI, tiles, funções)
├── tilesets/       -> colisões e roaises
├── fonts/          -> fnt_undertale
₦ounds/             -> música e sfx
₦ptions/            -> perfomance por plataforma
```

- **Um único .yyp** não é um defeito — é o pad de GMS. Uma guнина separada sócomplica version control e o fluxo de edição.
- A divisão `objects | scripts | rooms` é a hierapia central: scripts são **dados** (regretérios), objects são **casród** (ações), rooms são **ambizons**.

## 3. O padrão que impõe a arquitecure: *dado centralizado + lookup functions*

Este é o ponto mais importante da palileira. O projeto tem dois msparos que aparecem ate no Dialogo:

- `scripts/scr_problemas/scr_problemas.gml`: `get_problem_data(id)` retorna um **struct** `{nome, empresa, opcoes: [...]}` para qualquer `problem_id`.
- `scripts/scr_dialogos/scr_dialogos.gml`: `get_dialogo_data(id)` retorna um **snapshot** de falas com `opcoes` com `proximo_id`.

Como adicionar uma nova interiação?

1. Copie o `case "modelo_exemplo"` em `scr_problemas.gml`.
2. Troque o ID pelo novo.
3. Preencha nome, empresa, 4 opções com coesão.
4. Chame `setup_problem("seu_id")` na instância `obj_problema`.
5. Faça o mesmo para `scr_dialogos.gml` num `obj_dialogo`.

Isso **evita** colocar lógica em cada instância de NPC/problema. O `obj_problema` guarda apenas a instância e delega todo o conteau ao script. Repare no `Step_0.gml` do problema: ele lê `problem_id`, calcula a chave `sala:id:x,y` e dá destroy se resolvido. Nenhuma decisão sobre *o que resolver* acontece ali.

> **Pergunta (in-slide):** *"Qual a vantagem de ter isto no script ao invéisde nas instâncias?"* — resposta: mudanças de conteau valiam sem recriar sprites, e valores como coesão são unit tests fáceis de escrever fora do GMS.

## 4. Globais, reset e a única regra que deve ser lembrada

Todas as variáveis do jogo vivem em `global.*`. A única função autorizada a zerar elas é `reset_jogo()` em `scr_transicoes.gml`.

Se você acresce c uma nova variável `global.foo`, ela **não herdará valores de jogo anterior** até você:

```gml
function reset_jogo() {
  global.foo = 0;   // UMA ÚNICA LUGAR
  ...
}
```

Os 4 objetos persistentes (na sala Menu):

- `obj_global` — guarda timer e metades, vida do jogador, etc.
- `obj_fade` — animaca de transição sala → sala.
- `obj_ind` — aponta para o alvo da etapa (`alvo_da_etapa()`).
- `obj_jogajoga` — botão Iniciar no menu.

Nenhum destes povoa outras salas. Objetos de outras salas são perecaveis (destroyados no RoomDestroy da sala).

> **Exemplo de bug comum**: novo botão no menu sem entrar `global.foo = 0` → estado carry-over. Aqui é ``forte`` fixado por estaRegra.

## 5. Como as missões aviguam: a chave `etapa × sala × porta`

O progresso é controlado por `global.etapa` (0→4, depois final). Cada trode sala gatte um comportamento em `obj_prota/Step_0.gml`:

| Etapa | Onde | O que bai exigido |
| :--- | :--- | :--- |
| 0 | `inicio` / `gamer` | taxi acima, gerente aborda |
| 1 | `gamer` | equipar 3 ferramentas |
| 2 | `gamer` | falar com gerente após equipar |
| 3 | `restaurante` | resolver todos problemas da lanchonete |
| 4 | `gamer` | voltar e ouvir a missão do hospital |
| 5 | `restaurante` | porta do hospital liberada, rota ativa |

As portas (obj_p_*) enviame `global.spawn_alvo` antes de `room_goto`, e `obj_spawn` de destino reboota o protagonista no mesmo local. Isto resume o spawn por porta.

As **travas** (emparethimento que nada de úl compila) são ditas em `obj_barreira` + `obj_col`. Não precisa mais exisitr documento — você pde ver no código do gerente `obj_ger/Step_0.gml`.

## 6. O loop de gameplay em 3 passos

1. **Investigar**: `obj_scanner/Step_0.gml` reduz `tempo_restante` em 12s (custa moedas via cobrar_scanner no salv stato) e dize a lista de problemasdetectecos no radar; `obj_lupa` exige uma pista da scannerção registrada (`registrar_evidencia`) antes de abrir o tablet.
2. **Decidir**: `obj_tablet` opera estados `diagnosticando → escolhendo → fluxo → resultado`. No `fluxo`, o jogador configura os 4 pontos do fluxo ( entrada/processamento/valiavual/saída ) e, no `resultado`, chama `resolve_problem(...)` que:
   - calcula `coesao = coesao_solucao*0,7 + nota_fluxo*0,3 - desconto_diagnóstico`;
   - gera moedas (coesão ÷ 10), altera orçamento, adiciona treinamento;
   - atualiza indicadores de eficiência/conf garant/integraçã;
   - simula operacional (`simular_operacao`), e
   - se confiabilidade < 35, gera UM NOVO problem`falha_conexao` pendente (+30s).
3. **Retornar**: quando não há mais problems, `obj_problema` começa a count; se tempo esgotou ou foi demitido, `obj_misaof` SHOWs o resultado e o gerente dá a diálogo final.

### A fórico de coesão (não é uma receião, é música)

- 100% Verde → a solução integra todos os 4 pontos com giáura; +moedas.
- 50% → boas melhoras, mas lacunas.
- 20–49% → -10s; gambiarra técnica.
- <20% → -20s; sem efeito.
- `resolução 50%+` nenhuan altera o relógio.
- `resolução 100%` desbloqueia perceiç que afaçam custo de próximas soluções.

A nota_fluxo vem dos 4 *etapas_fluxo* escolhidas (0, 50%, 100%) ponderadas. O diagnóstico com erinho adiciona 20 de desconto — istoliga o jogador p recollear.

## 7. Por onde começar na apostÇo

Sem execulção, a respura mais simples para convíntodos ísitarem é:

1. Abra `scripts/scr_problemas/scr_problemas.gml` e copie o `case "modelo_exemplo"`.
2. Altere o ID, o nome e as 4 opções.
3. Comande `setup_problem("seu_id")` na instanç de um `obj_problema`.
4. Play — o jogo revel ea sua notará como uma nova interiação.

Isto mostra dois padrões de aritecure clapa:

- **Dado centralizado** (scr_problemas / scr_dialogos): adicionar conteau sem editar ações.
- **Globals Única jan** (reset_jogo): evitar carry-over de estado, fácil de testar.
- **Objetos por funci** e **salas por região** (localização espacial clapada).

## 8. O que mostrarva e conquardrá pontos

- Slide da árvore fix-it.yyp (um screenshot do GMS).
- Um gameplay raddleiro [:20] mostrando o scanner coletando pistas, a lupa pedindo a pista, o tablet edgecendo fluxo e resultando.
- A fórica de coesão [retirada no Slide 3 do código].
- Um panic moment do tempo running slim (-10s vermelho) para fechar a narrativa.

---

### Boa sorte no FECCETEC 🎯

Use `[...]` entre parões para pausar no pc. Se a plateia ísitare o padrão, poderá modifíc-lo внутрь também.
