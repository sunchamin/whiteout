// 1. 타자기 효과 (글자가 아직 다 안 나왔을 때)
if (char_count < string_length(full_text)) {
    char_count += text_speed;
    draw_text_var = string_copy(full_text, 1, floor(char_count));
    
    // (선택사항) 스킵 기능: 타이핑 중에 스페이스바 누르면 바로 완성
    if (keyboard_check_pressed(vk_space)) {
        char_count = string_length(full_text);
        draw_text_var = full_text;
    }
} 
// ... (위쪽 타자기 코드는 유지) ...

else {
    // 버튼 생성 조건 만족
    if (page == array_length(text_array) - 1 && array_length(options) > 0) {
        
        if (are_buttons_created == false) {
            are_buttons_created = true;
            
            // --- [가로 배치 설정] ---
            var _btn_width = 200; // 버튼 가로 크기 (obj_button과 동일하게)
            var _gap = 50;        // 버튼 사이의 간격
            var _count = array_length(options);
            
            // 1. 전체 버튼 그룹의 길이를 구합니다. (버튼들 + 사이 간격)
            var _total_width = (_btn_width * _count) + (_gap * (_count - 1));
            
            // 2. 시작 X 좌표 계산 (박스 중앙 - 전체 길이의 절반) -> 이렇게 해야 딱 가운데 정렬됨
            var _start_x = box_x + (box_width / 2) - (_total_width / 2);
            
            // 3. Y 좌표 고정 (박스 바닥에서 80px 위)
            var _fixed_y = box_y + box_height - 225; 
            
            // 4. 버튼 생성 (왼쪽 -> 오른쪽 순서로 생성)
            for (var i = 0; i < _count; i++) {
                var _btn = instance_create_layer(0, 0, "Instances", obj_button);
                
                // 좌표 설정
                _btn.x = _start_x + (i * (_btn_width + _gap)); // i번째만큼 옆으로 이동
                _btn.y = _fixed_y; // Y는 모두 동일
                
                // 정보 전달
                _btn.option_text = options[i];
                _btn.option_id = i;
                _btn.width = _btn_width; // 버튼 크기 확실하게 지정
                _btn.height = 60;
                _btn.depth = -10000;
            }
        }
    }
    
    // ... (아래 클릭/스페이스바 처리 코드는 유지) ...
}