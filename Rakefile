# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'rubygems'
require 'motion-testflight'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Pong-RM'

  # Next three lines added to support Spark Inspector
  app.vendor_project '/Applications/Spark Inspector.app/Contents/Resources/Frameworks/SparkInspector.framework', :static, :products => ['SparkInspector'], :force_load => true, :headers_dir => 'Headers'
  app.libs += ['/usr/lib/libz.dylib']
  app.frameworks += ['QuartzCore']
  
  app.interface_orientations = [:landscape_left, :landscape_right, :portrait]
  app.files_dependencies 'app/controllers/game_view_controller.rb' => 'app/views/score_label.rb'
  app.icons = ["pong-rm.jpg"]

  app.device_family = [:iphone]

  # app.provisioning_profile = '/Users/rth/Library/MobileDevice/Provisioning Profiles/36E2A416-EB55-471C-8A5B-771EA6E525BA.mobileprovision'
  app.provisioning_profile = '/Users/rth/Library/MobileDevice/Provisioning Profiles/672976D7-44DE-46B1-B7A0-FD58D93787A2.mobileprovision'
  app.codesign_certificate = 'iPhone Developer: Raymond T Hightower (Z9NP4QZ4AE)'
  # code sign certificate. NOT co-design certificate :-)

  app.testflight.sdk = 'vendor/TestFlight'
  app.testflight.api_token = '889104c1388c3ab736e90fc8cd0bd7d0_OTU5Nw'
  # team_token has been deprecated in favor of app_token, but rake complained so we went back to the team_token
  app.testflight.team_token = '863ddec814e46da2aa09f58d9486faeb_MTAzNDM1MjAxMi0wNi0yNCAyMjoyOTowNi45NzczMDM'
  # app.testflight.app_token = 'fb4233fc-5f4c-4dec-a6ea-62348c5ad632'
  app.testflight.notify = true

end
