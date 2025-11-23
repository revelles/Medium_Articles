#!/usr/bin/env bash
set -euo pipefail

echo "=== Medium_Articles repo restructuring ==="

ROOT_DIR="$(pwd)"
echo "Working in: $ROOT_DIR"

############################
# 1. Create base structure #
############################

mkdir -p drafts
mkdir -p published
mkdir -p templates
mkdir -p assets/global_images
mkdir -p assets/diagrams
mkdir -p assets/data_csv
mkdir -p assets/pdfs
mkdir -p drafts/misc

############################
# 2. Create templates (if not present)
############################

if [ ! -f "templates/article_template.md" ]; then
cat > templates/article_template.md << 'EOF'
# Article Title

## 1. Context & Problem

## 2. Innovation Layer – Prior Art

## 3. Innovation Layer – Analytical Gaps

## 4. Innovation Layer – New Knowledge

## 5. Structure for Medium

- Hook
- Problem framing
- Core argument
- Examples / analogies
- Takeaways

EOF
fi

if [ ! -f "templates/research_notes_template.md" ]; then
cat > templates/research_notes_template.md << 'EOF'
# Research Notes

## Questions

## References

## Key Claims

## Open Threads

EOF
fi

if [ ! -f "templates/citation_format.md" ]; then
cat > templates/citation_format.md << 'EOF'
# Citation Format

- Author, "Title", Source, Year, URL (if applicable).
- For legal: Case Name, Reporter, Page (Court Year).
EOF
fi

############################
# 3. Create README and .gitignore if missing
############################

if [ ! -f "README.md" ]; then
cat > README.md << 'EOF'
# Medium Articles – Francisco Revelles

This repository contains drafts, notes, and published versions of my 
Medium
articles, organized by project.

- drafts/: Active work per article or concept
- published/: Final or near-final articles
- templates/: Reusable scaffolds for writing and research
- assets/: Shared images, diagrams, datasets, and PDFs

EOF
fi

if [ ! -f ".gitignore" ]; then
cat > .gitignore << 'EOF'
# macOS system files
.DS_Store
.AppleDouble
.apdisk
._*

# iCloud artifacts
*.icloud

# Logs
*.log

# Thumbnails
Thumbs.db

# Medium export artifacts
*.medium-export
*.html
EOF
fi

######################################
# 4. Move existing directories       #
#    → drafts/<name>/                #
######################################

echo "Moving existing top-level directories into drafts/ (except core 
dirs)..."

for d in */ ; do
  case "$d" in
    drafts/|published/|templates/|assets/|.git/ )
      # skip our new/core directories
      continue
      ;;
  esac

  if [ -d "$d" ]; then
    # Strip trailing slash
    d_no_slash="${d%/}"
    echo "  - Moving directory '$d_no_slash' -> drafts/$d_no_slash/"
    mv "$d_no_slash" "drafts/$d_no_slash"
  fi
done

######################################
# 5. Move loose files at the root    #
######################################

echo "Moving loose root-level files into assets/ or drafts/misc/..."

for f in *; do
  # only files
  if [ -f "$f" ]; then
    case "$f" in
      README.md|.gitignore|restructure_medium_repo.sh)
        # keep these at root
        continue
        ;;
      *.png|*.jpg|*.jpeg|*.gif)
        echo "  - Image: $f -> assets/global_images/"
        mv "$f" assets/global_images/
        ;;
      *.svg)
        echo "  - Diagram (svg): $f -> assets/diagrams/"
        mv "$f" assets/diagrams/
        ;;
      *.csv)
        echo "  - Data csv: $f -> assets/data_csv/"
        mv "$f" assets/data_csv/
        ;;
      *.pdf)
        echo "  - PDF: $f -> assets/pdfs/"
        mv "$f" assets/pdfs/
        ;;
      *)
        echo "  - Other file: $f -> drafts/misc/"
        mv "$f" drafts/misc/
        ;;
    esac
  fi
done

echo "=== Done. Review 'git status' to inspect changes. ==="

