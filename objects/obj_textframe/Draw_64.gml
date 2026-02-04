// --- obj_textframe의 Draw GUI 이벤트 ---

// 1. 목표 크기 설정
var final_w = 800; 
var final_h = 400;

// 2. 크기 계산 (Create에 변수가 선언되어 있어야 에러가 안 납니다)
current_width = lerp(current_width, final_w, pop_speed);
current_height = lerp(current_height, final_h, pop_speed);

// 3. 위치 설정 (화면 중앙 하단)
var draw_x = display_get_gui_width() / 2;
var draw_y = display_get_gui_height() - 400;

// 4. 그리기
draw_sprite_stretched(sprite_index, image_index, draw_x - (current_width / 2), draw_y - (current_height / 2), current_width, current_height);

// --- obj_textframe의 Draw GUI 이벤트 ---
// (기존 프레임 그리기 코드 바로 아래에 추가)

if (current_width > 400) {
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_set_font(fnt_kor); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var text_x = display_get_gui_width() / 2;
    var text_y = display_get_gui_height() - 400;

    // 배율 조절 변수 (1.5는 1.5배, 2는 2배 크기)
    var text_scale = 2; 

    // 배율을 고려한 줄바꿈 너비 계산
    var wrap_width = (current_width - 60) / text_scale;

    // 변형된 텍스트 그리기
    draw_text_ext_transformed(text_x, text_y, draw_text_msg, 40, wrap_width, text_scale, text_scale, 0);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}