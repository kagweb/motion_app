# coding: utf-8
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion_app'
  app.sdk_version = '7.1'
  app.deployment_target = '6.1'
  app.device_family = [:iphone]
  app.identifier = "jp.doubledown.#{app.name}"
  app.pods do
    pod 'AFNetworking'
    pod 'JASidePanels'
  end
end
