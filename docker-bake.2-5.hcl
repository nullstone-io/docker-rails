group "default" {
  targets = [
    "ruby2-5",
    "ruby2-5-local",
    "ruby2-5-webapp",
    "ruby2-5-webapp-local",
  ]
}

target "ruby2-5" {
  dockerfile = "Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.5"
  ]
  args = {
    "RUBY_VERSION" = "2.5"
  }
}

target "ruby2-5-local" {
  dockerfile = "local.Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.5-local"
  ]
  args = {
    "RUBY_VERSION" = "2.5"
  }
}

target "ruby2-5-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.5-webapp"
  ]
  args = {
    "RUBY_VERSION" = "2.5"
  }
}

target "ruby2-5-webapp-local" {
  dockerfile = "webapp/local.Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.5-webapp-local"
  ]
  args = {
    "RUBY_VERSION" = "2.5"
  }
}
