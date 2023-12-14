require 'app-info'

task :ios do
  ipa = AppInfo.parse(ENV["APP_PATH"])
  puts ipa.release_version
end

task :android do
  apk = AppInfo.parse(ENV["APP_PATH"])
  puts apk.release_version
end
