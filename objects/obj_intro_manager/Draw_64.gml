// 화면 전체를 검은색으로 칠함
draw_set_alpha(black_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// 그리기 설정 초기화
draw_set_alpha(1);
draw_set_color(c_white);