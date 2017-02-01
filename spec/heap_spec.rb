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
end
