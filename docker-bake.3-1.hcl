group "default" {
  targets = [
    "ruby3-1",
    "ruby3-1-local",
    "ruby3-1-webapp",
    "ruby3-1-webapp-local",
  ]
}

target "ruby3-1" {
  dockerfile = "Dockerfile"
  tags = [
    "nullstone/rails:ruby3.1",
    "nullstone/rails:ruby3",
    "nullstone/rails",
  ]
  args = {
    "RUBY_VERSION" = "3.1"
  }
}

target "ruby3-1-local" {
  dockerfile = "local.Dockerfile"
  tags = [
    "nullstone/rails:ruby3.1-local",
    "nullstone/rails:ruby3-local",
    "nullstone/rails:local",
  ]
  args = {
    "RUBY_VERSION" = "3.1"
  }
}

target "ruby3-1-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags = [
    "nullstone/rails:ruby3.1-webapp",
    "nullstone/rails:ruby3-webapp",
    "nullstone/rails:webapp"
  ]
  args = {
    "RUBY_VERSION" = "3.1"
  }
}

target "ruby3-1-webapp-local" {
  dockerfile = "webapp/Dockerfile"
  tags = [
    "nullstone/rails:ruby3.1-webapp-local",
    "nullstone/rails:ruby3-webapp-local",
    "nullstone/rails:webapp-local"
  ]
  args = {
    "RUBY_VERSION" = "3.1"
  }
}
