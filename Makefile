build:
	docker buildx bake -f docker-bake.3-0.hcl
	docker buildx bake -f docker-bake.3-1.hcl

push:
	docker buildx bake -f docker-bake.3-0.hcl --push
	docker buildx bake -f docker-bake.3-1.hcl --push
