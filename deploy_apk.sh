#!/bin/bash
set -e

SOURCE_APK="/Users/imac/Documents/GitHub/Water Connection/Flutter-WaterConnection/build/app/outputs/flutter-apk/app-release.apk"
TARGET_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_APK="$TARGET_DIR/app-release.apk"

if [ ! -f "$SOURCE_APK" ]; then
  echo "❌ Error: Flutter release APK not found at $SOURCE_APK"
  echo "Please run 'flutter build apk --release' inside Flutter-WaterConnection first."
  exit 1
fi

echo "📦 Copying latest built APK from Flutter project..."
cp "$SOURCE_APK" "$TARGET_APK"

echo "🚀 Committing and pushing to GitHub..."
cd "$TARGET_DIR"
git add app-release.apk
git commit -m "Update app-release.apk [$(date +'%Y-%m-%d %H:%M:%S')]" || echo "No changes in APK file to commit."
git push origin main

echo ""
echo "✅ Success! APK updated on GitHub."
echo "Direct Download Link (stays the same):"
echo "https://github.com/vivekt-technoproject/water-connection-apk/raw/main/app-release.apk"
