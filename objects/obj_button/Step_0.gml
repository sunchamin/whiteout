// GUI 좌표계에서의 마우스 위치 가져오기
var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);

// [전체 조건문] 마우스가 버튼 위에 있는가?
if (position_meeting(gui_mouse_x, gui_mouse_y, id)) {
    
    // 마우스 오버 효과 (커짐)
    image_xscale = lerp(image_xscale, 1.1, 0.2);
    image_yscale = lerp(image_yscale, 1.1, 0.2);

    // [클릭 체크]
    if (mouse_check_button_pressed(mb_left)) {
        
        // -----------------------------------------------------
        // [버튼 0: 일어난다] -> 룸 1로 이동 (게임 시작)
        // -----------------------------------------------------
        if (button_id == 0) {
            
            // 인트로 정리
            if (instance_exists(obj_textframe)) instance_destroy(obj_textframe);
            if (instance_exists(obj_arrow)) instance_destroy(obj_arrow);
            if (instance_exists(obj_intro_manager)) instance_destroy(obj_intro_manager); 
            
            // 버튼 제거
            instance_destroy(obj_button); 
            
            // 룸 1로 이동
            room_goto(Room1); 
        } 
        
        // -----------------------------------------------------
        // [버튼 1: 계속 잔다] -> End 0 (게임 재시작)
        // -----------------------------------------------------
        else if (button_id == 1) {
            
            if (instance_exists(obj_textframe)) {
                with (obj_textframe) {
                    msg_list = [
                        "당신은 계속해서 깊은 꿈을 꾸기로 한다.",
                        "몸이 무거워지고, 그러나 아늑하게 가라앉는다.",
                        "영원한 어둠, 영원한 침묵.",
                        "불이 꺼졌다."
                    ];
                    
                    // 텍스트 초기화
                    msg_index = 0;
                    message = msg_list[0];
                    char_index = 0;
                    draw_text_msg = "";
                    input_delay = 15; 
                    
                    // 엔딩 액션 활성화
                    end_action = 1; 
                    
                    // 엔딩 타이틀 설정
                    next_title = "End 0";
                    next_sub_title = "-Black Out-";
                    
                    // ★ -2를 넣어서 'game_restart()' 신호를 보냄
                    next_room = -2; 
                }
            }
            // 모든 버튼 제거
            instance_destroy(obj_button); 
        }
    }
} 
// [전체 조건문의 else] 마우스가 버튼 밖일 때
else {
    // 원래 크기로 복귀
    image_xscale = lerp(image_xscale, 1.0, 0.2);
    image_yscale = lerp(image_yscale, 1.0, 0.2);
}