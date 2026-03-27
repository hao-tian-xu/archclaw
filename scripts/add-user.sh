#!/bin/bash
# Add a new ArchClaw user workspace
# Usage: ./scripts/add-user.sh <user-id>
#
# Creates a clean workspace copy from the template (workspace/)
# and prints the config snippet to add to openclaw.json.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

USER_ID="${1:-}"
if [[ -z "$USER_ID" ]]; then
  echo "Usage: $0 <user-id>"
  echo "Example: $0 alice"
  exit 1
fi

SRC="$PROJECT_DIR/workspace-dev"
DEST="$PROJECT_DIR/workspace-${USER_ID}"

if [[ -d "$DEST" ]]; then
  echo "Error: $DEST already exists"
  exit 1
fi

echo "Creating workspace for '$USER_ID'..."
cp -r "$SRC" "$DEST"

# Clear runtime state
rm -rf "$DEST/memory/"*
rm -rf "$DEST/digests/"*
# Keep project templates, clear any actual project files
find "$DEST/projects" -name "*.md" ! -name "_TEMPLATE.md" ! -name "README.md" -delete 2>/dev/null || true

echo "Done. Workspace created at: $DEST"
echo ""
echo "=== Add to openclaw.json ==="
echo ""
echo "In agents.list, add:"
echo "  { \"id\": \"${USER_ID}\", \"workspace\": \"<WORKSPACE_PATH>/workspace-${USER_ID}\" }"
echo ""
echo "In bindings, add (replace <CHAT_ID> with the user's Telegram/channel ID):"
echo "  { \"agentId\": \"${USER_ID}\", \"match\": { \"channel\": \"telegram\", \"peer\": { \"kind\": \"direct\", \"id\": \"<CHAT_ID>\" } } }"
echo ""
echo "Then restart the gateway."
