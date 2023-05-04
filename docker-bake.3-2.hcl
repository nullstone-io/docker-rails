group "default" {
  targets = [
    "ruby3-2",
    "ruby3-2-local",
    "ruby3-2-webapp",
    "ruby3-2-webapp-local",
  ]
}

target "ruby3-2" {
  dockerfile = "Dockerfile"
  tags = [
    "nullstone/rails:ruby3.2",
    "nullstone/rails:ruby3",
    "nullstone/rails",
  ]
  args = {
    "RUBY_VERSION" = "3.2"
  }
}

target "ruby3-2-local" {
  dockerfile = "local.Dockerfile"
  tags = [
    "nullstone/rails:ruby3.2-local",
    "nullstone/rails:ruby3-local",
    "nullstone/rails:local",
  ]
  args = {
    "RUBY_VERSION" = "3.2"
  }
}

target "ruby3-2-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags = [
    "nullstone/rails:ruby3.2-webapp",
    "nullstone/rails:ruby3-webapp",
    "nullstone/rails:webapp"
  ]
  args = {
    "RUBY_VERSION" = "3.2"
  }
}

target "ruby3-2-webapp-local" {
  dockerfile = "webapp/Dockerfile"
  tags = [
    "nullstone/rails:ruby3.2-webapp-local",
    "nullstone/rails:ruby3-webapp-local",
    "nullstone/rails:webapp-local"
  ]
  args = {
    "RUBY_VERSION" = "3.2"
  }
}
