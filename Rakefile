require 'newgem'
require File.dirname(__FILE__) + '/lib/phone_number/version.rb'

$hoe = Hoe.new('phone_number', PhoneNumber::Version::STRING) do |p|
  p.developer('Norman Clarke', 'norman@randomba.org')
  p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  p.rubyforge_name       = "phone_number" # TODO this is default value
  p.summary = "none"
  p.description = "none"
  p.url = "http://github.com/norman/phonenumber"
  # p.extra_deps         = [
  #   ['activesupport','>= 2.0.2'],
  # ]
  p.extra_dev_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"],
    ['Shoulda', ">= 1.2.0"]
  ]
  p.clean_globs |= %w[**/.DS_Store tmp *.log]
  p.remote_rdoc_dir = ''
  p.rsync_args = '-av --delete --ignore-errors'
end

require 'newgem/tasks'