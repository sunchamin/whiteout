// 1. 프레임 크기 애니메이션
current_width = lerp(current_width, 800, 0.1);
current_height = lerp(current_height, 400, 0.1);

// 2. 쿨타임 감소
if (input_delay > 0) {
    input_delay -= 1;
}

// 3. 텍스트 출력 로직
var is_finished = (char_index >= string_length(message));

if (current_width > 700) {
    
    // [A. 글자가 타이핑 되는 중]
    if (!is_finished) {
        char_index += type_speed;
        draw_text_msg = string_copy(message, 1, floor(char_index));

        // 클릭하면 스킵
        if (mouse_check_button_pressed(mb_left) && input_delay <= 0) {
            char_index = string_length(message);
            draw_text_msg = message;
        }
    } 
    // [B. 글자 출력이 끝남]
    else {
        var is_last_msg = (msg_index >= array_length(msg_list) - 1);

        // [B-1. 다음 대사로 넘어가기]
        if (!is_last_msg) {
            if (!instance_exists(obj_arrow)) instance_create_depth(x, y, -2000, obj_arrow);

            if (mouse_check_button_pressed(mb_left) && input_delay <= 0) {
                msg_index += 1;
                message = msg_list[msg_index];
                char_index = 0;
                draw_text_msg = "";
                if (instance_exists(obj_arrow)) instance_destroy(obj_arrow);
            }
        } 
        // [B-2. 마지막 대사 완료]
        else {
            // 화살표 표시
            if (!instance_exists(obj_arrow)) instance_create_depth(x, y, -2000, obj_arrow);

            // ★ 클릭 감지 (버튼 존재 여부 상관없이 일단 클릭하면 검사)
            if (mouse_check_button_pressed(mb_left) && input_delay <= 0) {
                
                // ============================================================
                // ★ [최우선] 종료 명령(2)이면, 버튼이고 뭐고 무조건 즉시 종료!
                // ============================================================
                if (end_action == 2) {
                    if (instance_exists(obj_arrow)) instance_destroy(obj_arrow);
                    instance_destroy(); 
                    return; // 코드를 여기서 강제 종료 (아래로 안 내려감)
                }

                // ============================================================
                // [일반] 버튼을 띄우는 상황 (종료 아님)
                // ============================================================
                // 버튼이 아직 안 떠있을 때만 실행
                if (!instance_exists(obj_button) && !instance_exists(obj_button_cup)) {
                    
                    // 공통 정리
                    draw_text_msg = "";
                    message = ""; 
                    if (instance_exists(obj_arrow)) instance_destroy(obj_arrow);

                    // [경우 0] 버튼 생성
                    if (end_action == 0) {
                         var btn_y = display_get_gui_height() - 400;

                         if (button_type == "cup") {
                             var b1 = instance_create_depth(display_get_gui_width()/2 - 180, btn_y, -10000, obj_button_cup);
                             b1.button_id = 0;
                             var b2 = instance_create_depth(display_get_gui_width()/2 + 180, btn_y, -10000, obj_button_cup);
                             b2.button_id = 1;
                         } else {
                             var b1 = instance_create_depth(display_get_gui_width()/2 - 180, btn_y, -10000, obj_button);
                             b1.button_id = 0;
                             var b2 = instance_create_depth(display_get_gui_width()/2 + 180, btn_y, -10000, obj_button);
                             b2.button_id = 1;
                         }
                    }
                    // [경우 1] 타이틀 (엔딩)
                    else if (end_action == 1) {
                        var title = instance_create_depth(0, 0, -9999, obj_title_display);
                        title.title_text = "End.0";
                        title.sub_title_text = "-Black Out-";
                        title.text_color = c_white;
                        title.target_room = -2;
                        instance_destroy();
                    }
                }
            }
        }
    }
}