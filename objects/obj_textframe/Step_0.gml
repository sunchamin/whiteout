// 1. 프레임 확장 애니메이션
current_width = lerp(current_width, 800, 0.1);
current_height = lerp(current_height, 400, 0.1);

// [쿨타임 감소]
if (input_delay > 0) {
    input_delay -= 1;
}

// 2. 텍스트 완료 여부 체크
var is_finished = (char_index >= string_length(message));

// [전체 조건문 시작]
if (current_width > 700) {
    
    // --- [A. 텍스트 출력 중] ---
    if (!is_finished) {
        char_index += type_speed;
        draw_text_msg = string_copy(message, 1, floor(char_index));

        // 스킵 기능 (쿨타임 없을 때만)
        if (mouse_check_button_pressed(mb_left) && input_delay <= 0) {
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
            if (!instance_exists(obj_button)) {
                if (!instance_exists(obj_arrow)) {
                    instance_create_depth(x, y, -2000, obj_arrow);
                }

                if (mouse_check_button_pressed(mb_left)) {
                    
                    // 메시지가 비어있지 않고 + 쿨타임이 끝났을 때 실행
                    if (message != "" && input_delay <= 0) { 
                        
                        // 공통: 텍스트와 화살표 지우기
                        draw_text_msg = "";
                        message = ""; 
                        if (instance_exists(obj_arrow)) instance_destroy(obj_arrow);

                        // ------------------------------------------------
                        // [분기점] 행동 결정
                        // ------------------------------------------------
                        
                        // 경우 0: 버튼 띄우기 (기본)
                        if (end_action == 0) {
                             var btn_y = display_get_gui_height() - 400;
                             var b1 = instance_create_depth(display_get_gui_width()/2 - 180, btn_y, -3000, obj_button);
                             b1.button_id = 0;
                             var b2 = instance_create_depth(display_get_gui_width()/2 + 180, btn_y, -3000, obj_button);
                             b2.button_id = 1;
                        }
                        // 경우 1: 타이틀 띄우고 퇴장 (재시작 예약)
                        else if (end_action == 1) {
                            var title = instance_create_depth(0, 0, -9999, obj_title_display);
                            title.title_text = "End.0";
                            title.sub_title_text = "-Black Out-";
                            title.text_color = c_white;
                            
                            // ★ 핵심: 타이틀에게 "끝나면 재시작해"라고 명령하기
                            title.target_room = -2;
                            
                            // 텍스트 박스는 할 일 다 했으니 사라짐
                            instance_destroy();
                        }

                    } // if (message != "" ...) 닫기
                } // if (mouse_check...) 닫기
            } // if (!instance_exists(obj_button)) 닫기
        } // else (마지막 대사 완료) 닫기
    } // else (텍스트 출력 완료) 닫기
} // if (current_width > 700) 전체 조건문 닫기