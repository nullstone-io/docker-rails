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
  ]
  args = {
    "RUBY_VERSION" = "3.1"
  }
}

target "ruby3-1-local" {
  dockerfile = "local.Dockerfile"
  tags = [
    "nullstone/rails:ruby3.1-local",
  ]
  args = {
    "RUBY_VERSION" = "3.1"
  }
}

target "ruby3-1-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags = [
    "nullstone/rails:ruby3.1-webapp",
  ]
  args = {
    "RUBY_VERSION" = "3.1"
  }
}

target "ruby3-1-webapp-local" {
  dockerfile = "webapp/Dockerfile"
  tags = [
    "nullstone/rails:ruby3.1-webapp-local",
  ]
  args = {
    "RUBY_VERSION" = "3.1"
  }
}
