class DumbHeap

  def initialize(comparator)
    @raw = []
    @comparator = comparator
  end

  def top
    @raw.min
  end

  def pop
    raise 'error empty' if size == 0
    min = @raw.reduce do |best, elem|
      @comparator.call(best, elem) ? best : elem
    end
    @raw.delete(min)
    min
  end

  def size
    @raw.size
  end

  def add(element)
    @raw << element
  end
end
