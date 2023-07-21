build:
	docker buildx bake -f docker-bake.3-2.hcl
	docker buildx bake -f docker-bake.3-1.hcl
	docker buildx bake -f docker-bake.3-0.hcl
	docker buildx bake -f docker-bake.2-7.hcl

push:
	docker buildx bake --push -f docker-bake.3-2.hcl
	docker buildx bake --push -f docker-bake.3-1.hcl
	docker buildx bake --push -f docker-bake.3-0.hcl
	docker buildx bake --push -f docker-bake.2-7.hcl
