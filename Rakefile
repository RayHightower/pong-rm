# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

# A much better way to manage gems... the DRY way!
begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Pong-RM'

  app.interface_orientations = [:landscape_left, :landscape_right ]
  app.icons = ["pong-rm.jpg"]

end
