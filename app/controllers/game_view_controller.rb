class GameViewController < UIViewController

  def init
    super
    @ball_size = [20, 20]
    @ball_location = [240, 160]
    @paddle_size = [20, 100]
    @left_paddle_position = [20, 50]
    @right_paddle_position = [440, 50]

    self.view = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.backgroundColor = UIColor.blackColor
    self.view.makeKeyAndVisible
    self
  end

  def viewDidLoad
    super
  end

  def create_ball
    @ball_view = UIView.alloc.initWithFrame [@ball_location, @ball_size]
    @ball_view.backgroundColor = UIColor.whiteColor
    self.view.addSubview(@ball_view)
  end

  def create_left_paddle
    @left_paddle_view = PaddleView.alloc.initWithFrame [@left_paddle_position, @paddle_size]
    @left_paddle_view.backgroundColor = UIColor.whiteColor
    self.view.addSubview(@left_paddle_view)
  end

  def create_right_paddle
    @right_paddle_view = PaddleView.alloc.initWithFrame [@right_paddle_position, @paddle_size]
    @right_paddle_view.backgroundColor = UIColor.whiteColor
    self.view.addSubview(@right_paddle_view)
  end

  def move_ball
    if ((ball_view.frame.origin.y + ball_view.frame.size.width > self.view.frame.size.height) || ball_view.frame.origin.y < 0)
       direction_y *= -1
    end
  end

end

