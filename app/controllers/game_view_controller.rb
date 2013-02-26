class GameViewController < UIViewController

  def init
    super
    @ball_size = [20, 20]
    @paddle_size = [20, 100]
    @object_start = [20, 50]

    self.view = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.backgroundColor = UIColor.grayColor
    self.view.makeKeyAndVisible
    self
  end

  def viewDidLoad
    super
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
    self.view.addSubview(@left_score)

    @right_score = UILabel.alloc.initWithFrame(CGRectZero)
    @right_score.text = "0"
    @right_score.font = UIFont.boldSystemFontOfSize(35)
    @right_score.sizeToFit
    @right_score.textColor = UIColor.whiteColor
    @right_score.backgroundColor = UIColor.clearColor
    @right_score.center = [360, 30]
    self.view.addSubview(@right_score)
  end

  def move_ball
    # If the ball hits the top wall, bounce downward.
    if ((@ball_view.frame.origin.y + @ball_view.frame.size.width > self.view.frame.size.height) || @ball_view.frame.origin.y < 0)
       @direction_y *= -1
    end

    # If ball exits right, +1 for the left player
    if (@ballView.frame.origin.x + @ballView.frame.size.height > self.view.frame.size.width)
        # @left_score += 1
        # leftScoreDisplay.text = [[NSString alloc] initWithFormat:@"%d",leftScore];
        self.reset_ball
    end
    
    # If ball exits left, +1 for the right player
    if (@ballView.frame.origin.x + @ballView.frame.size.height > self.view.frame.size.width)
        # @left_score += 1
        # leftScoreDisplay.text = [[NSString alloc] initWithFormat:@"%d",leftScore];
        self.reset_ball
    end
    
    # If the ball hits the bottom wall, bounce upward.
    if ((@ball_view.frame.origin.y + @ball_view.frame.size.width > self.view.frame.size.height) || @ball_view.frame.origin.y < 0)
       @direction_y *= -1
    end

    # If the ball didn't hit anything, keep on moving...
    @ball_view.center = [@ball_view.center.x + @direction_x, @ball_view.center.y + @direction_y]

  end

  def reset_ball
    puts "stub for reset_ball"
  end
    
  end
  def start_game_timer(sender)
    # Execute the move_ball method every 0.1 seconds.
    if @game_timer == nil
      @game_timer = 0
    end
    
    @game_timer = NSTimer.scheduledTimerWithTimeInterval(0.1,
                                                         target: self,
                                                         selector: "move_ball",
                                                         userInfo: nil,
                                                         repeats: true)
  end


end

