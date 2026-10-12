if (room != inicio) exit;
if (global.ui_bloqueando_jogo || instance_exists(obj_dialogo)) exit;
if (!instance_exists(obj_prota) || !obj_prota.visible) exit;
if (!debug_rota && global.etapa != 5) exit;

if (aviso_cooldown > 0) aviso_cooldown--;

var _d = 99999;
for (var i = 0; i < array_length(pontos) - 1; i++) {
    _d = min(_d, dist_ponto_segmento(obj_prota.x, obj_prota.y,
        pontos[i].x, pontos[i].y, pontos[i + 1].x, pontos[i + 1].y));
}

if (_d > tolerancia) {
    tempo_fora++;
    if (tempo_fora > 30 && aviso_cooldown <= 0) {
        aviso_cooldown = 300;
        var _d2 = instance_create_layer(obj_prota.x, obj_prota.y, "Instances", obj_dialogo);
        with (_d2) {
            setup_dialogo("fora_da_rota");
        }
    }
} else {
    tempo_fora = 0;
}