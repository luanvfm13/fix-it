switch (estado) {
    case "saindo":
        alpha += velocidade;
        if (alpha >= 1) {
            alpha = 1;
            room_goto(sala_destino);
            estado = "entrando";
        }
        break;

    case "entrando":
        alpha -= velocidade;
        if (alpha <= 0) {
            alpha = 0;
            estado = "idle";
            global.ui_bloqueando_jogo = false;
        }
        break;
}