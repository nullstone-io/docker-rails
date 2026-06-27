IMAGE := nullstone/rails
RUBY_VERSIONS_FILE := ruby_versions.txt

# The Ruby minor version that the "common" tags should track.
# Bump this (and add the new versions to $(RUBY_VERSIONS_FILE)) when a newer
# Ruby minor becomes the default. See AGENTS.md for the full process.
#   latest, ruby$(LATEST_RUBY_MAJOR)          -> ruby$(LATEST_RUBY)
#   webapp, ruby$(LATEST_RUBY_MAJOR)-webapp   -> ruby$(LATEST_RUBY)-webapp
LATEST_RUBY := 3.4
LATEST_RUBY_MAJOR := 3

.PHONY: build push retag retag-push

build:
	@while IFS= read -r version; do \
		echo "Building for Ruby $$version..."; \
		RUBY_VERSION=$$version docker buildx bake; \
	done < $(RUBY_VERSIONS_FILE)
	@$(MAKE) retag

# Point the common tags at the latest locally-built image
retag:
	docker tag $(IMAGE):ruby$(LATEST_RUBY) $(IMAGE):ruby$(LATEST_RUBY_MAJOR)
	docker tag $(IMAGE):ruby$(LATEST_RUBY) $(IMAGE):latest
	docker tag $(IMAGE):ruby$(LATEST_RUBY)-webapp $(IMAGE):ruby$(LATEST_RUBY_MAJOR)-webapp
	docker tag $(IMAGE):ruby$(LATEST_RUBY)-webapp $(IMAGE):webapp

push:
	@while IFS= read -r version; do \
		echo "Building and pushing for Ruby $$version..."; \
		RUBY_VERSION=$$version docker buildx bake --push; \
	done < $(RUBY_VERSIONS_FILE)
	@$(MAKE) retag-push

# Publish the common tags in the registry, pointing at the latest pushed image.
# imagetools copies the existing manifest, so no local build/pull is required.
retag-push:
	docker buildx imagetools create \
		-t $(IMAGE):ruby$(LATEST_RUBY_MAJOR) \
		-t $(IMAGE):latest \
		$(IMAGE):ruby$(LATEST_RUBY)
	docker buildx imagetools create \
		-t $(IMAGE):ruby$(LATEST_RUBY_MAJOR)-webapp \
		-t $(IMAGE):webapp \
		$(IMAGE):ruby$(LATEST_RUBY)-webapp
