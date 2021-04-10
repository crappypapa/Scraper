class Sorter
  attr_accessor :query
  def initialize
    @query = query
    @options = ['title', 'company','tag']
  end

  def option_check(option)
     @options.include? option
  end
end