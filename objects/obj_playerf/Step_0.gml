// 1. 컷신(대화/이벤트) 중이면 움직임 코드 실행 안 함
if (global.is_cutscene == true) {
    image_speed = 0;      
    image_index = 0;      
    exit;                 
}

// --- 2. 이동 입력 ---
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var _key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));

// 속도 계산
var _hspd = (_key_right - _key_left) * spd;
var _vspd = (_key_down - _key_up) * spd;


// ==========================================================
// ★ [수정됨] 충돌 처리 (obj_solid 사용)
// ==========================================================

// [가로 충돌 체크]
// "갈 방향(x + _hspd)에 obj_solid가 있는가?"
if (place_meeting(x + _hspd, y, obj_solid)) {
    
    // 벽에 닿을 때까지 1픽셀씩 다가감 (빈틈 없이 딱 붙기)
    while (!place_meeting(x + sign(_hspd), y, obj_solid)) {
        x += sign(_hspd);
    }
    
    // 딱 붙었으면 속도를 0으로 (멈춤)
    _hspd = 0;
}

// 실제 이동 적용 (충돌했으면 _hspd가 0이라서 안 움직임)
x += _hspd;


// [세로 충돌 체크]
// "갈 방향(y + _vspd)에 obj_solid가 있는가?"
if (place_meeting(x, y + _vspd, obj_solid)) {
    
    // 벽에 닿을 때까지 1픽셀씩 다가감
    while (!place_meeting(x, y + sign(_vspd), obj_solid)) {
        y += sign(_vspd);
    }
    
    // 딱 붙었으면 속도를 0으로 (멈춤)
    _vspd = 0;
}

// 실제 이동 적용
y += _vspd;

// ==========================================================


// --- 3. 애니메이션 처리 ---

// 움직이고 있는가? (충돌해서 멈췄으면 _hspd, _vspd는 0이 됨)
if (_hspd != 0 || _vspd != 0) {
    
    // 입력키에 따라 바라보는 방향(face) 업데이트
    if (_key_right) face = 0;
    if (_key_up)    face = 1;
    if (_key_left)  face = 2;
    if (_key_down)  face = 3;
    
    // 걷는 스프라이트로 변경
    sprite_index = spr_walk[face];
} 
else {
    // 멈췄다면? -> 현재 방향의 '서 있는' 스프라이트로 변경
    sprite_index = spr_idle[face];
}