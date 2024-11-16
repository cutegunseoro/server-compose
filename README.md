# server-compose

## 설명

API 서버, MySQL 서버 container들의 설정 파일들을 포함하는 repository

## 폴더 구조

```
/
├── docker-compose.yml
├── backend/
│   └── (cloned backend repo here)
├── db/
│   └── (cloned db repo here)
├── init-backend.sh
├── init-db.sh
```

## 실행 방법

1. Docker, Docker Compose 설치하기

```bash
sudo apt update && sudo apt install -y docker.io docker-compose git
```

2. `./init-xxx.sh`들 실행하기: backend, db repository들을 각각 `./backend`, `./db`에 clone 해오고 기타 초기 설정을 합니다.

```bash
chmod +x init-backend.sh init-db.sh
./init-backend.sh
./init-db.sh
```

3. container들 실행하기

```bash
docker-compose up --build
```


## 주의할 점

1. 이대로 EC2 instance에 배포하면 재시작 시 모든 db 정보가 날아갈 것이기 때문에, 주의할 것
2. db의 root user id, pw는 `.env` 파일로 따로 잘 보관해둘 것
