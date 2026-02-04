// 팝업 애니메이션
image_xscale = lerp(image_xscale, 1, 0.1);
image_yscale = lerp(image_yscale, 1, 0.1);

// 마우스 클릭 체크 (Draw GUI를 쓴다면 좌표 변환이 필요할 수 있으나, 간단히 구현)
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    if (button_id == 0) {
        // 왼쪽 버튼 클릭 시 행동 (예: 룸 이동)
        room_goto(Room1);
    } else {
        // 오른쪽 버튼 클릭 시 행동 (예: 게임 종료 혹은 다른 대사)
        game_end();
    }
}