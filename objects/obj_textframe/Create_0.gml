// --- [1. 텍스트 시스템 변수] ---
full_text = "";         // 현재 화면에 보여줄 완성된 문장
draw_text_var = "";     // 타자기 효과로 한 글자씩 늘어나는 변수
char_count = 0;         // 글자 수 세는 변수
text_speed = 0.5;       // 타자기 속도 (0.5 = 2프레임당 1글자)

// ★ [누락되었던 부분] 페이지 관리 변수
text_array = [];        // 여러 문장을 담을 목록
page = 0;               // 현재 페이지 번호 (0부터 시작)


// --- [2. 선택지 버튼 시스템 변수] ---
options = [];                // 선택지 내용 ("네", "아니오")
are_buttons_created = false; // 버튼이 생성되었는지 확인하는 스위치


// --- [3. 대화창 디자인 (GUI 해상도 1920x1080 기준)] ---
box_width = 800;       // 박스 너비
box_height = 400;       // 박스 높이

// 박스 위치 계산 (화면 정중앙 하단)
box_x = (display_get_gui_width() - box_width) / 2;
box_y = display_get_gui_height() - box_height - 200; // 바닥에서 50px 띄움

// 내부 여백 및 폰트
padding_x = 40;
padding_y = 30;
font = fnt_kor;      // 폰트 이름 (오타 주의!)