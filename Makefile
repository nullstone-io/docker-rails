build:
	docker buildx bake \
		-f docker-bake.3-2.hcl \
		-f docker-bake.3-1.hcl \
		-f docker-bake.3-0.hcl \
		-f docker-bake.2-7.hcl

push:
	docker buildx bake --push \
		-f docker-bake.3-2.hcl \
		-f docker-bake.3-1.hcl \
		-f docker-bake.3-0.hcl \
		-f docker-bake.2-7.hcl
