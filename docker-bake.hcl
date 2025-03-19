variable "RUBY_VERSION" {
  default = "3.4"
}

group "default" {
  targets = ["normal", "webapp"]
}

target "normal" {
  dockerfile = "Dockerfile"
  tags = ["nullstone/rails:ruby${RUBY_VERSION}"]
  args = {
    RUBY_VERSION = RUBY_VERSION
  }
}

target "webapp" {
  dockerfile = "webapp/Dockerfile"
  tags = ["nullstone/rails:ruby${RUBY_VERSION}-webapp"]
  args = {
    RUBY_VERSION = RUBY_VERSION
  }
}
