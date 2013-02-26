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
    @label.text = "Ready to play RubyMotion Pong!"
    @label.sizeToFit
    @label.center = [self.view.frame.size.height / 2, self.view.frame.size.width / 3]
    @label.autoresizingMask = (UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin)
    self.view.addSubview(@label)    
  end

  def create_start_button
    button_width = 100
    @startbutton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @startbutton.setTitle("Start Game", forState:UIControlStateNormal)
    # @startbutton.setTitleColor(color, forState:UIControlStateNormal)
    @startbutton.sizeToFit
    @startbutton.frame = [[self.view.frame.size.height / 2 - button_width / 2, self.view.frame.size.width / 2], [button_width, 30]]
    @startbutton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
    @startbutton.addTarget(self, action:"start_game", forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview(@startbutton)
  end

  def start_game
    create_game_view_controller

    self.view.addSubview(@game_view_controller.view)
    @game_view_controller.create_ball
    @game_view_controller.create_left_paddle
    @game_view_controller.create_right_paddle
    # What is this animation doing?
    # UIView.animateWithDuration(2.0,
    #                            animations: lambda {
    #                            @game_view_controller.view.alpha = 1.0},
    #                            completion: lambda {|finished|})
  end

  def create_game_view_controller
    @game_view_controller = GameViewController.new
    @game_view_controller.view.alpha = 1.0
    self.view.addSubview(@game_view_controller.view)
    puts "added a @game_view_controller.view as a subView of the @intro_view_controller"
  end

end
