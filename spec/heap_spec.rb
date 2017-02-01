require_relative '../src/heap'

shared_examples_for 'Heap' do
  let(:comparator) { Proc.new(&:<) }
  subject { described_class.new(comparator) }

  context '#empty' do
    it 'should have no top' do
      expect(subject.top).to be_nil
    end

    it 'should throw exception when popping' do
      expect { subject.pop }.to raise_error('error empty')
    end

    it 'should have size of 0' do
      expect(subject.size).to eq(0)
    end
  end

  context '#single element' do
    before { subject.add(42) }

    it 'should have only element on top' do
      expect(subject.top).to eq(42)
    end

    it 'should pop single element' do
      expect(subject.pop).to eq(42)
    end

    it 'should have size of 1' do
      expect(subject.size).to eq(1)
    end

    it 'should be empty after pop' do
      subject.pop
      expect(subject.size).to eq(0)
    end
  end

  context '#several elements' do
    before { [12, 6, 3, 40, 4, 5].each { |e| subject.add(e) } }

    it 'should have smallest element on top' do
      expect(subject.top).to eql(3)
      expect(subject.size).to eql(6)
    end

    it 'should pop smallest element' do
      expect(subject.pop).to eql(3)
      expect(subject.size).to eql(5)
    end
  end

  context 'with random data' do
    it 'minheap should retrieve all elements in descending order' do
      maxheap = described_class.new(Proc.new(&:<))
      (1..100).to_a.shuffle.each { |e| maxheap.add(e) }

      curr = maxheap.pop
      while maxheap.size > 0
        next_elem = maxheap.pop
        expect(next_elem).to be > curr
        curr = next_elem
      end
    end

    it 'maxheap should retrieve all elements in descending order' do
      maxheap = described_class.new(Proc.new(&:>))
      (1..100).to_a.shuffle.each { |e| maxheap.add(e) }

      curr = maxheap.pop
      while maxheap.size > 0
        next_elem = maxheap.pop
        expect(next_elem).to be < curr
        curr = next_elem
      end
    end

  end
end

describe DumbHeap do
  it_behaves_like 'Heap'
end

describe ArrayHeap do
  it_behaves_like 'Heap'
end
