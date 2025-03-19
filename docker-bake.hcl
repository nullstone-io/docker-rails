group "default" {
  targets = [
    "ruby3-3",
    "ruby3-3-webapp",

    "ruby3-2",
    "ruby3-2-webapp",

    "ruby3-1",
    "ruby3-1-webapp",

    "ruby3-0",
    "ruby3-0-webapp",

    "ruby2-7",
    "ruby2-7-webapp",
  ]
}

target "ruby3-3" {
  dockerfile = "Dockerfile"
  tags = [
    "nullstone/rails:ruby3.3",
    "nullstone/rails:ruby3",
    "nullstone/rails",
  ]
  args = {
    "RUBY_VERSION" = "3.3"
  }
}

target "ruby3-3-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags = [
    "nullstone/rails:ruby3.3-webapp",
    "nullstone/rails:ruby3-webapp",
    "nullstone/rails:webapp"
  ]
  args = {
    "RUBY_VERSION" = "3.3"
  }
}

group "group-ruby3-2" {
  targets = [
    "ruby3-2",
    "ruby3-2-webapp",
  ]
}

target "ruby3-2" {
  dockerfile = "Dockerfile"
  tags       = ["nullstone/rails:ruby3.2"]
  args       = {
    "RUBY_VERSION" = "3.2.2"
  }
}

target "ruby3-2-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags = ["nullstone/rails:ruby3.2-webapp"]
  args = {
    "RUBY_VERSION" = "3.2.2"
  }
}

group "group-ruby3-1" {
  targets = [
    "ruby3-1",
    "ruby3-1-webapp",
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

target "ruby3-1-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags = [
    "nullstone/rails:ruby3.1-webapp",
  ]
  args = {
    "RUBY_VERSION" = "3.1"
  }
}

group "group-ruby3-0" {
  targets = [
    "ruby3-0",
    "ruby3-0-webapp",
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

target "ruby3-0-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags      = [
    "nullstone/rails:ruby3.0-webapp"
  ]
  args = {
    "RUBY_VERSION" = "3.0"
  }
}

group "group-ruby2-7" {
  targets = [
    "ruby2-7",
    "ruby2-7-webapp",
  ]
}

target "ruby2-7" {
  dockerfile = "Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.7"
  ]
  args = {
    "RUBY_VERSION" = "2.7"
  }
}

target "ruby2-7-webapp" {
  dockerfile = "webapp/Dockerfile"
  tags      = [
    "nullstone/rails:ruby2.7-webapp"
  ]
  args = {
    "RUBY_VERSION" = "2.7"
  }
}
