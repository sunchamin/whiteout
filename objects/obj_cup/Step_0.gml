// 1. 마우스 오른쪽 클릭 감지 (애니메이션 시작)
if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_right)) {
    if (anim_state == 0) {
        anim_state = 1; // 커지기 시작
    }
}

// 2. 애니메이션 로직
// [상태 1] 커지는 중
if (anim_state == 1) {
    image_xscale = lerp(image_xscale, 1.2, 0.2);
    image_yscale = image_xscale;

    if (image_xscale >= 1.18) {
        anim_state = 2; // 작아지기 시작
    }
}
// [상태 2] 작아지는 중 (원상복구)
else if (anim_state == 2) {
    image_xscale = lerp(image_xscale, 1.0, 0.2);
    image_yscale = image_xscale;

    // 원래 크기로 거의 돌아왔을 때
    if (image_xscale <= 1.02) {
        // 크기 및 상태 초기화
        image_xscale = 1;
        image_yscale = 1;
        anim_state = 0;

        // ====================================================
        // 1. 기존 유령 텍스트박스 제거
        // ====================================================
        if (instance_exists(obj_textframe)) {
            instance_destroy(obj_textframe);
        }

        // ====================================================
        // 2. 새로 생성 (변수 전달 포함!)
        // ====================================================
        // 여기서 { button_type : "cup" } 을 전달해서 컵 전용 버튼이 나오게 함
        var txt = instance_create_depth(0, 0, -9999, obj_textframe, { 
            button_type : "cup" 
        });
            
        // 대사 설정
        txt.msg_list = [
            "물이 든 평범한 컵이다.",
            "물을 마실까?"
        ];
            
        // 초기화
        txt.msg_index = 0;
        txt.message = txt.msg_list[0];
        txt.char_index = 0;
            
        // 행동 설정 (0: 버튼 띄우기)
        txt.end_action = 0; 
        
    } // if (image_xscale <= 1.02) 닫기
} // else if (anim_state == 2) 닫기 (★ 여기가 빠져서 에러가 났던 것입니다!)