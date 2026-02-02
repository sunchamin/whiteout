// 타자기 효과 로직
if (char_count < string_length(full_text)) {
    char_count += text_speed;
    
    // 현재 카운트만큼 문장을 잘라서 가져옴
    draw_text_var = string_copy(full_text, 1, floor(char_count));
}

// (선택사항) '스페이스바'를 누르면 문장이 한 번에 완성됨
if (keyboard_check_pressed(vk_space)) {
    char_count = string_length(full_text);
    draw_text_var = full_text;
}
// 문장이 다 출력된 상태에서 마우스 클릭 시 닫기
if (char_count >= string_length(full_text)) {
    if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space)) {
        instance_destroy(); // 박스 파괴
    }
}