#!/usr/bin/env ruby

require 'open3'
require_relative 'exec-command'
require 'fileutils'

FileUtils.mkdir_p(File.join("stemcell-builder","build"))
FileUtils.cp_r("windows-stemcell-dependencies",File.join("stemcell-builder","build","windows-stemcell-dependencies"))
FileUtils.cp_r("vmx-version",File.join("stemcell-builder","build","vmx-version"))

Dir.chdir "stemcell-builder" do
  exec_command("bundle install")
  exec_command("rake build:vsphere_add_updates")
end
