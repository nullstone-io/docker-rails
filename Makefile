RUBY_VERSIONS_FILE := ruby_versions.txt

.PHONY: build
build:
	@while IFS= read -r version; do \
		echo "Building for Ruby $$version..."; \
		RUBY_VERSION=$$version docker buildx bake; \
	done < $(RUBY_VERSIONS_FILE)

push:
	@while IFS= read -r version; do \
		echo "Building and pushing for Ruby $$version..."; \
		RUBY_VERSION=$$version docker buildx bake --push; \
	done < $(RUBY_VERSIONS_FILE)
