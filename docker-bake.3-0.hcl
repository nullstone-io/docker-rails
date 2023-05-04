group "default" {
  targets = [
    "ruby3-0",
    "ruby3-0-local",
    "ruby3-0-webapp",
    "ruby3-0-webapp-local",
  ]
}

target "ruby3-0" {
  dockerfile = "Dockerfile"
  tags      = [
    "nullstone/rails:ruby3.0"
  ]
  args = {
    "RUBY_VERSION" = "3.0"
  }
}

target "ruby3-0-local" {
  dockerfile = "local.Dockerfile"
  tags      = [
    "nullstone/rails:ruby3.0-local"
  ]
  args = {
    "RUBY_VERSION" = "3.0"
  }
}

target "ruby3-0-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags      = [
    "nullstone/rails:ruby3.0-webapp"
  ]
  args = {
    "RUBY_VERSION" = "3.0"
  }
}

target "ruby3-0-webapp-local" {
  dockerfile = "webapp/local.Dockerfile"
  tags      = [
    "nullstone/rails:ruby3.0-webapp-local"
  ]
  args = {
    "RUBY_VERSION" = "3.0"
  }
}
