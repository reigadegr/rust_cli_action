#!/bin/sh
tag_name="v1.0.0"
tag_description="Release v1.0.0"

git tag -a "v1.0.0" -m "Release v1.0.0"
git push origin "v1.0.0"
gh release create "$tag_name" --title "$tag_description" "./aarch64-linux-musl-cross.tgz"
