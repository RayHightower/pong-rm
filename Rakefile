# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
# require 'rubygems'
# require 'motion-testflight'
# require 'sugarcube'
# require 'ap'

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
  app.files_dependencies 'app/controllers/game_view_controller.rb' => 'app/views/score_label.rb'
  app.icons = ["pong-rm.jpg"]

  app.device_family = [:iphone]

end
