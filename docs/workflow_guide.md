# 🎓 대학생을 위한 GitHub Action 배포 가이드

이 문서는 `.github/workflows/publish.yml` 파일이 어떤 역할을 하는지, 코드가 한 줄 한 줄 무슨 의미인지 아주 쉽게 설명한 가이드입니다.

---

## 🚀 GitHub Actions란 무엇인가요?
**"우리가 시키지 않아도, 특정 상황이 되면 알아서 일을 처리해주는 로봇"**이라고 생각하면 됩니다.

우리가 코드를 수정해서 GitHub에 올리면(Push), 이 로봇이 자동으로 깨어나서:
1.  발표 자료(`presentation.md`)를 가져와서,
2.  이예쁜 웹페이지(`html`)로 변환하고,
3.  인터넷에서 볼 수 있게 배포(Upload)까지 해줍니다.

---

## 📝 코드 상세 분석 (`publish.yml`)

이 파일은 로봇에게 주는 **작업 지시서**입니다. 하나씩 뜯어볼까요?

### 1. 지시서 이름
```yaml
name: Publish Presentation to GitHub Pages
```
*   이 작업의 이름입니다. GitHub 화면에서 이 이름으로 진행 상황이 표시됩니다.

### 2. 언제 일해야 하나요? (`on`)
```yaml
on:
  push:
    branches:
      - main
    paths:
      - 'docs/presentation.md'
      - '.github/workflows/publish.yml'
```
*   **"이때만 움직이세요!"** 라는 조건입니다.
*   `push`: 누군가 코드를 올렸을 때,
*   `branches: - main`: 그게 **main** 브랜치이고,
*   `paths`: **발표 자료 파일**이나 **이 지시서 자체**가 수정되었을 때만 실행됩니다.
    *   (Tip: 관련 없는 파일만 수정했을 때는 굳이 배포할 필요가 없으니까요!)

### 3. 권한 설정 (`permissions`)
```yaml
permissions:
  contents: read
  pages: write
  id-token: write
```
*   로봇에게 **출입증**을 주는 단계입니다.
*   `contents: read`: 코드를 **읽을 수 있는** 권한.
*   `pages: write`: 만든 웹페이지를 GitHub Pages에 **올릴 수 있는** 권한.

### 4. 동시 실행 방지 (`concurrency`)
```yaml
concurrency:
  group: "pages"
  cancel-in-progress: false
```
*   만약 여러 명이 동시에 수정을 해서 로봇이 여러 마리가 동시에 실행되면 꼬일 수 있겠죠?
*   이 설정은 배포 작업을 **한 줄로 서서 차례대로** 처리하게 만듭니다.

### 5. 실제 할 일 목록 (`jobs`)
여기서부터가 진짜 작업 내용입니다. `build-and-deploy`라는 하나의 큰 작업을 수행합니다.

#### 환경 설정
```yaml
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
```
*   `runs-on: ubuntu-latest`: **"가장 최신 리눅스(Ubuntu) 컴퓨터 하나 빌려줘!"** 라는 뜻입니다. 이 빈 컴퓨터에서 작업을 시작합니다.

#### 단계별 심부름 (`steps`)

**Step 1: 코드 가져오기**
```yaml
      - name: Checkout code
        uses: actions/checkout@v3
```
*   "GitHub 창고에 있는 우리 프로젝트 코드를 빌린 컴퓨터로 **다운로드** 받아."

**Step 2: Node.js 설치**
```yaml
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
```
*   "발표 자료 변환 도구(Marp)를 쓰려면 **Node.js**라는 프로그램이 필요해. 버전 18로 깔아줘."

**Step 3: Marp(변환기) 설치**
```yaml
      - name: Install Marp CLI
        run: npm install -g @marp-team/marp-cli
```
*   "이제 **Marp**라는 도구를 설치해. 이게 마크다운을 PPT나 HTML로 바꿔주는 핵심 도구야."

**Step 4: 변환하기 (빌드)**
```yaml
      - name: Build Marp presentation
        run: marp docs/presentation.md -o build/index.html --html
```
*   "자, 이제 `docs/presentation.md` 파일을 읽어서 → `build/index.html`이라는 **웹페이지 파일로 만들어!**"

**Step 5: 업로드 준비**
```yaml
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: build
```
*   "방금 만든 `build` 폴더를 포장해서 GitHub에 업로드할 준비를 해."

**Step 6: 배포하기**
```yaml
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```
*   "마지막으로 인터넷 세상(GitHub Pages)에 **공개(Deploy)** 해!"

---

## 🎉 결론
이 코드가 있기 때문에, 여러분이 `presentation.md` 파일의 글자만 고치고 저장(Push)하면, **복잡한 변환 과정을 몰라도** 1분 뒤에 여러분의 발표 자료 웹사이트가 자동으로 업데이트되는 것입니다!
