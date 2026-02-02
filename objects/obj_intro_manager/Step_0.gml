// --- [단계 0] 첫 번째 선택 기다리기 ---
if (state == 0) {
    if (!instance_exists(obj_textframe)) {
        
        // A. 일어난다 (Choice 0) -> 타이틀 연출 시작
        if (global.choice == 0) {
            chapter_main = "제 ? 장";      // 큰 제목
            chapter_sub = "-하얀 방-"; // 작은 제목
            
            state = 1; // 타이틀 연출 단계로 이동
        }
        
        // B. 계속 잔다 (Choice 1) -> 기존대로 배드 엔딩 텍스트
        else if (global.choice == 1) {
            var _box = instance_create_layer(0, 0, "Instances", obj_textframe);
            _box.text_array = 
			["당신은 계속해서 깊은 꿈을 꾸기로 한다.", 
			"몸이 무거워지고, 그러나 아늑하게 가라앉는다.", 
			"영원한 어둠, 영원한 침묵.",
			"불이 꺼졌다."];
			state = 10; // [단계 10] 배드 엔딩 텍스트 대기 (새로 추가됨!)
        }
    }
}

// --- [단계 1] 타이틀 연출 (페이드 인/아웃) ---
else if (state == 1) {
    // 1-1. 글자가 서서히 나타남
    if (title_state == 0) {
        title_alpha += 0.01; // 속도 조절
        if (title_alpha >= 1) {
            title_alpha = 1;
            title_state = 1;
            title_timer = 120; // 약 2초간 대기 (60프레임 = 1초)
        }
    }
    // 1-2. 잠시 멈춰서 보여줌
    else if (title_state == 1) {
        title_timer--;
        if (title_timer <= 0) {
            title_state = 2;
        }
    }
    // 1-3. 글자가 서서히 사라짐
    else if (title_state == 2) {
        title_alpha -= 0.01;
        if (title_alpha <= 0) {
            title_alpha = 0;
            state = 2; // 타이틀 다 보여줬으니 이제 게임 화면으로(페이드아웃)
        }
    }
}

// --- [단계 10] 배드 엔딩 텍스트 대기 (★중요) ---
else if (state == 10) {
    if (!instance_exists(obj_textframe)) {
        // 텍스트 다 읽으면 -> 엔딩 타이틀 준비
        chapter_main = "End 0";
        chapter_sub = "Black Out";
        
        title_alpha = 0;
        title_state = 0;
        state = 3; // [단계 3] 엔딩 타이틀 연출로 이동
    }
}

// --- [단계 2] 검은 화면이 걷히며 게임 시작 ---
else if (state == 2) {
    alpha -= 0.01; 
    if (alpha <= 0) {
        global.is_cutscene = false; 
        instance_destroy(); 
    }
}

// --- [단계 99] 게임 오버 ---
else if (state == 99) {
    if (!instance_exists(obj_textframe)) {
        game_restart();
    }
}