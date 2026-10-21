#!/usr/bin/env bash
set -euo pipefail

# Installation script for Google Antigravity / Gemini CLI
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_DIR="${HOME}/.gemini/config"
SKILLS_DIR="${CONFIG_DIR}/skills"
RULES_DIR="${CONFIG_DIR}/rules"

echo "Installing Antigravity-adapted skills into ${SKILLS_DIR}..."

mkdir -p "${SKILLS_DIR}"
mkdir -p "${RULES_DIR}"

# Copy skills
for category in engineering productivity; do
  if [ -d "${SCRIPT_DIR}/skills/${category}" ]; then
    cp -r "${SCRIPT_DIR}/skills/${category}/"* "${SKILLS_DIR}/"
  fi
done

# Copy interactive execution rule
if [ -f "${SCRIPT_DIR}/rules/interactive_skills.md" ]; then
  cp "${SCRIPT_DIR}/rules/interactive_skills.md" "${RULES_DIR}/"
fi

echo "Successfully installed Antigravity skills and interactive rule."
