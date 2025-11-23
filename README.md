# Medium Articles – Francisco Revelles

This repository contains drafts, assets, and published versions of my Medium
articles. Each article lives in its own folder under `drafts/`, with a clean
substructure:

- `notes/` – outlines, drafts, exported HTML, research notes
- `images/` – figures, cover images, diagrams
- `pdfs/` – Medium print views, reference PDFs

The repo is designed to be friendly to both humans and tools (LLMs, scripts,
and future automation).

---

## Repository Layout

- `drafts/` – active and in-progress article projects
- `published/` – finalized or near-final copies (optional, can mirror Medium)
- `templates/` – reusable scaffolds for new pieces
- `assets/` – shared/global assets not tied to a single article
- `restructure_medium_repo.sh` / `normalize_medium_articles.sh` – maintenance scripts

---

## Article Projects

### 1. Finite-Field Reasoning and AI Cognition

- Folder: `drafts/finite_field_reasoning_ai_cognition/`
- Theme: How finite fields and modular structures can improve the way large
  language models represent, update, and preserve knowledge.
- Status: In development / extension of prior finite-field pieces.

Contents (typical):
- `notes/` – article draft, outlines, exported HTML
- `images/` – conceptual diagrams for memory, cognition, and algebraic structure
- `pdfs/` – reference articles and Medium printouts if any

---

### 2. Tokenization + Algebra in LLMs

- Folder: `drafts/tokenization_algebra/`
- Theme: How language models learn to count, classify, and compute via
  tokenization, embeddings, and algebraic structure.
- Status: Published on Medium, with supporting figures and diagrams.

Typical files:
- `notes/` – main draft and revision notes
- `images/` – algebraic stack diagrams, embedding illustrations
- `pdfs/` – Medium print view of the published article

---

### 3. LLM Agents and Service Dogs

- Folder: `drafts/llms_service_dogs/`
- Theme: A conceptual and narrative comparison between LLM agents and service
  dogs: training, alignment, trust, and human–system relationships.
- Status: Draft stage.

---

### 4. Cognitive Shuffle / Word Flow Article

- Folder: `drafts/cognitive_shuffle_article/`
- Theme: Cognitive “shuffling” vs. structured word flow in humans and LLMs;
  how randomness, constraint, and pattern interact in language generation.
- Status: Draft / experimental.

---

### 5. Prime Structures

- Folder: `drafts/prime_structures/`
- Theme: Expository and conceptual pieces on primes, finite fields, and their
  role in reasoning, cryptography, and model design.
- Status: Concept + early drafts, with hero images for future articles.

---

### 6. Meta / Supporting Material

- Folder: `drafts/publishers_meta/`
- Purpose: Notes, publisher interactions, and meta-documents related to
  article placement, submissions, or platform experiments.

- Folder: `drafts/misc_snaps/`
- Purpose: Screenshots and miscellaneous images that don’t yet belong to a
  specific article project.

---

## Templates

Located in `templates/`:

- `article_template.md` – skeleton for a new article, including an
  innovation-layer outline.
- `research_notes_template.md` – structure for questions, references, and
  open problems.
- `citation_format.md` – simple citation guidance for both technical and
  legal-style references.

---

## Workflow

Typical flow for a new article:

1. Copy `templates/article_template.md` and `templates/research_notes_template.md`
   into a new folder under `drafts/`.
2. Draft and iterate in `notes/`.
3. Generate or collect figures into `images/`.
4. Export final Medium article and/or print view into `pdfs/`.
5. Optionally mirror the final text in `published/`.

This structure is designed to play well with future automation:
scripts, LLM-based analysis, and static-site or portfolio generation.
