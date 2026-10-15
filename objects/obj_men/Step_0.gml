if (text != "") {
    var _achou = false;
    for (var i = 0; i < array_length(pilha); i++) {
        if (pilha[i].texto == text) {
            pilha[i].vida = max(1, tempo);
            _achou = true;
            break;
        }
    }
    if (!_achou) {
        array_insert(pilha, 0, { texto: text, vida: max(1, tempo) });
        if (array_length(pilha) > 3) array_delete(pilha, 3, array_length(pilha) - 3);
    }
    text = "";
    tempo = 0;
}


for (var i = array_length(pilha) - 1; i >= 0; i--) {
    pilha[i].vida--;
    if (pilha[i].vida <= 0) array_delete(pilha, i, 1);
}