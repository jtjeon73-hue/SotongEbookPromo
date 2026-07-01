# 소통웨어 전자책 / SotongEbookPromo

소통웨어 전자책 개발 사업 총괄 홍보사이트입니다.

## 목적

소통웨어의 개발 경험, 산업자동화 실무 경험, 앱개발 과정, AI 활용법, 농촌생활, 수익자동화 아이디어를 전자책과 PDF 자료로 정리하여 독자에게 소개하는 **전자책 포트폴리오 허브**입니다.

## 주요 전자책 영역

- 앱개발 노하우
- 산업자동화 실무
- AI 활용법
- 수익자동화 아이디어
- 농촌생활 콘텐츠
- 유튜브/콘텐츠 제작
- 스마트스토어/소통창고 연계
- 1인 사업 구축 기록

## 대표 연락처

sotongware@naver.com

## 실행 방법

```powershell
flutter pub get
flutter run -d chrome
```

## GitHub Pages 빌드 방법 (Windows PowerShell)

```powershell
flutter clean
flutter pub get
dart format .
flutter analyze
flutter build web --base-href /SotongEbookPromo/
```

## docs 폴더 생성 방법

```powershell
Remove-Item -Recurse -Force docs -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path docs
Copy-Item -Path build/web/* -Destination docs -Recurse
New-Item -ItemType File -Path docs/.nojekyll -Force
```

`docs/.nojekyll` 파일을 반드시 유지하세요.

## GitHub Pages 설정

1. GitHub 저장소 **Settings** → **Pages**
2. **Source**: Deploy from a branch
3. **Branch**: `main`
4. **Folder**: `/docs`
5. **Save**

## 배포 후 예상 주소

https://jtjeon73-hue.github.io/SotongEbookPromo/

## 배포 후 확인할 것

- [ ] 404 오류 여부
- [ ] CSS/폰트/이미지 적용 여부
- [ ] 모바일 반응형 여부
- [ ] 카카오톡 공유 미리보기
- [ ] 새로고침 정상 여부
- [ ] 이메일 문의 버튼 동작 여부

## 기술 스택

- Flutter Web
- Material Design 3
- GitHub Pages (`/SotongEbookPromo/` base-href)

## 라이선스

Public Promo Site — 소통웨어(Sotongware)
