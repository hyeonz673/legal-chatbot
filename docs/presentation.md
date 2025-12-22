---
marp: true
theme: gaia
class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.svg')
style: |
  section { font-family: 'Pretendard', sans-serif; }
  h1 { font-size: 2.5em; color: #333; }
  h2 { font-size: 1.8em; color: #555; }
  strong { color: #0066cc; }
---

# Legal GraphRAG
## Local-first Privacy-focused Legal RAG

**검증 가능한 법률 AI 어시스턴트**

---

# 1. 프로젝트 개요

## Vision
**"Legal GraphRAG (Local-first)"**
법률 지식 그래프(KG)와 벡터 검색을 결합하여, **검증 가능하고 근거가 확실한** 법률 답변을 제공하는 로컬 우선 RAG 시스템

## 핵심 가치
*   🔒 **Local-First**: 데이터 유출 걱정 없는 로컬 환경 (Ollama, Neo4j, Chroma)
*   🕸️ **Hybrid Retrieval**: Graph + Vector 결합으로 정확도 향상
*   ⚖️ **Verifiable**: 엄격한 출처(법령/조문) 인용 강제

---

# 2. 핵심 목표

1.  **로컬 보안 (Privacy)**
    *   모든 인프라를 로컬 머신에서 구동
    *   민감한 법률/내부 문서 보호

2.  **정확성 (Accuracy)**
    *   하이브리드 검색으로 "환각(Hallucination)" 최소화
    *   그래프 탐색으로 법적 연결성(준용/참조) 고려

3.  **검증 가능성 (Groundedness)**
    *   사용자가 원문을 바로 확인할 수 있도록 **인용** 필수 제공

---

# 3. 기술 스택 (Local Stack)

| 구분 | 기술 | 설명 |
| :--- | :--- | :--- |
| **Lang** | Python 3.10+ | 주 개발 언어 |
| **G-DB** | **Neo4j Desktop** | 지식 그래프, 시각화 |
| **V-DB** | **Chroma** | 경량 벡터 저장소 |
| **LLM** | **Ollama** | Llama 3, Qwen 2.5 (Local) |
| **UI** | Streamlit | 빠른 프로토타이핑 |

---

# 4. 시스템 아키텍처

![width:900px](https://mermaid.ink/img/pako:eNqNVE1v2zAM_SuEzmkD-4PtYYc2Q9Fh22EYCvTBcixbaiRJ9BAnGfrvIyU_kixD0Q6JRD5-fCQlP7AylYKBgvpG2Q8WSsN6oy07S2jBftFaK4ZetD-w54ft-4_Xb9827z_2r9v3H_v37_92r2f_8tV-3b7_fvr8-WOf0A6g_c-v3_2F4Y8_P2wX_P1_h_a1_Xz6E5Yfnz7j1_c_gXJAB5-54hB_LPhk8U9hOViQn_FjCSx4Q2hGExQWvWSwcIXWjR4s8LhAC5-4sNAb5i343FjQzFuQYMEU-Mxc0NAYUC_yT_B5sSCtD6wF_0FpY84yE3A0x6bWn6F6FvKk9C2fF3iH52BvS4N7C_QO4y04R6W7kR6C4r0p1Y9wToQd-R0M743k5Fqf9zBnkHjW3E42tQhW0Y33aD_B8xGvJ1hIuJ5xN8E6iK-gdwjW4HWM3eQ6F6u47yDeRLAOZk_wXmDqA-w2yHlC7wB6g01Xk3M_4fJCrN7jcgfROtQeJze52sL6g3Qd_Ppw-4r6E6TbyW4W29vJ-S5W34346hH6W3h9gtdnWH3F3QTrW4hfwO8wuh-o_gG7B_E6hO5H6h-we5Csg9lH3J1b9yBdh9H9yG-u_gG7B_E6mH3E3QTrW8h_AL_D6H7kd1f_gN2DeB1C9xN3M9a_G_EL-B1G9xP1L9g9SNbB7BPujrgH8TqM7kfqH7B7EK_D6H7ibob1LeQ_gN9hdD_x8oK7B_E6hO4n7ia6B52d8P5g_QP-DrN78O0I3c_oHsTrYG8PczfB-hbyH8DvMLqfqH_B7kGyDmYf4X5F_QnydRid-6H6B-wexOsQuh9h30L_A3YPknUw-4T7FfUniNdh_BLmH7B7EK-D2UfcTbC-hfwH8DuM7gfuJqh_wO5Bsg6h8wn3M67_QbwOo_sJ9yvsH3T2QbwO9vYwdzOsb9HZCb_D6HzC_YrrfxCvQ_wS9h-ue5Cug9lHuJux_gX7D5J1CJ1PuJ9x_Q_idRjdT7hfYf-gs9OIrx6hbw9zN8P6Fp2d8DuMzifcr7j-B_E6hM4n3K_Q_4Ddg2QdzD7C3YzrfxAvg9H9hPsV9g86Oxnx1SP0tjB3E6xvcXmB32F0PuF-xfU_iNchdD7hfoX-B-weJOtg9hHuZlz_g3gZRu_C7B_8e072Fp2dTPh8hN4G7ia6B909vF7A7zC6n7hfcf0P4nUInUfcT7j-B_E6jN6D2UfcTXQPdvcwX8DvMLqfuJ_x-oN4HULnEfcT7j909kG8DqM3u8xHuJvoHmx2wvsDvw6j-4n7Gdd_IF6H0HnE_YT7D519EK_D6M228xHuJroHu3vw7Qjdd7ufuJ9x_QfidQidR9xPuP_Q2QfxOoze7D8f4W6ie7C7B9-O0P3M_YT7CfcfoHfY1mF0P_LygbuJ7sFmJ7w_8OsQuh-5n3D_4foPxOsQuh-5n3D_obMP4nUYvdlPPsLdRPdgdw--HaH7M_cT7idc_4F4HUL3E-4_dPZBvA6jN_vFR7ib6B5sdtrw1SP03e5-5n7C_YTrPxCvQ-h-wv2Hzj6I12H0Zr_6CHcT3YPNTngZgN9hdD9yP-H6H8TrELqfcP-hsw_idRi92d8-wt1E92B3D74doftz9xPuJ9x_gN5hW4fR_cjLB-4mgN9hW4ftLgT5W6jtoLKDwgoKC9-i_bN5_wEAAP__K57b7w)

*API 수집 → 정규화 → 그래프(Neo4j)/벡터(Chroma) 적재 → 하이브리드 검색 → LLM 생성*

---

# 5. 데이터 파이프라인

1.  **Ingestion**: 법제처 API 수집 (JSON)
2.  **Normalization**: `Law` / `Article` 분리 및 정규화
3.  **Construction**: Neo4j 노드/엣지 생성
    *   `(Law)-[:HAS]->(Article)`
    *   `(Case)-[:CITES]->(Article)`
4.  **Embedding**: 판례/문서 Chunking & Vectorization

---

# 6. 하이브리드 검색 전략

**"Graph로 범위를 좁히고, Vector로 정밀도를 높인다"**

1.  **Step A: Graph Retrieval**
    *   검색어 ("해지 환급금") → 엔티티 추출 → 그래프 2-hop 탐색
    *   관련 조문/개념 후보군 확보 (High Recall)

2.  **Step B: Vector Scoring**
    *   그래프 후보 + 벡터 검색 후보 결합
    *   유사도 기반 재순위화 (Reranking)

---

# 7. 데이터 모델 (Schema)

*   **Nodes**
    *   `Law` (법령)
    *   `Article` (조문)
    *   `Case` (판례)
    *   `Concept` (개념 - *Phase 2*)
    *   `DocumentChunk` (벡터 청크)

*   **Edges**
    *   `HAS_ARTICLE`, `REFERS_TO`, `CITES`, `DEFINED_IN`, `MENTIONS`

---

# 8. 성공 지표 (Metrics)

*   **검색 성능**
    *   🎯 **Hit@K**: 정답 조문이 Top-5 안에 있는가?
    *   🌐 **Graph Coverage**: 그래프 연결성 활용도

*   **답변 품질**
    *   📢 **Citation Rate**: 인용이 포함된 문장 비율
    *   ✅ **Groundedness**: 답변의 근거가 검색 결과에 있는가?

---

# 9. 로드맵

1.  **Phase 1 (MVP)** - *Current*
    *   기본 파이프라인 구축 & 하이브리드 검색 구현
    *   Streamlit 데모 완성

2.  **Phase 2 (Extension)**
    *   개념(Concept) 그래프 확장
    *   심화 평가 (Ragas) 및 UI 고도화

---

# 감사합니다

**질문 있으신가요?**

*GitHub: https://github.com/hyeonz673/legal-graph-rag*
