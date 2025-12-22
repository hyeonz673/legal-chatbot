#!/bin/bash

# 1. 초기 설정 및 환경 구축
gh issue create --title "[Set up] 초기 설정 및 환경 구축" --body "**작업 배경**
프로젝트 개발을 시작하기 위한 기본 디렉토리 구조와 데이터베이스(Neo4j, Chroma) 환경을 구축해야 합니다.

**작업 내용**
- 프로젝트 디렉토리 및 Python 환경 설정
- Neo4j Desktop 및 ChromaDB 로컬 설치 및 연결 테스트

**인수 조건**
- [ ] GitHub 저장소 및 `.gitignore` 설정 완료
- [ ] `requirements.txt` 작성 및 가상환경 구성 완료
- [ ] `docs/`, `data/`, `pipeline/`, `rag/`, `app/` 디렉토리 생성 완료
- [ ] Neo4j 로컬 인스턴스 구동 및 Python 드라이버 연결 성공
- [ ] ChromaDB 설치 및 간단한 벡터 저장/검색 테스트 성공"

# 2. 데이터 파이프라인 (ETL) 구현
gh issue create --title "[ETL] 데이터 파이프라인 구현" --body "**작업 배경**
법률 데이터를 수집하여 그래프 데이터베이스와 벡터 저장소에 적재하는 파이프라인이 필요합니다.

**작업 내용**
- 법령 API 수집기 구현
- 데이터 정규화 및 그래프/벡터 구축 스크립트 작성

**인수 조건**
- [ ] **데이터 수집**: API 연동 및 Raw JSON 저장 (`ingest_api.py`) 완료
- [ ] **정규화**: Law, Article, Clause 엔티티 파싱 및 저장 (`normalize.py`) 완료
- [ ] **그래프 적재**: Neo4j에 노드/엣지 생성 (`build_graph.py`) 완료
- [ ] **문서 임베딩**: PDF 텍스트 추출 및 ChromaDB 적재 (`chunk_docs.py`) 완료"

# 3. 검색(RAG) 엔진 구현
gh issue create --title "[RAG] 검색 엔진 구현" --body "**작업 배경**
사용자 질문에 대해 그래프 탐색과 벡터 검색을 결합한 하이브리드 검색 엔진을 구축해야 합니다.

**작업 내용**
- 엔티티 추출, 그래프/벡터 검색, 하이브리드 랭킹 로직 구현
- LLM 연동 및 응답 생성

**인수 조건**
- [ ] **엔티티 추출**: 쿼리에서 키워드/조문 번호 추출 로직 구현 완료
- [ ] **Graph Retrieval**: K-hop 이웃 탐색 Cypher 쿼리 구현 완료
- [ ] **Vector Retrieval**: Chroma 유사도 검색 구현 완료
- [ ] **Hybrid Fusion**: 검색 결과 결합 및 재순위화 로직 구현 완료
- [ ] **생성 모듈**: Ollama 연동 및 인용 형식을 강제하는 프롬프트 작성 완료"

# 4. UI 및 평가
gh issue create --title "[UI/Eval] 웹 인터페이스 및 평가" --body "**작업 배경**
사용자가 시스템을 테스트할 수 있는 웹 UI를 만들고, 검색 품질을 정량적으로 평가해야 합니다.

**작업 내용**
- Streamlit 기반 챗 인터페이스 구현
- Hit@K 등 기본 평가 지표 측정

**인수 조건**
- [ ] **웹 인터페이스**: Streamlit 채팅창 및 히스토리 관리 구현 완료
- [ ] **사이드 패널**: 그래프 경로 및 참고 문헌 시각화 구현 완료
- [ ] **평가 수행**: 테스트 셋 10개 준비 및 Hit@K 측정 완료
- [ ] **평가 수행**: Citation Rate 확인 완료"

# 5. 확장 기능
gh issue create --title "[Extended] 확장 기능 (Phase 2)" --body "**작업 배경**
MVP 이후 검색 품질을 높이기 위한 추가 기능을 구현합니다.

**작업 내용**
- 참조 관계 심화 학습 및 개념 노드 추가
- 고급 평가 파이프라인 구축

**인수 조건**
- [ ] `REFERS_TO` 관계 자동 추출 로직 구현
- [ ] 주요 법률 용어(Concept) 노드 추가
- [ ] Ragas 등을 활용한 심화 평가 수행"
