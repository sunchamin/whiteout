if (state == "fade_in") {
    // 1. 점점 밝아짐
    alpha += fade_speed;
    if (alpha >= 1) {
        alpha = 1;
        state = "wait";
    }
} 
else if (state == "wait") {
    // 2. 잠시 대기
    display_time -= 1;
    if (display_time <= 0) {
        state = "fade_out";
    }
} 
else if (state == "fade_out") {
    // 3. 점점 어두워짐
    alpha -= fade_speed;
    if (alpha <= 0) {
        alpha = 0;
        instance_destroy(); // 완전히 사라지면 오브젝트 파괴
    }
}