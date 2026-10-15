if (instance_exists(obj_painel)) exit;

if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    opcao = (opcao + 1) mod array_length(opcoes);
}
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    opcao = (opcao - 1 + array_length(opcoes)) mod array_length(opcoes);
}

if (keyboard_check_pressed(vk_escape)) {
    fechar_pausa();
    exit;
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
    switch (opcao) {
        case 0: fechar_pausa(); break;
        case 1: instance_create_depth(0, 0, -1000, obj_painel); break;
        case 2:
            reset_jogo();
            fade_to_room(Menu);
            instance_destroy();
            break;
    }
}