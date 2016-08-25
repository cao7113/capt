require 'byebug'
require 'yaml'

root = File.expand_path('..', __FILE__)
codenames = YAML.load_file(File.join(root, 'config/codename.yml'))
codenames = codenames.inject({}) do | r, (k, v) |
  r[k] = v.to_s
  r
end
# without dot
versions = codenames.inject({}) do | r, (k, v) |
  r[k] = v.sub('.', '')
  r
end.invert
mirrors = YAML.load_file(File.join(root, 'config/mirror.yml'))
template = File.read(File.join(root, 'config/apt-source'))

task :default => :apt_source 

desc 'get apt source'
task :apt_source do
  version = ENV['VERSION'] || '1604'
  mirror = ENV['MIRROR'] || 'aliyun'

  url = "http://cn.archive.ubuntu.com/ubuntu/" 
  if version.to_i > 0
    codename = versions[version]
  else
    codename = codenames[version]
  end
  raise "Bad #{codename}!" unless codename
  to_url = mirrors[mirror]
  content = template.gsub(url, to_url)
  content.gsub!('xenial', codename)
  dot_version = codenames[codename]
  content.gsub!('16.04', dot_version)

  puts content
end

desc 'get codenames'
task :codenames do
  puts codenames
end
