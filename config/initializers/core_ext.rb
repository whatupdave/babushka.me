class Object
  def tapp
    Rails.logger.info inspect
    self
  end
end
