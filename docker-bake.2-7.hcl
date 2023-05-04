group "default" {
  targets = [
    "ruby2.7",
    "ruby2.7-local",
    "ruby2.7-webapp",
    "ruby2.7-webapp-local",
  ]
}

target "ruby2.7" {
  dockerfile = "Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.7"
  ]
  args = {
    "RUBY_VERSION" = "2.7"
  }
}

target "ruby2.7-local" {
  dockerfile = "local.Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.7-local"
  ]
  args = {
    "RUBY_VERSION" = "2.7"
  }
}

target "ruby2.7-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.7-webapp"
  ]
  args = {
    "RUBY_VERSION" = "2.7"
  }
}

target "ruby2.7-webapp-local" {
  dockerfile = "webapp/local.Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.7-webapp-local"
  ]
  args = {
    "RUBY_VERSION" = "2.7"
  }
}
