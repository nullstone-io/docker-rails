RUBY_VERSIONS_FILE := ruby_versions.txt

.PHONY: build
build:
	@while IFS= read -r version; do \
		echo "Building for Ruby $$version..."; \
		RUBY_VERSION=$$version docker buildx bake; \
	done < $(RUBY_VERSIONS_FILE)
	docker tag nullstone/rails:ruby3.4 nullstone/rails:ruby3
	docker tag nullstone/rails:ruby3.4 nullstone/rails:latest
	docker tag nullstone/rails:ruby3.4-webapp nullstone/rails:ruby3-webapp
	docker tag nullstone/rails:ruby3.4-webapp nullstone/rails:webapp

push:
	@while IFS= read -r version; do \
		echo "Building and pushing for Ruby $$version..."; \
		RUBY_VERSION=$$version docker buildx bake --push; \
	done < $(RUBY_VERSIONS_FILE)
	docker push nullstone/rails:ruby3
	docker push nullstone/rails:latest
	docker push nullstone/rails:ruby3-webapp
	docker push nullstone/rails:webapp
