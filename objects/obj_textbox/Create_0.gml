// 1. 텍스트 설정
full_text = "";        // 전체 문장 (외부에서 받아올 예정)
draw_text_var = "";    // 현재 화면에 보여질 문장
char_count = 0;        // 글자 카운터
text_speed = 0.5;      // 글자 출력 속도 (0.5 = 2프레임당 1글자)

// 2. 박스 디자인 및 위치 설정 (GUI 기준)
// 화면 해상도에 따라 다를 수 있으니 적절히 조절하세요.
box_width = 800;       // 박스 가로 길이
box_height = 200;      // 박스 세로 길이
box_x = (display_get_gui_width() - box_width) / 2; // 화면 중앙 정렬
box_y = display_get_gui_height() - box_height - 50; // 화면 하단 배치

// 3. 여백 (Padding)
padding_x = 30;
padding_y = 30;

// 4. 폰트 설정 (만들어둔 한글 폰트)
font = fnt_kor;