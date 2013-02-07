class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    intro_controller = IntroViewController.alloc.initWithNibName(nil, bundle: nil)
    # nav_controller = UINavigationController.alloc.initWithRootViewController(controller)

    # tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle:nil)
    # tab_controller.viewControllers = [nav_controller]

    # @window.rootViewController = nav_controller
    @window.rootViewController = intro_controller
    
    true
  end
end
