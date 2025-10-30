🎓 자유전공학부 웹사이트 (Frontend)
PKNU Liberal Arts Web Platform — 프론트엔드
자유전공학부 학생들을 위한 통합 웹 서비스입니다.
단과대학별 게시판, 일정 관리, 학부 공지사항 등을 한 곳에서 확인할 수 있습니다.
⚙️ 1. 개발 환경
항목	버전 / 도구
Framework	Next.js 14 (App Router)
Language	TypeScript
UI Library	TailwindCSS
HTTP Client	Axios
Package Manager	pnpm
Node.js	v20 이상 권장
IDE	VSCode
🚀 2. 초기 세팅 방법
① 저장소 클론
git clone https://github.com/tlsdnjs31/liberalarts-FE.git
cd liberalarts-FE
② 패키지 설치
pnpm install
⚠️ npm 또는 yarn을 쓸 수도 있지만,
속도와 일관성 때문에 pnpm 사용을 권장합니다.
③ 개발 서버 실행
pnpm dev
브라우저에서 http://localhost:3000 접속
기본 페이지가 뜨면 환경설정 완료 🎉
🧩 3. 프로젝트 구조
src/
 ├─ app/                # Next.js App Router
 │   ├─ layout.tsx      # 전체 레이아웃
 │   ├─ page.tsx        # 메인 페이지
 │   ├─ login/          # 로그인 페이지
 │   ├─ signup/         # 회원가입 페이지
 │   ├─ board/          # 게시판 관련 페이지
 │   ├─ calendar/       # 일정 관리
 │   └─ notices/        # 공지사항
 ├─ components/         # 공용 컴포넌트 (Header, Footer 등)
 ├─ lib/                # axios 인스턴스 등 유틸
 ├─ styles/             # 전역 CSS / Tailwind 설정
 └─ types/              # 전역 타입 정의
🎨 4. TailwindCSS 설정
pnpm add -D tailwindcss postcss autoprefixer
pnpx tailwindcss init -p
tailwind.config.ts 수정:
content: [
  "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
  "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
  "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
],
theme: {
  extend: {},
},
plugins: [],
globals.css에 추가:
@tailwind base;
@tailwind components;
@tailwind utilities;
🌐 5. 환경변수 설정 (.env.local)
NEXT_PUBLIC_API_URL=http://localhost:8000
나중에 백엔드(FastAPI/Spring Boot) 서버 주소가 들어갈 자리입니다.
🔗 6. Git 브랜치 규칙
브랜치	설명
main	배포용 (항상 안정된 버전)
develop	개발 중 통합 브랜치
feat/*	기능 단위 개발 브랜치
예시	feat/login-page, feat/board-ui
🧱 7. 커밋 컨벤션
타입	설명
feat	새로운 기능 추가
fix	버그 수정
docs	문서 수정
style	스타일 변경 (기능 영향 X)
refactor	코드 리팩토링
chore	환경설정, 패키지 관련 변경
예시:
git commit -m "[feat] 로그인 페이지 UI 구현"
🖼️ 8. 실행 결과 예시 (초기 화면)
(추후 UI 완성 시 스크린샷 추가 예정)
[자유전공학부 포털]
> 로그인 | 회원가입
> 게시판 | 일정관리 | 공지사항
📌 9. 추후 계획
 회원가입 / 로그인 페이지 구현
 게시판 리스트 / 글쓰기 / 댓글
 캘린더 기반 일정 관리
 공지사항 크롤링 API 연결
 다크모드 지원
💬 개발자: 최신원 (PKNU 자유전공학부)
📅 프로젝트 기간: 2025.10 ~ ongoing
🌱 목표: 학부 구성원들을 위한 통합 커뮤니티 플랫폼 구축