display_set_gui_size(2000, 2000);
// 1. 게임 상태를 '컷신 모드'로 설정 (플레이어 정지)
global.is_cutscene = true;

// 2. 화면 투명도 (1: 완전 검정, 0: 투명)
alpha = 1; 

// 3. 인트로 진행 상태 (0: 대화 중, 1: 페이드 아웃 중)
state = 0;

// 1. 게임 상태 설정
global.is_cutscene = true; // 플레이어 얼음
global.choice = -1;        // 선택 결과 초기화 (중요!)

alpha = 1; // 화면 검기 (1: 완전 검정)
state = 0; // 진행 단계 (0: 질문 중, 1: 반응/결과, 2: 페이드 아웃)

// 1. 매니저 자신의 깊이 설정 (뒤쪽)
depth = -100; 

// 2. 텍스트 박스 생성
var _box = instance_create_layer(0, 0, "Instances", obj_textframe);

// 3. [중요] 텍스트 박스의 깊이를 아주 앞으로 당김 (매니저보다 더 작은 숫자여야 함)
_box.depth = -9999; 

// 4. 대사 및 설정 전달
_box.text_array =[""]
_box.options = ["일어난다", "계속 잔다"];

// --- [추가] 타이틀 연출용 변수 ---
title_alpha = 0;      // 타이틀 글자 투명도 (0:투명 ~ 1:불투명)
title_state = 0;      // 타이틀 연출 단계 (0:페이드인, 1:대기, 2:페이드아웃)
title_timer = 0;      // 타이틀 떠 있는 시간 계산용
chapter_main = "";    // 메인 제목 (예: 제 1 장)
chapter_sub = "";     // 소제목 (예: 낯선 천장)