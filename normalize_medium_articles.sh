#!/usr/bin/env bash
set -euo pipefail

# Always run from repo root
cd "$(dirname "$0")"

echo "=== Normalizing Medium_Articles structure ==="

########################################
# 1. Rename article folders (if exist) #
########################################

# How Finite-Field Reasoning Can Transform AI Cognition → 
finite_field_reasoning_ai_cognition
if [ -d "drafts/How Finite-Field Reasoning Can Transform AI Cognition" ]; 
then
  echo "Renaming 'How Finite-Field Reasoning Can Transform AI Cognition' 
-> finite_field_reasoning_ai_cognition"
  mv "drafts/How Finite-Field Reasoning Can Transform AI Cognition" 
"drafts/finite_field_reasoning_ai_cognition"
fi

# LLMs Service dogs → llms_service_dogs
if [ -d "drafts/LLMs Service dogs" ]; then
  echo "Renaming 'LLMs Service dogs' -> llms_service_dogs"
  mv "drafts/LLMs Service dogs" "drafts/llms_service_dogs"
fi

# Tokenization + Algebra  (note the space) → tokenization_algebra
if [ -d "drafts/Tokenization + Algebra " ]; then
  echo "Renaming 'Tokenization + Algebra ' -> tokenization_algebra"
  mv "drafts/Tokenization + Algebra " "drafts/tokenization_algebra"
fi

# cognitive suffle word article → cognitive_shuffle_article
if [ -d "drafts/cognitive suffle word article" ]; then
  echo "Renaming 'cognitive suffle word article' -> 
cognitive_shuffle_article"
  mv "drafts/cognitive suffle word article" 
"drafts/cognitive_shuffle_article"
fi

# primes → prime_structures
if [ -d "drafts/primes" ]; then
  echo "Renaming 'primes' -> prime_structures"
  mv "drafts/primes" "drafts/prime_structures"
fi

# publishers → publishers_meta (optional)
if [ -d "drafts/publishers" ]; then
  echo "Renaming 'publishers' -> publishers_meta"
  mv "drafts/publishers" "drafts/publishers_meta"
fi

# untitled folder → misc_snaps (optional)
if [ -d "drafts/untitled folder" ]; then
  echo "Renaming 'untitled folder' -> misc_snaps"
  mv "drafts/untitled folder" "drafts/misc_snaps"
fi

####################################################
# 2. Create per-article substructure where relevant #
####################################################

ARTICLES=(
  "finite_field_reasoning_ai_cognition"
  "llms_service_dogs"
  "tokenization_algebra"
  "cognitive_shuffle_article"
  "prime_structures"
)

for article in "${ARTICLES[@]}"; do
  if [ -d "drafts/$article" ]; then
    echo "Structuring drafts/$article"

    mkdir -p "drafts/$article/images"
    mkdir -p "drafts/$article/pdfs"
    mkdir -p "drafts/$article/notes"

    # Move files in the article root into subfolders
    for f in "drafts/$article"/*; do
      [ -e "$f" ] || continue     # skip if nothing matches
      [ -f "$f" ] || continue     # only handle plain files

      base=$(basename "$f")

      case "$base" in
        images|pdfs|notes)
          # Skip our own subdirs
          continue
          ;;
      esac

      case "$base" in
        *.png|*.jpg|*.jpeg|*.gif|*.svg)
          echo "  -> image: $base -> images/"
          mv "$f" "drafts/$article/images/"
          ;;
        *.pdf)
          echo "  -> pdf: $base -> pdfs/"
          mv "$f" "drafts/$article/pdfs/"
          ;;
        *.md|*.txt|*.html)
          echo "  -> text: $base -> notes/"
          mv "$f" "drafts/$article/notes/"
          ;;
        *)
          echo "  -> leaving in root: $base"
          ;;
      esac
    done
  fi
done

echo "=== Done. Review with 'ls drafts' and 'git status'. ==="

