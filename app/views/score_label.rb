class ScoreLabel < UILabel

  def init
    super
    self.text = "0"
    self.font = UIFont.boldSystemFontOfSize(35)
    self.sizeToFit
    self.textColor = UIColor.whiteColor
    self.backgroundColor = UIColor.clearColor
    self
  end

end
