class PaddleView < UIView

  def init
    super
    @object_start = [20, 50]
    @paddle_size = [20, 100]
    self = PaddleView.alloc.initWithFrame [@object_start, @paddle_size]
    self.backgroundColor = UIColor.whiteColor
  end
end
