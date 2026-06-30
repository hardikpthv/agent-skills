#!/usr/bin/env bash
#
# install.sh — copy the free agent-skills into your AI agent's skills directory.
#
# Usage:
#   ./install.sh <target>
#
# <target> is an agent name (installs to its GLOBAL skills dir) or any path:
#   claude        ~/.claude/skills
#   codex         ~/.codex/skills
#   antigravity   ~/.gemini/config/skills
#   <path>        any directory you give (use this for Cursor / per-project installs,
#                 e.g. ~/my-project/.cursor/skills  or  ~/my-project/.agents/skills)
#
# Skills are the portable SKILL.md folders under skills/<category>/<skill>/.
# After installing, restart your agent — skills load at startup.

set -euo pipefail
cd "$(dirname "$0")"

target="${1:-}"
case "$target" in
  claude)       DEST="$HOME/.claude/skills" ;;
  codex)        DEST="$HOME/.codex/skills" ;;
  antigravity)  DEST="$HOME/.gemini/config/skills" ;;
  cursor)
    echo "Cursor is project-scoped — pass a path instead, e.g.:" >&2
    echo "  ./install.sh /path/to/your-project/.cursor/skills" >&2
    exit 1 ;;
  ""|-h|--help)
    sed -n '3,16p' "$0" | sed 's/^# \{0,1\}//'
    exit 0 ;;
  *)            DEST="$target" ;;
esac

mkdir -p "$DEST"
n=0
for d in skills/*/*/; do
  [ -f "${d}SKILL.md" ] || continue   # skip .claude-plugin metadata dirs
  cp -R "${d%/}" "$DEST/"
  n=$((n + 1))
done

echo "Installed $n skill(s) into $DEST"
