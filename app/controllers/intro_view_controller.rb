class IntroViewController < UIViewController

  def init
    super
  end

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    create_start_label
    create_start_button
  end

  def create_start_label
    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Get ready to play RubyMotion Pong!"
    @label.sizeToFit
    @label.center = [self.view.frame.size.height / 2, self.view.frame.size.width / 2 - 30]
    @label.autoresizingMask = (UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin)
    self.view.addSubview(@label)
  end

  def create_start_button
    button_width = 100
    @startbutton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @startbutton.setTitle("Start Game", forState:UIControlStateNormal)
    @startbutton.sizeToFit
    @startbutton.frame = [[190,140], [button_width, 30]]
    @startbutton.addTarget(self, action:"start_game", forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview(@startbutton)
  end

  def start_game
    create_game_view_controller

    self.view.addSubview(@game_view_controller.view)

    # Animate the fade from the Start Screen to the Gaming Screen.
    UIView.animateWithDuration(2.0,
                               animations: lambda {
                               @game_view_controller.view.alpha = 1.0},
                               completion: lambda {|finished|})
  end

  def create_game_view_controller
    @game_view_controller = GameViewController.new
    @game_view_controller.view.alpha = 1.0
    self.view.addSubview(@game_view_controller.view)
  end

end
