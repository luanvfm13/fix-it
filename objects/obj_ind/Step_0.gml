alvo = alvo_da_etapa();

if (instance_exists(alvo)) {
    alvo_x = alvo.x;
    alvo_y = alvo.y;
}
alvo2 = (room == inicio && global.etapa == 0) ? instance_find(inicio_p_gamer, 1) : noone;