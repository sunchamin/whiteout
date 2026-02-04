depth = -100; // 앞쪽 (숫자가 낮을수록 카메라와 가깝습니다)
image_xscale = 0; // 처음에 가로 크기 0
image_yscale = 0; // 처음에 세로 크기 0
pop_speed = 0.1;  // 커지는 속도
// --- obj_textframe의 Create 이벤트 ---
current_width = 0;
current_height = 0;

// 1. 대사 리스트 (배열)
msg_list = [
    "..."
];

msg_index = 0;              // 현재 몇 번째 대사인지 (이게 없어서 에러가 났던 거예요!)
message = msg_list[msg_index]; // 현재 출력할 실제 문구

// 2. 출력 제어 변수
draw_text_msg = "";
char_index = 0;
type_speed = 0.5;

// 3. 프레임 크기 변수
current_width = 0;
current_height = 0;
pop_speed = 0.1;