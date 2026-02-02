// 1. 텍스트 박스 그리기
// 스프라이트가 있다면 draw_sprite_stretched 사용
// 스프라이트가 없다면 검은색 사각형으로 대체 (테스트용)
if (sprite_index != -1) {
    draw_sprite_stretched(sprite_index, 0, box_x, box_y, box_width, box_height);
} else {
    draw_set_color(c_black);
    draw_set_alpha(0.8); // 반투명
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
    draw_set_alpha(1);   // 투명도 복구
}

// 2. 텍스트 그리기
draw_set_font(font);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// 줄바꿈이 포함된 텍스트 출력 함수 (너비 제한: box_width - 여백*2)
draw_text_ext(box_x + padding_x, box_y + padding_y, draw_text_var, 35, box_width - (padding_x * 2));