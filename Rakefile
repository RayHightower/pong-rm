# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'motion-testflight'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Pong-RM'

  app.interface_orientations = [:landscape_left, :landscape_right, :portrait]
  app.files_dependencies 'app/controllers/game_view_controller.rb' => 'app/views/score_label.rb'
  app.icons = ["pong-rm.jpg"]

  # app.provisioning_profile = '/Users/rth/Library/MobileDevice/Provisioning Profiles/[string-of-numbers].mobileprovision'
  # app.codesign_certificate = 'iPhone Developer: Raymond T Hightower (Z9NP4QZ4AE)'

  app.testflight.sdk = 'vendor/TestFlight'
  app.testflight.api_token = '889104c1388c3ab736e90fc8cd0bd7d0_OTU5Nw'
  # app.testflight.team_token = ''

end
