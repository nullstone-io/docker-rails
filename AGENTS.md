# AGENTS.md

This repo builds a set of opinionated Rails base images, one per Ruby version,
in two variants (`Dockerfile` and `webapp/Dockerfile`). The list of Ruby
versions to build lives in `ruby_versions.txt`, and a small set of "common"
tags (`latest`, `ruby3`, `webapp`, `ruby3-webapp`) point at the current default.

This document describes the routine maintenance process for keeping the images
current with upstream Ruby releases.

## How the pieces fit together

- `ruby_versions.txt` — one Ruby tag per line. Each line is built as
  `nullstone/rails:ruby<version>` (and `...-webapp`) from the matching
  `ruby:<version>-alpine` base image. Every line **must** have a corresponding
  `ruby:<version>-alpine` image on Docker Hub, or the build fails.
- `docker-bake.hcl` — defines the `normal` and `webapp` build targets, both
  parameterized by `RUBY_VERSION`.
- `Makefile` — loops over `ruby_versions.txt` to build/push every version, then
  applies the common tags. `LATEST_RUBY` / `LATEST_RUBY_MAJOR` control which
  version the common tags track.
- `.github/workflows/build.yml` — same work as the Makefile, but builds every
  version **in parallel** via a build matrix generated from `ruby_versions.txt`,
  then applies the common tags in a final `retag` job. Has its own
  `LATEST_RUBY` / `LATEST_RUBY_MAJOR` env vars that must stay in sync with the
  Makefile.

## Routine: add newly released Ruby patch versions

Do this periodically (e.g. monthly) to pick up new patch releases.

1. **Find the latest available tags.** Only `*-alpine` tags that exist on
   Docker Hub can be built. List them per series:

   ```sh
   for series in 3.4 3.3 3.2 3.1 3.0 2.7; do
     echo "=== $series ==="
     curl -s "https://hub.docker.com/v2/repositories/library/ruby/tags?page_size=100&name=${series}." \
       | jq -r '.results[].name | select(endswith("-alpine"))' | sort -V
   done
   ```

2. **Update `ruby_versions.txt`.** Add any new patch versions, keeping the
   existing structure: each minor series is grouped together, the bare minor
   (e.g. `3.4`) first, then patches in ascending order. Do not remove existing
   lines (consumers may pin to a specific patch). End-of-life series
   (currently `3.0`, `2.7`) simply stop receiving new patches.

3. **Build & publish** with the Makefile (`make push`) or by running the
   GitHub Actions workflow manually (Actions → "Build and Push" → "Run
   workflow"; it is `workflow_dispatch`-only).

## Routine: promote a new Ruby minor to the common tags

When a new Ruby minor becomes the default (e.g. `3.5` is released), the common
tags (`latest`, `ruby3`, `webapp`, `ruby3-webapp`) should follow it.

1. Add the new minor and its patches to `ruby_versions.txt` (see above).
2. Bump **both** copies of the latest-version knobs, and keep them identical:
   - `Makefile`: `LATEST_RUBY` (and `LATEST_RUBY_MAJOR` if the major changed)
   - `.github/workflows/build.yml`: the `LATEST_RUBY` / `LATEST_RUBY_MAJOR`
     `env` values
3. Update the supported-tags table in `README.md`.
4. Build & publish.

## How the common tags are applied

The common tags are never built directly — they are re-pointed at the latest
already-built image:

- `make retag` (local builds) uses `docker tag`.
- `make retag-push` and the workflow's `retag` job use
  `docker buildx imagetools create`, which copies the existing registry
  manifest (multi-arch safe, no pull/rebuild required).

Both resolve to:

| Common tag      | Points at                |
| --------------- | ------------------------ |
| `latest`        | `ruby<LATEST_RUBY>`        |
| `ruby3`         | `ruby<LATEST_RUBY>`        |
| `webapp`        | `ruby<LATEST_RUBY>-webapp` |
| `ruby3-webapp`  | `ruby<LATEST_RUBY>-webapp` |

## Building locally

```sh
# Build everything in ruby_versions.txt and apply common tags locally
make build

# Build one version
RUBY_VERSION=3.4 docker buildx bake

# Build, push, and publish common tags (requires Docker Hub auth)
make push
```

## CI credentials

The workflow authenticates to Docker Hub with the `DOCKERHUB_USERNAME` and
`DOCKERHUB_TOKEN` repository secrets. Ensure these exist (Settings → Secrets and
variables → Actions) before the workflow can push.
