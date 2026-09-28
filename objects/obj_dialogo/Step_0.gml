if (dados_dialogo == undefined) exit; 

var fala = dados_dialogo[$ no_atual];

if (fala == undefined) {
    show_debug_message("ERRO: no '" + string(no_atual) + "' não existe no dialogo '" + string(dialogo_id) + "'");
    instance_destroy();
    exit;
}

if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
    exit;
}

if (indice_caractere < string_length(fala.texto)) {
    var _pulo = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"));

    if (_pulo) {
        indice_caractere = string_length(fala.texto);
        texto_exibido = fala.texto;
        texto_completo = true;
    } else {
        indice_caractere += velocidade_texto;
        texto_exibido = string_copy(fala.texto, 1, floor(indice_caractere));
        texto_completo = false;

        var char_atual = string_char_at(fala.texto, floor(indice_caractere));
        if (floor(indice_caractere) > ultimo_caractere_som && char_atual != " ") {
            if (audio_exists(snd_text_blip)) {
                audio_play_sound(snd_text_blip, 1, false);
            }
            ultimo_caractere_som = floor(indice_caractere);
        }
    }
} else {
    texto_completo = true;
}

if (texto_completo) {
    var qtd_opcoes = array_length(fala.opcoes);

    if (qtd_opcoes > 0) {
        if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(ord("W"))) {
            opcao_selecionada = (opcao_selecionada + 1) mod qtd_opcoes;
            if (audio_exists(snd_select)) audio_play_sound(snd_select, 1, false);
        }
        if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("S"))) {
            opcao_selecionada = (opcao_selecionada - 1 + qtd_opcoes) mod qtd_opcoes;
            if (audio_exists(snd_select)) audio_play_sound(snd_select, 1, false);
        }

        if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))) {
            no_atual = string(fala.opcoes[opcao_selecionada].proximo_id);
            indice_caractere = 0;
            ultimo_caractere_som = 0;
            opcao_selecionada = 0;
        }
    } else {
        if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))) {
            instance_destroy();
        }
    }
}