# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Pong-RM'

  app.interface_orientations = [:landscape_left]
  app.files_dependencies 'app/controllers/game_view_controller.rb' => 'app/views/score_label.rb'
  app.icons = ["pong-rm.jpg"]

end
