sliceconfig_version = '0.0.1'
sliceconfig_root = File.expand_path("~/.sliceconfig")

log_level :info
log_location STDOUT

recipe_url "http://github.com/fs/sliceconfig/tarball/#{sliceconfig_version}"
json_attribs "http://github.com/fs/sliceconfig-rb/raw/v#{sliceconfig_version}/config/sliceconfig.json"

sandbox_path "#{sliceconfig_root}/sandboxes"
cookbook_path "#{sliceconfig_root}/cookbooks"
file_cache_path "#{sliceconfig_root}"
file_backup_path "#{sliceconfig_root}/backup"
cache_options ({ :path => "#{sliceconfig_root}/cache/checksums", :skip_expires => true })
