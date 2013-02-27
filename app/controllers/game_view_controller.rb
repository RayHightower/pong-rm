class GameViewController < UIViewController

  def init
    super
    @ball_size = [20, 20]
    @object_start = [20, 50]
    @paddle_size = [20, 100]

    self.view = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.backgroundColor = UIColor.colorWithRed(40.0/255,
                                                   green: 99.0/255,
                                                    blue: 34.0/255,
                                                   alpha: 1)
    self.view.makeKeyAndVisible
    start_game_timer
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

  def create_right_paddle
    @right_paddle_view = PaddleView.alloc.initWithFrame [[420,50], @paddle_size]
    @right_paddle_view.center = [460, 160] # if x>160+/-, the  right paddle  will not respond to touch events.
    @right_paddle_view.backgroundColor = UIColor.whiteColor
    self.view.addSubview(@right_paddle_view)
  end

  def create_left_paddle
    @left_paddle_view = PaddleView.alloc.initWithFrame [@object_start, @paddle_size]
    @left_paddle_view.center = [20, 150]
    @left_paddle_view.backgroundColor = UIColor.whiteColor
    self.view.addSubview(@left_paddle_view)
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
    @left_score.text = @left_score_num.to_s
    @left_score.sizeToFit
  end

  def move_ball
    # If ball exits right, +1 for the left player
    if (@ball_view.center.x  > self.view.frame.size.width)
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
    @ball_view.center = [@ball_view.center.x + @direction_x, @ball_view.center.y + @direction_y]

    # If ball collides with a paddle, change direction.
    check_paddle_collision

  end

  def check_paddle_collision
    #if ball collides with the left paddle, change direction
    if (CGRectIntersectsRect(@ball_view.frame, @left_paddle_view.frame))
      @direction_x *= -1
    end

    #if ball collides with the right paddle, change direction
    if (CGRectIntersectsRect(@ball_view.frame, @right_paddle_view.frame))
      @direction_x *= -1
    end
  end

  def reset_ball
    @ball_view.center = [240, 200]
    @direction_x *= -1
    
    @game_timer.invalidate  # @game_timer.invalidate solved the acceleration problem. Why?
    start_game_timer
  end
    
  def start_game_timer
    @game_timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                                                    target: self,
                                                  selector: "move_ball",
                                                  userInfo: nil,
                                                   repeats: true)
  end

end

