require 'fileutils'

FileUtils.cp("#{__dir__}/baker.rb", "#{__dir__}/baker.rb.bak")
FileUtils.mkdir("#{__dir__}/backup")
FileUtils.cp(["#{__dir__}/ensure.rb", "#{__dir__}/super.rb"], "#{__dir__}/backup")
p Dir["#{__dir__}/backup/*"]

FileUtils.mv("#{__dir__}/baker.rb.bak", "#{__dir__}/backup")
Dir["#{__dir__}/backup/*"]


File.exist?("#{__dir__}/backup/super.rb")
FileUtils.rm("#{__dir__}/backup/super.rb")
File.exist?("#{__dir__}/backup/super.rb")

FileUtils.rm_rf("#{__dir__}/backup")
File.exist?("#{__dir__}/backup")

# If you want to see what would happen if you were to run a particular FileUtils command,
# you can send the command to FileUtils::DryRun

p FileUtils::DryRun.rm_rf("backup") # rm -rf backup
p FileUtils::DryRun.ln_s("backup", "backup_link") # ln -s backup backup_link
p FileUtils::NoWrite.rm("backup/super.rb")
p File.exist?("backup/super.rb")
