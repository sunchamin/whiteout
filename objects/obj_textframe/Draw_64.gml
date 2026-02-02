// 1. 대화창 스프라이트 그리기
// spr_textframe을 box_width, box_height만큼 늘려서 그립니다.
draw_sprite_stretched(spr_textframe, 0, box_x, box_y, box_width, box_height);

// 2. 텍스트 그리기
draw_set_font(font);
draw_set_color(c_black); // 글자색 (배경에 맞춰 검은색 c_black 등으로 변경 가능)
draw_set_halign(fa_left);
draw_set_valign(fa_top);