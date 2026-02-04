// 1. 프레임 확장 애니메이션
current_width = lerp(current_width, 800, 0.1);
current_height = lerp(current_height, 400, 0.1);

// 2. 텍스트 완료 여부 체크
var is_finished = (char_index >= string_length(message));

if (current_width > 700) {
    
    // --- [A. 텍스트 출력 중] ---
    if (!is_finished) {
        char_index += type_speed;
        draw_text_msg = string_copy(message, 1, floor(char_index));

        if (mouse_check_button_pressed(mb_left)) {
            char_index = string_length(message);
            draw_text_msg = message;
        }
    } 
    // --- [B. 텍스트 출력 완료 상태] ---
    else {
        var is_last_msg = (msg_index >= array_length(msg_list) - 1);

        if (!is_last_msg) {
            // [B-1. 중간 대사들] 다음 대사로 넘기기
            if (!instance_exists(obj_arrow)) instance_create_depth(x, y, -2000, obj_arrow);

            if (mouse_check_button_pressed(mb_left)) {
                msg_index += 1;
                message = msg_list[msg_index];
                char_index = 0;
                draw_text_msg = "";
                if (instance_exists(obj_arrow)) instance_destroy(obj_arrow);
            }
        } 
        else {
            // [B-2. 마지막 대사 완료 상태]
            // 화살표는 보여주되, 클릭하면 텍스트를 지우고 버튼을 생성함
            if (!instance_exists(obj_arrow) && !instance_exists(obj_button)) {
                instance_create_depth(x, y, -2000, obj_arrow);
            }

            if (mouse_check_button_pressed(mb_left) && !instance_exists(obj_button)) {
                // 1. 텍스트 내용 지우기
                draw_text_msg = "";
                message = ""; // 다시 출력되지 않게 함
                
                // 2. 화살표 제거
                if (instance_exists(obj_arrow)) instance_destroy(obj_arrow);
                
                // 3. 버튼 생성
                var btn_y = display_get_gui_height() - 400;
                var b1 = instance_create_depth(display_get_gui_width()/2 - 180, btn_y, -3000, obj_button);
                b1.button_id = 0;
                var b2 = instance_create_depth(display_get_gui_width()/2 + 180, btn_y, -3000, obj_button);
                b2.button_id = 1;
            }
        }
    }
}