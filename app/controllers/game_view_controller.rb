class GameViewController < UIViewController

  def init
    super
    @ball_size = [20, 20]
    @ball_location = [240, 160]
    @paddle_size = [20, 100]
    @left_paddle_position = [20, 50]
    @right_paddle_position = [440, 150]

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

  def create_score_labels
    @left_score = UILabel.alloc.initWithFrame(CGRectZero)
    @left_score.text = "0"
    @left_score.font = UIFont.boldSystemFontOfSize(35)
    @left_score.sizeToFit
    @left_score.textColor = UIColor.whiteColor
    @left_score.backgroundColor = UIColor.blackColor
    @left_score.center = [120, 30]
    self.view.addSubview(@left_score)
    
    @right_score = UILabel.alloc.initWithFrame(CGRectZero)
    @right_score.text = "0"
    @right_score.font = UIFont.boldSystemFontOfSize(35)
    @right_score.sizeToFit
    @right_score.textColor = UIColor.whiteColor
    @right_score.backgroundColor = UIColor.blackColor
    @right_score.center = [360, 30]
    self.view.addSubview(@right_score)
  end

  def move_ball
    if ((ball_view.frame.origin.y + ball_view.frame.size.width > self.view.frame.size.height) || ball_view.frame.origin.y < 0)
       direction_y *= -1
    end
  end

end

