var _sobreposto = false;
for (var _i = 0; _i < array_length(npc_colisao_objetos); _i++) {
    if (place_meeting(x, y, npc_colisao_objetos[_i])) { _sobreposto = true; break; }
}
if (_sobreposto) {
    var _ox = x;
    var _oy = y;
    var _achou = false;
    for (var _r = 2; _r <= 48 && !_achou; _r += 2) {
        for (var _a = 0; _a < 360 && !_achou; _a += 45) {
            x = _ox + lengthdir_x(_r, _a);
            y = _oy + lengthdir_y(_r, _a);
            var _livre = true;
            for (var _j = 0; _j < array_length(npc_colisao_objetos); _j++) {
                if (place_meeting(x, y, npc_colisao_objetos[_j])) { _livre = false; break; }
            }
            if (_livre && tile_get_index(tilemap_get_at_pixel(tilemap, x, y)) == 0) _achou = true;
        }
    }
    if (!_achou) { x = _ox; y = _oy; }
}
if (global.ui_bloqueando_jogo) {
    if (sprite_index == spr_prota_dir)       sprite_index = spr_prota_dir_idle;
    else if (sprite_index == spr_prota_esq)  sprite_index = spr_prota_esq_idle;
    else if (sprite_index == spr_prota_fren) sprite_index = spr_prota_par;
    else if (sprite_index == spr_prota_tras) sprite_index = spr_prota_tras_idle;
    exit;
}


var _direita = keyboard_check(ord("D")) || keyboard_check(vk_right);
var _esquerda = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _baixo = keyboard_check(ord("S")) || keyboard_check(vk_down);
var _cima = keyboard_check(ord("W")) || keyboard_check(vk_up);
var hor = _direita - _esquerda;
var ver = _baixo - _cima;


if (hor != 0 && ver != 0) {
    hor *= 0.70710678;
    ver *= 0.70710678;
}

var vel_fin = move_spd;
if (keyboard_check(vk_shift)) {
    vel_fin = move_spd * 2;
}

var _dx = hor * vel_fin;
var _dy = ver * vel_fin;
var _x_inicial = x;
var _y_inicial = y;
move_and_collide(_dx, _dy, tilemap, undefined, undefined, undefined);

var _colidiu_npc = false;
for (var _i = 0; _i < array_length(npc_colisao_objetos); _i++) {
    if (place_meeting(x, y, npc_colisao_objetos[_i])) {
        _colidiu_npc = true;
        break;
    }
}

if (_colidiu_npc) {
    x = _x_inicial;
    y = _y_inicial;

    move_and_collide(_dx, 0, tilemap, undefined, undefined, undefined);
    for (var _i = 0; _i < array_length(npc_colisao_objetos); _i++) {
        if (place_meeting(x, y, npc_colisao_objetos[_i])) {
            x = _x_inicial;
            break;
        }
    }

    move_and_collide(0, _dy, tilemap, undefined, undefined, undefined);
    for (var _i = 0; _i < array_length(npc_colisao_objetos); _i++) {
        if (place_meeting(x, y, npc_colisao_objetos[_i])) {
            y = _y_inicial;
            break;
        }
    }
}

if (hor != 0 || ver != 0) {
    if (ver > 0)      sprite_index = spr_prota_fren;
    else if (ver < 0) sprite_index = spr_prota_tras;
    else if (hor > 0) sprite_index = spr_prota_dir;
    else if (hor < 0) sprite_index = spr_prota_esq;
} else {
    if (sprite_index == spr_prota_dir)       sprite_index = spr_prota_dir_idle;
    else if (sprite_index == spr_prota_esq)  sprite_index = spr_prota_esq_idle;
    else if (sprite_index == spr_prota_fren) sprite_index = spr_prota_par;
    else if (sprite_index == spr_prota_tras) sprite_index = spr_prota_tras_idle;
}