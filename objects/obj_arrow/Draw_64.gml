// obj_textframe이 있을 때만 그리기
if (instance_exists(obj_textframe)) {
    // 화면 가로 중앙
    var draw_x = display_get_gui_width() / 2;
    // 화면 하단에서 프레임 위치에 맞춰 조절 (예: 150픽셀 위)
    var draw_y = display_get_gui_height() - 250; 
    
    // y_offset을 더해 둥둥 떠다니게 함
    draw_sprite(sprite_index, image_index, draw_x, draw_y + y_offset);
}
