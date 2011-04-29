if "script/rails" == $0
  Rails.logger = Logger.new(STDOUT)
  require 'hirb'
  Hirb.enable
end
