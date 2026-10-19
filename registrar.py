#!/usr/bin/env python3
"""
Registra no Fix-it.yyp os objetos e sprites que estão em disco mas não
aparecem na IDE do GameMaker.

Como usar:
  1. Copie este arquivo para a pasta raiz do projeto (onde está o Fix-it.yyp).
  2. No terminal, dentro dessa pasta, rode:  python registrar.py
  3. Abra o projeto na IDE.

O script faz backup do .yyp (Fix-it.yyp.bak) antes de alterar qualquer coisa.
Pode rodar mais de uma vez: o que já estiver registrado é pulado.
"""
import os
import shutil
import sys

YYP = "Fix-it.yyp"

# Objetos que estão em objects/ mas não estão no .yyp.
# Não incluí obj_token (duplicata não usada do obj_toten) nem os obj_gerente_*
# (o fim de jogo agora usa sprites, não esses objetos).
OBJETOS = [
    "obj_dona_deolane",
    "obj_emerson",
    "obj_fluvio",
    "obj_lavio",
    "obj_leandra",
    "obj_loucoquevaifalarcoisas",
    "obj_marcelo",
    "obj_nelipefeto",
    "obj_npc1costas",
    "obj_npc2costas",
    "obj_npc3costas",
    "obj_npc4costas",
    "obj_npc5costas",
    "obj_npc6costas",
    "obj_npc7costas",
    "obj_npc8costas",
    "obj_npc9costas",
    "obj_qporra",
    "obj_sidney",
    "obj_threepacsentadolado",
    "obj_tonyjark",
]

# Sprites usados nas soluções (scr_problemas) que não estão registrados.
SPRITES = [
    "spr_sol_contratar",
    "spr_sol_totemsenha",
]


def linha_resource(tipo, nome, nl):
    # Formato igual ao usado pelo próprio GameMaker dentro de "resources"
    return '    {"id":{"name":"%s","path":"%s/%s/%s.yy",},},%s' % (
        nome, tipo, nome, nome, nl)


def main():
    if not os.path.isfile(YYP):
        print("ERRO: %s não encontrado. Rode o script na pasta raiz do projeto." % YYP)
        sys.exit(1)

    with open(YYP, encoding="utf-8", newline="") as f:
        s = f.read()

    # Mantém o mesmo tipo de quebra de linha que o arquivo já usa
    nl = "\r\n" if "\r\n" in s else "\n"

    idx = s.find('"resources":[')
    if idx < 0:
        print('ERRO: bloco "resources" não encontrado no %s.' % YYP)
        sys.exit(1)

    # Insere logo depois da linha que abre "resources":[
    pos = s.find("\n", idx) + 1

    novas = []
    ja_estavam = []
    faltando = []

    candidatos = [("objects", n) for n in OBJETOS] + [("sprites", n) for n in SPRITES]
    for tipo, nome in candidatos:
        caminho_yy = "%s/%s/%s.yy" % (tipo, nome, nome)
        ref = '"path":"%s"' % caminho_yy

        if ref in s:
            ja_estavam.append(nome)
            continue
        if not os.path.isfile(caminho_yy):
            faltando.append(caminho_yy)
            continue
        novas.append(linha_resource(tipo, nome, nl))

    if novas:
        # Backup só quando de fato vai alterar
        shutil.copy2(YYP, YYP + ".bak")
        s = s[:pos] + "".join(novas) + s[pos:]
        with open(YYP, "w", encoding="utf-8", newline="") as f:
            f.write(s)

    print("Registrados agora: %d" % len(novas))
    for n in novas:
        print("  + " + n.strip())
    if ja_estavam:
        print("Já estavam registrados (pulados): %d" % len(ja_estavam))
    if faltando:
        print("ATENÇÃO, arquivos não encontrados (não registrados):")
        for c in faltando:
            print("  ! " + c)
    if novas:
        print("\nBackup salvo em %s.bak. Abra o projeto na IDE." % YYP)
    else:
        print("\nNada a alterar.")


if __name__ == "__main__":
    main()