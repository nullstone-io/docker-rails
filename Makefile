build:
	# Ruby 3.0
	docker build -t nullstone/rails:ruby3.0 -f 3.0/Dockerfile .
	docker build -t nullstone/rails:webapp-ruby3.0 -f 3.0/webapp/Dockerfile .
	# Ruby 3.1
	docker build -t nullstone/rails:ruby3.1 -f 3.1/Dockerfile .
	docker build -t nullstone/rails:webapp-ruby3.1 -f 3.1/webapp/Dockerfile .

tags:
	# Ruby 3
	docker tag nullstone/rails:ruby3.1 nullstone/rails:ruby3
	docker tag nullstone/rails:ruby3.1 nullstone/rails
	docker tag nullstone/rails:webapp-ruby3.1 nullstone/rails:webapp-ruby3
	docker tag nullstone/rails:webapp-ruby3.1 nullstone/rails:webapp
