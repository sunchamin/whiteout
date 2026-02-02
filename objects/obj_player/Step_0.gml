// 컷신(대화/이벤트) 중이면 움직임 코드 실행 안 함
if (global.is_cutscene == true) {
    image_speed = 0;      // 애니메이션 멈춤
    image_index = 0;      // 서 있는 자세로 고정
    exit;                 // 아래 코드로 내려가지 않고 여기서 끝냄
}


// --- 1. 이동 입력 (기존에 쓰시던 방식 유지) ---
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var _key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));

// 속도 계산 (spd 변수는 Create 이벤트에 있어야 합니다)
var _hspd = (_key_right - _key_left) * spd;
var _vspd = (_key_down - _key_up) * spd;

// --- 1. 이동 입력 (기존 코드) ---
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var _key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));

var _hspd = (_key_right - _key_left) * spd;
var _vspd = (_key_down - _key_up) * spd;

// 1. 움직이고 있는가? (속도가 0이 아니면 움직이는 중)
if (_hspd != 0 || _vspd != 0) {
    
    // 2. 입력키에 따라 바라보는 방향(face) 업데이트
    if (_key_right) face = 0;
    if (_key_up)    face = 1;
    if (_key_left)  face = 2;
    if (_key_down)  face = 3;
    
    // 3. 걷는 스프라이트로 변경
    // 배열에서 현재 방향(face)에 맞는 그림을 꺼내옴
    sprite_index = spr_walk[face];
} 
else {
    // 4. 멈췄다면? -> 현재 방향의 '서 있는' 스프라이트로 변경
    sprite_index = spr_idle[face];
}

// --- 2. 가로(X) 충돌 체크 (기존 코드 이어짐) ---
// ...

// --- 2. 가로(X) 충돌 및 모서리 미끄러짐 ---
var _slide_amount = 12; // 미끄러짐 허용 범위

if (place_meeting(x + _hspd, y, obj_solid)) {
    var _moved = false;

    // 위/아래 틈 확인
    for (var i = 1; i <= _slide_amount; i++) {
        if (!place_meeting(x + _hspd, y - i, obj_solid)) {
            y -= 2; _moved = true; _hspd = 0; break;
        }
        if (!place_meeting(x + _hspd, y + i, obj_solid)) {
            y += 2; _moved = true; _hspd = 0; break;
        }
    }

    // 틈 없으면 정지
    if (!_moved) {
        while (!place_meeting(x + sign(_hspd), y, obj_solid)) {
            x += sign(_hspd);
        }
        _hspd = 0;
    }
}
x += _hspd;


// --- 3. 세로(Y) 충돌 및 모서리 미끄러짐 ---
if (place_meeting(x, y + _vspd, obj_solid)) {
    var _moved = false;

    // 좌/우 틈 확인
    for (var i = 1; i <= _slide_amount; i++) {
        if (!place_meeting(x - i, y + _vspd, obj_solid)) {
            x -= 2; _moved = true; _vspd = 0; break;
        }
        if (!place_meeting(x + i, y + _vspd, obj_solid)) {
            x += 2; _moved = true; _vspd = 0; break;
        }
    }

    // 틈 없으면 정지
    if (!_moved) {
        while (!place_meeting(x, y + sign(_vspd), obj_solid)) {
            y += sign(_vspd);
        }
        _vspd = 0;
    }
}
y += _vspd;


if (mouse_check_button_pressed(mb_right)) {
    var _target = instance_position(mouse_x, mouse_y, obj_solid);
    
    if (_target != noone) {
        var _dis = distance_to_object(_target);
        
        if (_dis < 30) {
            // [수정] 기존 창이 있으면 닫기 (이름을 obj_textframe으로 변경)
            if (instance_exists(obj_textframe)) {
                instance_destroy(obj_textframe);
            }
            
            // [수정] 새 대화창 생성 (이름을 obj_textframe으로 변경)
            var _new_box = instance_create_layer(0, 0, "Instances", obj_textframe);
            
            // 대사 전달
            _new_box.full_text = _target.my_text;
            
            with(_target) {
                is_bouncing = true;
            }
        }
    }
}