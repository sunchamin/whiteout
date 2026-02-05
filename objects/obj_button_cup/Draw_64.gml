// [obj_button_cup] -> [Draw GUI 이벤트]

// 1. 버튼 그림(스프라이트) 먼저 그리기 (이게 빠져 있었을 겁니다!)
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

// 2. 텍스트 설정
draw_set_font(fnt_kor);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

// 3. 텍스트 내용 결정
var btn_text = "";
if (button_id == 0) btn_text = "물을 마신다";
else if (button_id == 1) btn_text = "떠난다";

// 4. 텍스트 그리기
draw_text(x, y, btn_text);