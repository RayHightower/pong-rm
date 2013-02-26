class GameViewController < UIViewController

  def init
    super
    @ball_size = [20, 20]
    @paddle_size = [20, 100]
    @object_start = [20, 50]

    self.view = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.backgroundColor = UIColor.grayColor
    self.view.makeKeyAndVisible
    start_game_timer
    self
  end

  def viewDidLoad
    super
    puts "viewDidLoad"
  end

  def create_ball
    @ball_view = UIView.alloc.initWithFrame [@object_start, @ball_size]
    @ball_view.backgroundColor = UIColor.whiteColor
    @ball_view.center = [240, 200]
    @direction_x = @direction_y = 1
    self.view.addSubview(@ball_view)
  end

  def create_left_paddle
    @left_paddle_view = PaddleView.alloc.initWithFrame [@object_start, @paddle_size]
    @left_paddle_view.backgroundColor = UIColor.whiteColor
    @left_paddle_view.center = [20, 200]
    self.view.addSubview(@left_paddle_view)
  end

  def create_right_paddle
    @right_paddle_view = PaddleView.alloc.initWithFrame [@object_start, @paddle_size]
    @right_paddle_view.backgroundColor = UIColor.whiteColor
    @right_paddle_view.center = [460, 160]
    self.view.addSubview(@right_paddle_view)
  end

  def create_score_labels
    @left_score = UILabel.alloc.initWithFrame(CGRectZero)
    @left_score.text = "0"
    @left_score.font = UIFont.boldSystemFontOfSize(35)
    @left_score.sizeToFit
    @left_score.textColor = UIColor.whiteColor
    @left_score.backgroundColor = UIColor.clearColor
    @left_score.center = [120, 30]
    @left_score_num = 0
    self.view.addSubview(@left_score)

    @right_score = UILabel.alloc.initWithFrame(CGRectZero)
    @right_score.text = "0"
    @right_score.font = UIFont.boldSystemFontOfSize(35)
    @right_score.sizeToFit
    @right_score.textColor = UIColor.whiteColor
    @right_score.backgroundColor = UIColor.clearColor
    @right_score.center = [360, 30]
    @right_score_num = 0
    self.view.addSubview(@right_score)
  end

  def increment_right_score
    @right_score_num += 1
    @right_score.text = @right_score_num.to_s
    @right_score.sizeToFit
  end

  def increment_left_score
    @left_score_num += 1
    @left_score.text = @right_score_num.to_s
    @left_score.sizeToFit
  end

  def move_ball
    # If ball exits right, +1 for the left player
    if (@ball_view.center.x + @ball_view.frame.size.width > self.view.frame.size.width)
        increment_left_score
        @direction_x *= -1
        self.reset_ball
    end
    
    # If ball exits left, +1 for the right player
    if (@ball_view.center.x < 0)
        increment_right_score
        @direction_x *= -1
        self.reset_ball
    end
    
    # If the ball hits the top or bottom wall, bounce y in the opposite direction, while x-direction remains unchanged.
    if ((@ball_view.center.y + @ball_view.frame.size.height > self.view.frame.size.height) || @ball_view.frame.origin.y < 0)
       @direction_y *= -1
    end

    # If the ball didn't hit anything, keep on moving...
    @ball_view.center = [@ball_view.center.x + 5*@direction_x, @ball_view.center.y + 5*@direction_y]

  end

  def reset_ball
    # Put the ball back in the center.
    @ball_view.center = [240, 200]
    
    # Start the game timer again.
    @game_timer = 0
    start_game_timer
  end
    
  def start_game_timer
    # Execute the move_ball method every 0.1 seconds.
    if @game_timer == nil
      @game_timer = 0
    end
    
    puts "starting the @game_timer"

    @game_timer = NSTimer.scheduledTimerWithTimeInterval(0.1,
                                                         target: self,
                                                         selector: "move_ball",
                                                         userInfo: nil,
                                                         repeats: true)
  end


end

