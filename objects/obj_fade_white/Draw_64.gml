// 화면 전체를 덮는 하얀 네모 그리기
var cam_w = display_get_gui_width();
var cam_h = display_get_gui_height();

draw_set_color(c_white);
draw_set_alpha(alpha);
draw_rectangle(0, 0, cam_w, cam_h, false);

// 그리기 설정 초기화 (다른 오브젝트에 영향 안 가게)
draw_set_alpha(1);