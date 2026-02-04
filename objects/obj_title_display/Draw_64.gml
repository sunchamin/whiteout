draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var screen_x = display_get_gui_width() / 2;
var screen_y = display_get_gui_height() / 2;

// 제목 그리기 (가로 2배, 세로 2배 크기로 확대)
draw_set_font(fnt_kor);
draw_text_transformed_color(screen_x, screen_y, title_text, 4, 4, 0, c_black, c_black, c_black, c_black, alpha);

// 소제목 그리기 (가로 1.5배, 세로 1.5배 크기로 확대)
draw_set_font(fnt_kor);
draw_text_transformed_color(screen_x, screen_y + 80, sub_title_text, 4, 4, 0, c_black, c_black, c_black, c_black, alpha);

// 정렬 초기화
draw_set_halign(fa_left);
draw_set_valign(fa_top);