// 1. 먼저 다음 룸으로 이동합니다.
room_goto(Room2); 

// 2. 플레이어의 위치를 강제로 설정합니다.
// 룸 아래쪽 가운데 좌표 계산:
// 가로: room_width / 2 (중앙)
// 세로: room_height - 64 (바닥에서 약간 위, 숫자는 캐릭터 크기에 맞춰 조절하세요)

obj_playerf.x = (room_width / 2) - 120
obj_playerf.y = room_height - 800;