#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="$ROOT_DIR/src"
APP_DIR="$SRC_DIR/app"

echo "Creating directory structure..."
mkdir -p "$APP_DIR"

create_if_missing() {
  local file_path="$1"
  local content="$2"

  if [[ -f "$file_path" ]]; then
    echo "Skipping existing file: ${file_path#"$ROOT_DIR/"}"
  else
    printf '%s\n' "$content" > "$file_path"
    echo "Created ${file_path#"$ROOT_DIR/"}"
  fi
}

app_page_content='export default function HomePage() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center bg-white text-gray-900">
      <h1 className="text-3xl font-bold">Welcome to Liberal Arts Portal</h1>
      <p className="mt-4 text-lg text-gray-600">
        Explore announcements, manage your schedule, and stay connected.
      </p>
    </main>
  );
}
'

create_if_missing "$APP_DIR/page.tsx" "$app_page_content"

declare -a app_sections=("login" "signup" "board" "notices" "calendar")

for section in "${app_sections[@]}"; do
  section_dir="$APP_DIR/$section"
  mkdir -p "$section_dir"

  first_char="${section:0:1}"
  rest="${section:1}"
  section_title="$(printf '%s%s' "$(printf '%s' "$first_char" | tr '[:lower:]' '[:upper:]')" "$rest")"

  create_if_missing "$section_dir/page.tsx" "export default function ${section_title}Page() {
  return (
    <main className=\"flex min-h-screen items-center justify-center\">
      <h1 className=\"text-2xl font-semibold\">${section_title} Page</h1>
    </main>
  );
}
"
done

placeholder_entries=(
  "$SRC_DIR/components|Shared components live here."
  "$SRC_DIR/lib|Utility functions and API clients live here."
  "$SRC_DIR/styles|Global styles and Tailwind configuration live here."
  "$SRC_DIR/types|Shared TypeScript types live here."
)

for entry in "${placeholder_entries[@]}"; do
  dir="${entry%%|*}"
  description="${entry#*|}"
  mkdir -p "$dir"
  create_if_missing "$dir/README.md" "# $(basename "$dir")

$description
"
done

echo "All done!"
