// 1. 버튼 스프라이트 그리기
// 마우스가 올라가면(hover) 두 번째 이미지(1), 아니면 첫 번째 이미지(0)
var _img_index = (hover == true) ? 1 : 0; 
draw_sprite_stretched(sprite_index, _img_index, x, y, width, height);

// 2. 텍스트 그리기 (버튼 정중앙)
draw_set_font(fnt_kor);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (hover) draw_set_color(c_yellow); // 마우스 올리면 노란 글씨
else draw_set_color(c_white);        // 평소엔 흰 글씨

// 버튼의 중앙 좌표 계산
draw_text(x + width/2, y + height/2, option_text);