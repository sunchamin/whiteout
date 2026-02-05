// [상태 1: 페이드 인] 점점 밝아짐
if (state == "fade_in") {
    alpha += fade_speed;
    if (alpha >= 1) {
        alpha = 1;
        state = "wait";
    }
} 
// [상태 2: 대기] 잠시 멈춤
else if (state == "wait") {
    display_time -= 1;
    if (display_time <= 0) {
        state = "fade_out";
    }
} 
// [상태 3: 페이드 아웃] 점점 어두워짐
else if (state == "fade_out") {
    alpha -= fade_speed;

    // 완전히 투명해졌을 때 (연출 종료)
    if (alpha <= 0) {
        alpha = 0;

        // -----------------------------------------------------------
        // [최종 행동 결정] - 여기서 모든 걸 처리합니다
        // -----------------------------------------------------------
        
        // 1. 게임 재시작 신호 (target_room이 -2일 때)
        if (target_room == -2) {
            game_restart(); 
        }
        // 2. 특정 룸으로 이동 신호 (target_room이 -1도 아니고 -2도 아닐 때)
        else if (target_room != -1) {
            room_goto(target_room);
        }
        
        // 3. 할 일 다 했으니 오브젝트 파괴 (공통)
        instance_destroy();
    }
}