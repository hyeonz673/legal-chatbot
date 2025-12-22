# Legal GraphRAG (Local-first)

> **로컬에서 구동되는 프라이버시 중심의 법률 하이브리드 RAG 시스템**

Legal GraphRAG는 법률 지식 그래프(Knowledge Graph)와 벡터 검색(Vector Search)을 결합하여, 법률 질문에 대해 검증 가능하고 할루시네이션(Hallucination)이 최소화된 답변을 제공하는 프로젝트입니다. 모든 데이터와 모델이 로컬 환경에서 안전하게 구동되도록 설계되었습니다.

## 🌟 주요 특징

*   **🔒 Local-First & Privacy**: 외부 API 의존 없이 Ollama(LLM), Neo4j Desktop(Graph), Chroma(Vector)를 활용하여 로컬에서 완벽하게 동작합니다.
*   **🕸️ Hybrid Retrieval**: 
    *   **Graph Traversal**: 법령-조문-판례 간의 연결 구조를 따라 명확한 법적 근거를 탐색합니다.
    *   **Vector Search**: 의미론적 유사도를 기반으로 관련 문맥을 찾아냅니다.
    *   이 두 가지를 결합(Fusion)하여 높은 재현율(Recall)과 정밀도(Precision)를 동시에 달성합니다.
*   **📝 Verifiable Citations**: LLM이 생성한 답변에 반드시 실제 법령/조문/판례의 출처를 명시하도록 강제하여 신뢰성을 보장합니다.

## 🏗️ 아키텍처

```mermaid
graph TD
    subgraph "Data Pipeline (ETL)"
        RAW[법령 API/PDF] -->|Ingest| NORM[정규화 (Law/Article)]
        NORM -->|Build| KG[(Neo4j Graph DB)]
        NORM -->|Chunking| VEC[(Chroma Vector DB)]
        KG <-->|Linking| VEC
    end

    subgraph "Retrieval & Generation (RAG)"
        Q[User Query] -->|Extract| ENT[Entity/Keyword]
        ENT -->|Traverse| KG_RES[Graph Context]
        Q -->|Vector Search| VEC_RES[Vector Context]
        
        KG_RES & VEC_RES -->|Fusion & Rerank| CTX[Top-K Context]
        CTX -->|Prompt| LLM[Local LLM (Ollama)]
        LLM -->|Generate| ANS[Answer w/ Citation]
    end
```

## 🛠️ 기술 스택

| 분류 | 기술 | 비고 |
| --- | --- | --- |
| **Language** | Python 3.10+ | |
| **LLM** | Ollama | Llama 3, Qwen 2.5 등 사용 |
| **Graph DB** | Neo4j Desktop | 지식 그래프 저장소 |
| **Vector DB** | Chroma | 임베딩 벡터 저장소 |
| **Embedding** | bge-m3 / e5 | 로컬 임베딩 모델 |
| **Framework** | FastAPI / Streamlit | 백엔드 및 UI |

## 🚀 시작하기 (Getting Started)

### 사전 요구사항 (Prerequisites)
1.  **[Neo4j Desktop](https://neo4j.com/download/)** 설치 및 실행
2.  **[Ollama](https://ollama.com/)** 설치 및 모델 다운로드 (`ollama pull llama3`)
3.  Python 3.10 이상

### 설치 (Installation)

```bash
# 저장소 클론
git clone https://github.com/hyeonz673/legal-graph-rag.git
cd legal-graph-rag

# 가상환경 생성 및 활성화
python -m venv venv
source venv/bin/activate  # Mac/Linux
# venv\Scripts\activate  # Windows

# 의존성 설치 (추후 requirements.txt 생성 예정)
# pip install -r requirements.txt
```

### 실행 (Usage) - *개발 예정*

1.  **데이터 수집 및 적재**
    ```bash
    python pipeline/ingest_api.py
    python pipeline/build_graph.py
    ```

2.  **웹 인터페이스 실행**
    ```bash
    streamlit run app.py
    ```

## 📂 프로젝트 구조

```
legal-graph-rag/
├── data/               # Raw 데이터 및 DB 파일
├── docs/               # 문서 (PRD, Ideation, Task)
├── pipeline/           # ETL 파이프라인 스크립트
│   ├── ingest_api.py
│   └── build_graph.py
├── rag/                # RAG 검색 및 생성 로직
└── app.py              # Streamlit UI 진입점
```

## 📜 문서
상세한 기획 및 개발 계획은 다음 문서들을 참고하세요.
*   [제품 요구사항 정의서 (PRD)](./docs/PRD.md)
*   [개발 태스크 목록 (Task)](./docs/Task.md)
*   [아이디에이션 노트 (Ideation)](./docs/Ideation.md)

## 🤝 기여 (Contributing)
이 프로젝트는 학습 및 포트폴리오 목적으로 진행 중입니다. 이슈 및 PR 환영합니다!
