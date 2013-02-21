class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    intro_controller = IntroViewController.alloc.initWithNibName(nil, bundle: nil)
    @window.rootViewController = intro_controller
    
    true
  end
end
