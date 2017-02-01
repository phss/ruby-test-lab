class DumbHeap

  def initialize
    @raw = []
  end

  def top
    @raw.min
  end

  def pop
    raise "error empty" if size == 0
    min = @raw.min
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
