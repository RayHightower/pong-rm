class PaddleView < UIView

#   def viewDidLoad
#     # self.move_paddle_down  # Start by moving the paddle down.
#     # puts "called move_paddle_down in viewDidLoad in PaddleView"
#   end

  def init
    super
    move_paddle_down
  end

  def initWithCoder(aDecoder)
    puts "entering initWithCoder. What does this do?"
    self.initWithCoder(aDecoder)
    if(self)
      @paddle_timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                                             target: self,
                                           selector: "move_paddle_down",
                                           userInfo: nil,
                                            repeats: true)
    end
    
  end

  def move_paddle_down
    puts "*** called move_paddle_down method"
    puts "self.center.y = #{self.center.y}"
    puts "self.frame.size.height/2 = #{self.frame.size.height/2}"
    puts "self.superview.frame.size.height = #{self.superview.frame.size.height}"
    if((self.center.y + (self.frame.size.height/2)) >= self.superview.frame.size.height)  # If paddle has reached the bottom, then move paddle up 
        @paddle_timer.invalidate
        @paddle_timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                                         target: self,
                                       selector: "move_paddle_up",
                                       userInfo: nil,
                                        repeats: true)
    else  # Keep moving down if we have not reached the bottom.
        self.center = [self.center.x, self.center.y + 1]
        puts "Moving down... self.center.y = #{self.center.y}"
    end
    
    puts "@paddle_timer = #{@paddle_timer.to_s}"
  end

  def move_paddle_up
    if((self.center.y - (self.frame.size.height/2)) <= 0)  # If paddle has reached the top, then move paddle down. 
        @paddle_timer.invalidate
        @paddle_timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                                         target: self,
                                       selector: "move_paddle_down",
                                       userInfo: nil,
                                        repeats: true)
    else  # Keep moving up if we have not reached the top.
        self.center = [self.center.x, self.center.y - 1]
    end
    
  end

end
