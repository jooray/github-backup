#!/usr/bin/env ruby
require "yaml"
require "open-uri"
require "shellwords"
# your github username
username = "USERNAME"
backupDirectory = Shellwords.escape("PATH_TO_BACKUPS")
YAML.load(open("https://api.github.com/users/#{username}/repos")).map{|repository|
    puts "Discovered repository: #{repository['name']}"
    system "git clone #{Shellwords.escape(repository['clone_url'])} #{backupDirectory}/#{Shellwords.escape(repository['name'])}"
}


