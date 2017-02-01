class DumbHeap

  def initialize
    @raw = []
  end

  def top
    @raw.last
  end

  def pop
    raise "error empty" if size == 0
    @raw.pop
  end

  def size
    @raw.size
  end

  def add(element)
    @raw << element
  end
end
