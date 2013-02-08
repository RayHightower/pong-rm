class GameViewController < UIViewController

  def init
    super

  end

  def viewDidLoad

    super
    
    puts "viewDidLoad in GameViewController instance"

    self.view = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.backgroundColor = UIColor.blackColor
    # self.makeKeyAndVisible

    # self.addSubView(self.view)

  end

end
