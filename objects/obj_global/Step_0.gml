if (!global.timer_ativo || global.jogo_acabou) exit;
if (global.ui_bloqueando_jogo) exit; // pra isso criei a variavel e botei em quase td, se tiver em diálogo, transição, diagnóstico trava a tela

tempo_step_acumulado += 1;
if (tempo_step_acumulado >= game_get_speed(gamespeed_fps)) {
    tempo_step_acumulado = 0;
    global.tempo_restante -= 1;

    if (global.tempo_restante <= 0) {
        global.tempo_restante = 0;
        global.jogo_acabou = true;
        global.timer_ativo = false;
        // n tem ainda tela de game over ou vitória ent só acaba
        show_debug_message("TEMPO ACABOU — Game Over ainda não botado por greve dos artistas");
    }
}