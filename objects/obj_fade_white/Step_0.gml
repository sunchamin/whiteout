// 1. 화면이 점점 하얗게 변함 (Fade In)
if (state == "in") {
    alpha += fade_speed; 
    
    if (alpha >= 1.2) { 
        alpha = 1;
        room_goto(target_room); 
        state = "out";          
    }
}

// 2. 하얀 화면이 걷힘 (Fade Out)
else if (state == "out") {
    alpha -= fade_speed;
    
    // 완전히 투명해지면 (화면이 밝아짐)
    if (alpha <= 0) {
        
        // 1. 룸 확인
        if (room == Room1) { 
            
            // ★ [중복 방지] 기존 텍스트박스가 있으면 가져오고, 없으면 새로 만듦
            var txt;
            if (instance_exists(obj_textframe)) {
                txt = instance_find(obj_textframe, 0);
            } else {
                // 위치는 GUI가 알아서 잡으므로 (0,0)에 만들어도 무관함
                txt = instance_create_depth(0, 0, -9999, obj_textframe);
            }

            // 2. 내용 및 변수 설정 (여기가 핵심!)
            with (txt) {
                msg_list = [
                    "온 사방이 하얗다.", 
                    "...그리고 나 또한 그렇다.", 
                    "낯선 장소다. 그러나 묘한 안정감이 느껴진다.", 
                    "앞으로 나아가볼까?"
                ];
                
                message = msg_list[0];
                msg_index = 0;
                char_index = 0;
                draw_text_msg = "";
                input_delay = 15; 
                end_action = 2; 
                
                // ====================================================
                // ★ [핵심 해결] 님의 코드 변수명에 맞춰서 값을 넣어줌
                // ====================================================
                
                // 애니메이션 없이 바로 꽉 찬 크기로 보여주기
                current_width = 800;
                current_height = 400;
                
                // (만약 팝업 효과를 내고 싶다면 둘 다 0으로 설정하세요)
                // current_width = 0; 
                // current_height = 0;

                // 텍스트 배율 등 기타 변수가 필요하다면 초기화
                // (Create 이벤트에 이미 있다면 생략 가능)
                if (!variable_instance_exists(id, "pop_speed")) pop_speed = 0.1;
            }
        }
        
        // 역할 끝났으니 삭제
        instance_destroy();
    }
}