build:
	docker build --build-arg RUBY_VERSION=3 -t nullstone/rails:6-ruby3 -f api.Dockerfile .
	docker build --build-arg RUBY_VERSION=3 -t nullstone/rails:6-webapp-ruby3 -f webapp.Dockerfile .

	docker build --build-arg RUBY_VERSION=3.0 -t nullstone/rails:6-ruby3.0 -f api.Dockerfile .
	docker build --build-arg RUBY_VERSION=3.0 -t nullstone/rails:6-webapp-ruby3.0 -f webapp.Dockerfile .
