class GameViewController < UIViewController

  def init
    super
    self.view.alpha = 0.5
    self.view = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.backgroundColor = UIColor.greenColor
    self.view.makeKeyAndVisible
    self
  end

  def viewDidLoad
    super
    create_ball
    create_left_paddle
    create_right_paddle

  end

  def create_ball
    @points = [[0, 0], [50, 0], [0, 50], [50, 50]]
    @current_index = 0
    
    @ball_view = UIView.alloc.initWithFrame [@points[@current_index], [100, 100]]
    @ball_view.backgroundColor = UIColor.whiteColor
    self.view.addSubview(@ball_view)
  end

  def create_left_paddle

    puts "create_left_paddle stub"
    
  end

  def create_right_paddle
    # @right_paddle_view = PaddleView.alloc.initWithFrame[@points[@current_index], [100, 100]]
    # @right_paddle_view.backgroundColor = UIColor.whiteColor
    # self.view.addSubview(@right_paddle_view)
    
    puts "create_right_paddle stub"

  end

  def move_ball
  
    if ((ball_view.frame.origin.y + ball_view.frame.size.width > self.view.frame.size.height) || ball_view.frame.origin.y < 0)
       direction_y *= -1
    end
  
  end

end

