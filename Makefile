build:
	# Ruby 3.0
	docker build --build-arg=3.0 -f Dockerfile              -t nullstone/rails:ruby3.0               .
	docker build --build-arg=3.0 -f local.Dockerfile        -t nullstone/rails:ruby3.0-local         .
	docker build --build-arg=3.0 -f webapp/Dockerfile       -t nullstone/rails:webapp-ruby3.0        .
	docker build --build-arg=3.0 -f webapp/local.Dockerfile -t nullstone/rails:webapp-ruby3.0-local  .
	# Ruby 3.1
	docker build --build-arg=3.1 -f Dockerfile              -t nullstone/rails:ruby3.1               .
	docker build --build-arg=3.1 -f local.Dockerfile        -t nullstone/rails:ruby3.1-local         .
	docker build --build-arg=3.1 -f webapp/Dockerfile       -t nullstone/rails:webapp-ruby3.1        .
	docker build --build-arg=3.1 -f webapp/local.Dockerfile -t nullstone/rails:webapp-ruby3.1-local  .

tags:
	# Ruby 3
	docker tag nullstone/rails:ruby3.1       nullstone/rails:ruby3
	docker tag nullstone/rails:ruby3.1       nullstone/rails
	docker tag nullstone/rails:ruby3.1-local nullstone/rails:ruby3-local
	docker tag nullstone/rails:ruby3.1-local nullstone/rails:local

	docker tag nullstone/rails:webapp-ruby3.1       nullstone/rails:webapp-ruby3
	docker tag nullstone/rails:webapp-ruby3.1       nullstone/rails:webapp
	docker tag nullstone/rails:webapp-ruby3.1-local nullstone/rails:webapp-ruby3-local
	docker tag nullstone/rails:webapp-ruby3.1-local nullstone/rails:webapp-local

push:
	docker push nullstone/rails:ruby3.0
	docker push nullstone/rails:ruby3.0-local

	docker push nullstone/rails:webapp-ruby3.0
	docker push nullstone/rails:webapp-ruby3.0-local

	docker push nullstone/rails:ruby3.1
	docker push nullstone/rails:ruby3.1-local
	docker push nullstone/rails:ruby3
	docker push nullstone/rails:ruby3-local
	docker push nullstone/rails
	docker push nullstone/rails:local

	docker push nullstone/rails:webapp-ruby3.1
	docker push nullstone/rails:webapp-ruby3.1-local
	docker push nullstone/rails:webapp-ruby3
	docker push nullstone/rails:webapp-ruby3-local
	docker push nullstone/rails:webapp
	docker push nullstone/rails:webapp-local
