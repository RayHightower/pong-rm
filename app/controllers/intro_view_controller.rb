class IntroViewController < UIViewController

  attr_accessor :game_view_controller   # tell the app tha the game_view_controller exists!!!

  def init
    super
  end

  def viewDidLoad

    super

    self.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Get ready to play Pong!"
    @label.sizeToFit
    @label.center = [self.view.frame.size.height / 2, self.view.frame.size.width / 3]
    @label.autoresizingMask = (UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin)
    self.view.addSubview(@label)    
    
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

    @game_view_controller = GameViewController.alloc.initWithNibName(nil, bundle: nil)
    # @game_view_controller.view.alpha = 0.0

    self.view.addSubview(@game_view_controller.view)
    
  end

end
