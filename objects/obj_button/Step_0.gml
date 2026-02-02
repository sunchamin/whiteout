// GUI 기준 마우스 좌표
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// 마우스가 버튼 위에 있는지 확인 (x, y는 화면 좌표가 됩니다)
// 스프라이트의 중심점(Origin)이 '가운데'라면 bbox 계산이 복잡할 수 있으니
// 단순하게 x, y 기준으로 사각형을 체크합니다. (여기선 스프라이트 중심점이 'Top Left(좌상단)' 기준이라 가정)
if (point_in_rectangle(_mx, _my, x, y, x + width, y + height)) {
    hover = true;
    
    // 클릭했다면?
    if (mouse_check_button_pressed(mb_left)) {
        global.choice = option_id; // 결과 저장
        
        // 텍스트 박스 찾아서 없애기
        if (instance_exists(obj_textframe)) {
            instance_destroy(obj_textframe);
        }
        
        // 버튼들(나 자신 포함)도 모두 없애기
        with (obj_button) instance_destroy();
    }
} else {
    hover = false;
}