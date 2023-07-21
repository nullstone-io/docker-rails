build:
	docker buildx bake

push:
	docker buildx bake --push
