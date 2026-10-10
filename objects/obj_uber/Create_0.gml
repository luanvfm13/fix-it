sprite_index = spr_carro_fre;
move_spd = 1.2;


caminho = [
    { x: x,       y: y },
    { x: x,       y: y + 200 },
    { x: x + 60,  y: y + 300 }
];
indice_caminho = 1;

estado = "esperando";
timer_espera = 60;

with (obj_prota) {
    visible = false;
}
global.ui_bloqueando_jogo = true;