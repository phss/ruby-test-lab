require_relative '../datastructures/heap'

class RunningMedianCalculator
  def calculate(values)
    bottom_heap = ArrayHeap.new(Proc.new(&:>))
    top_heap = ArrayHeap.new(Proc.new(&:<))

    values.map do |value|
      insert(value, bottom_heap, top_heap)
      balance(bottom_heap, top_heap)
      median(bottom_heap, top_heap)
    end
  end

  private

  def insert(value, bottom_heap, top_heap)
    if !top_heap.empty? && value > top_heap.top
      top_heap.add(value)
    else
      bottom_heap.add(value)
    end
  end

  def balance(bottom_heap, top_heap)
    if (top_heap.size - bottom_heap.size) > 1
      bottom_heap.add(top_heap.pop)
    elsif (bottom_heap.size - top_heap.size) > 1
      top_heap.add(bottom_heap.pop)
    end
  end

  def median(bottom_heap, top_heap)
    if (bottom_heap.size + top_heap.size).odd?
      bottom_heap.size > top_heap.size ? bottom_heap.top : top_heap.top
    else
      (top_heap.top + bottom_heap.top) / 2.0
    end
  end
end
