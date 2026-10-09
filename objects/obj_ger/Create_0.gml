image_speed = 2;

escala_base = abs(image_xscale);


caminho = [
    { x: x,       y: y },
    { x: x,       y: y + 80 },  
    { x: x - 150, y: y + 80 },   
];
indice_caminho = 1;

move_spd = 1.5;
estado = "esperando"; // esperando, andando e 
timer_espera = 45;

blink_timer = irandom_range(180, 360);

balaou = instance_create_layer(x, y - 40, "Instances", obj_dialog);
balaou.visible = false;

dialogo_id = "gerente_intro";

global.ui_bloqueando_jogo = true;