
# A good approach for using service objects more conveniently
# (thanks to Amin Shah Gilani)
#
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
