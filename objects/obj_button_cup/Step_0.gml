// [obj_button_cup] -> [Step 이벤트]

// 1. 크기 애니메이션
image_xscale = lerp(image_xscale, 1.0, 0.2);
image_yscale = image_xscale;

var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);

// 2. 마우스 상호작용
if (position_meeting(gui_mouse_x, gui_mouse_y, id)) {
    // 마우스 오버 효과
    image_xscale = lerp(image_xscale, 1.1, 0.2);
    image_yscale = image_xscale;

    if (mouse_check_button_pressed(mb_left)) {
        
        // -----------------------------------------------------
        // [버튼 0: 물을 마신다]
        // -----------------------------------------------------
        if (button_id == 0) {
             if (instance_exists(obj_textframe)) {
                with (obj_textframe) {
                    // 대사 변경
                    msg_list = ["작은 소리가 들린다.", "바닥에 문이 생겼다!"];
                    msg_index = 0;
                    message = msg_list[0];
                    char_index = 0;
                    draw_text_msg = "";
                    
                    // ★★★ [핵심 1] 딜레이를 줘서 클릭 관통 막기! ★★★
                    // (이게 없으면 버튼 누른 클릭으로 첫 대사도 스킵해버림)
                    input_delay = 20; 
                    
                    // 다 읽으면 꺼지도록 설정
                    end_action = 2; 
                }
             }
             // 버튼 삭제
             instance_destroy(obj_button_cup);
        }
        
        // -----------------------------------------------------
        // [버튼 1: 떠난다]
        // -----------------------------------------------------
        else if (button_id == 1) {
             // ★★★ [핵심 2] 텍스트 프레임 즉시 파괴 ★★★
             if (instance_exists(obj_textframe)) {
                 instance_destroy(obj_textframe);
             }
             
             // 화살표도 파괴
             if (instance_exists(obj_arrow)) {
                 instance_destroy(obj_arrow);
             }
             
             // 버튼 삭제
             instance_destroy(obj_button_cup);
        }
    }
}