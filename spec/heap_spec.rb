require_relative '../src/heap'

describe DumbHeap do
  subject { DumbHeap.new }

  it 'should have no top when empty' do
    expect(subject.top).to be_nil
  end

  it 'should throw exception when poping from empty heap' do
    # TODO improve style test
    begin
      subject.pop
      expect(true).to eq(false)
    rescue  => e
      # fine
    end
  end

  it 'should have size of 0 for empty heap' do
    expect(subject.size).to eq(0)
  end

  it 'should have single element after an add' do
    subject.add(42)

    expect(subject.top).to eq(42)
    expect(subject.size).to eq(1)
  end

  it 'should pop single element after an add' do
    subject.add(42)

    expect(subject.pop).to eq(42)
    expect(subject.size).to eq(0)
  end

  it 'should have smallest element on top' do
    [12, 6, 3, 40, 4, 5].each { |e| subject.add(e) }

    expect(subject.top).to eql(3)
    expect(subject.size).to eql(6)
  end

  it 'should have pop element on top' do
    [12, 6, 3, 40, 4, 5].each { |e| subject.add(e) }

    expect(subject.pop).to eql(3)
    expect(subject.size).to eql(5)
  end
end
