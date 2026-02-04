if (intro_state == 0) {
    timer -= 1;
    if (timer <= 0) {
        // "Instances" 대신 layer 변수를 사용합니다.
        instance_create_layer(room_width / 2, room_height / 2, layer, obj_textframe);
        intro_state = 1;
    }
}