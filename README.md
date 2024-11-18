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

### 셋업 과정

0. 환경 변수 불러오기 (`.env` 파일 읽어서 전부 export 하기)
```bash
export $(grep -v '^#' .env | xargs)
```

1. Docker, Docker Compose 설치하기

```bash
sudo apt update && sudo apt install -y docker.io docker-compose git
```

2. submodule들 update 해오기 (backend, db repository)

```bash
git submodule update --recursive --remote
```

### setup.sh로 한 번에 하기

여기까지의 과정을 한 번에 해주는 `setup.sh`를 만들었습니다! 따라서

```bash
chmod +x setup.sh
./setup.sh
```

### 컨테이너 실행하기

1. git update & server build 하기

```bash
git submodule update --recursive --remote
docker-compose --profile build up
```

- 필요할 때만 수동으로 하세요!

2. container들 실행하기

```bash
docker-compose --profile run up
```

- 한 번 빌드한 상태로 run up 하면 backend, db 컨테이너 바로 시작

### container들 재시작하기

```bash
docker-compose down
docker-compose --profile run up
```


## 주의할 점

1. 이대로 EC2 instance에 배포하면 재시작 시 모든 db 정보가 날아갈 것이기 때문에, 주의할 것
2. db의 root user id, pw는 `.env` 파일로 따로 잘 보관해둘 것
