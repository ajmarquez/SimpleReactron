
class ReactionTracker

    attr_accessor :array

  def initialize react_array
    @array = react_array
  end

  def matched (dummy_array)
    @array.sort == dummy_array.sort
  end

end
