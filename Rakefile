# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'rubygems'
require 'motion-testflight'

# PROVISIONING_PROFILE idea borrowed from Jim Weirich's RubyMotion solutions for BNR
PROVISIONING_PROFILE = FileList['provisioning/*.mobile*'].first

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Pong-RM'

  app.interface_orientations = [:landscape_left, :landscape_right, :portrait]
  app.files_dependencies 'app/controllers/game_view_controller.rb' => 'app/views/score_label.rb'
  app.icons = ["pong-rm.jpg"]

  app.provisioning_profile = PROVISIONING_PROFILE
  app.codesign_certificate = 'iPhone Developer: Raymond T Hightower (Z9NP4QZ4AE)'

  app.testflight.sdk = 'vendor/TestFlight'
  app.testflight.api_token = '889104c1388c3ab736e90fc8cd0bd7d0_OTU5Nw'
  app.testflight.team_token = '863ddec814e46da2aa09f58d9486faeb_MTAzNDM1MjAxMi0wNi0yNCAyMjoyOTowNi45NzczMDM'

end
