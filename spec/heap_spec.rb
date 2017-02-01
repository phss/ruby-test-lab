require_relative '../src/heap'

describe DumbHeap do
  let(:comparator) { Proc.new(&:<) }
  subject { DumbHeap.new(comparator) }

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

  context '#with random data' do
    before { (1..100).to_a.shuffle.each { |e| subject.add(e) } }

    it 'should retrieve all elements in min order' do
      curr = subject.pop
      while subject.size > 0
        next_elem = subject.pop
        expect(next_elem).to be > curr
        curr = next_elem
      end
    end
  end
end
