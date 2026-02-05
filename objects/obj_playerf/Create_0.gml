depth = -1000

// --- [안전장치 추가] ---
// 혹시 'is_cutscene' 변수가 아직 안 만들어졌다면, 일단 false(움직임 가능)로 만들어둔다.
if (!variable_global_exists("is_cutscene")) {
    global.is_cutscene = false;
}

// 혹시 'choice' 변수가 아직 안 만들어졌다면, -1로 만들어둔다.
if (!variable_global_exists("choice")) {
    global.choice = -1;
}

// ... (아래에는 기존의 spd, face 설정 코드가 이어짐) ...
spd = 6
face = 3;
// ...
spd = 4; 

spr_walk[0] = spr_playerR_walk; // 오른쪽
spr_walk[1] = spr_playerb_walk; // 위 (Back)
spr_walk[2] = spr_playerl_walk; // 왼쪽
spr_walk[3] = spr_playerf_walk; // 아래 (Front)

spr_idle[0] = spr_playerR;
spr_idle[1] = spr_playerb;
spr_idle[2] = spr_playerl;
spr_idle[3] = spr_playerf;

face = 3;

spr_walk[0] = spr_playerR_walk; // 오른쪽 걷기
spr_walk[1] = spr_playerb_walk; // 위(뒤) 걷기
spr_walk[2] = spr_playerl_walk; // 왼쪽 걷기
spr_walk[3] = spr_playerf_walk; // 아래(앞) 걷기

spr_idle[0] = spr_playerR;      // 오른쪽 서기
spr_idle[1] = spr_playerb;      // 위(뒤) 서기
spr_idle[2] = spr_playerl;      // 왼쪽 서기
spr_idle[3] = spr_playerf;      // 아래(앞) 서기