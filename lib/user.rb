class User
  attr_reader :user

  def initialize
    @user = user
  end

  def validate(name)
    !name.length.zero?
  end
end
