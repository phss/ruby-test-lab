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


class ArrayHeap < DumbHeap
  def top
    @raw.first
  end

  def pop
    raise 'error empty' if size == 0
    swap(0, size - 1)
    best = @raw.pop
    elem_index = 0
    while elem_index < size
      left_child_index = elem_index * 2 + 1
      right_child_index = left_child_index + 1
      if compare(elem_index, left_child_index) && compare(elem_index, right_child_index)
        break
      elsif compare(left_child_index, elem_index) && compare(left_child_index, right_child_index)
        swap(elem_index, left_child_index)
        elem_index = left_child_index
      else
        swap(elem_index, right_child_index)
        elem_index = right_child_index
      end
    end
    return best
  end

  def add(element)
    @raw << element
    elem_index = size - 1
    while elem_index > 0
      parent_index = parent(elem_index)
      if compare(elem_index, parent_index)
        swap(elem_index, parent_index)
        elem_index = parent_index
      else
        break
      end
    end
  end

  private

  def compare(index_a, index_b)
    elem_a = @raw[index_a]
    elem_b = @raw[index_b]
    elem_a && (elem_b.nil? || @comparator.call(elem_a, elem_b))
  end

  def swap(index_a, index_b)
    @raw[index_a], @raw[index_b] = @raw[index_b], @raw[index_a]
  end

  def parent(index)
    up_index = index./ 2
    index.odd? ? up_index : up_index - 1
  end


end
