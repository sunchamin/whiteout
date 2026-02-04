// 버튼이 GUI 레이어에 그려지도록 설정 (텍스트 프레임과 같은 방식)
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

// 버튼 위에 글자 써넣기
draw_set_font(fnt_kor);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

var btn_text = (button_id == 0) ? "일어난다" : "계속 잔다";
draw_text(x, y, btn_text);