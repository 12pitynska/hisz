# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tinymce-rails-imageupload"
  s.version = "4.0.16.beta"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Per Christian B. Viken"]
  s.date = "2014-02-21"
  s.description = "TinyMCE plugin for taking image uploads in Rails >= 3.2. Image storage is handled manually, so works with everything."
  s.email = ["perchr@northblue.org"]
  s.homepage = "http://eastblue.org/oss"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "TinyMCE plugin for taking image uploads in Rails >= 3.2"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, ["< 5", ">= 3.2"])
      s.add_runtime_dependency(%q<tinymce-rails>, ["~> 4.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<rails>, [">= 3.1"])
    else
      s.add_dependency(%q<railties>, ["< 5", ">= 3.2"])
      s.add_dependency(%q<tinymce-rails>, ["~> 4.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<rails>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>, ["< 5", ">= 3.2"])
    s.add_dependency(%q<tinymce-rails>, ["~> 4.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<rails>, [">= 3.1"])
  end
end
