Gem::Specification.new do |s|
  s.name = %q{phonenumber}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Norman Clarke"]
  s.date = %q{2009-01-30}
  s.description = %q{}
  s.email = ["norman@randomba.org"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "config/website.yml", "init.rb", "lib/phone_number.rb", "lib/phone_number/country_code.rb", "lib/phone_number/country_code/base.rb", "lib/phone_number/country_code/country_code_1.rb", "lib/phone_number/version.rb", "test/test_country_code_1.rb", "test/test_helper.rb", "test/test_phone_number.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{phonenumber}
  s.rubygems_version = %q{1.3.1}
  s.signing_key = %q{/Users/norman/.gem/gem-private_key.pem}
  s.summary = %q{}
  s.test_files = ["test/test_country_code_1.rb", "test/test_helper.rb", "test/test_phone_number.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
