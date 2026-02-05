// 룸 2가 시작되자마자 실행되는 코드입니다.

// 1. 타이틀 오브젝트 생성
var title = instance_create_depth(0, 0, -9999, obj_title_display);

// 2. 설정값 주입
title.title_text = "제 1장";
title.sub_title_text = "-생일-";
title.text_color = c_black; // 검정색 글씨

// 3. 기타 설정
title.target_room = -1; // 타이틀이 끝나고 또 이동할 필요 없으므로 -1
title.persistent = false; // 이 방에서만 보여주고 사라지면 되므로 false