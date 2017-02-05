require_relative '../../src/algorithms/running_median'

describe RunningMedianCalculator do
  it 'calculates running median for each value' do
    values = [12, 4, 5, 3, 8, 7]

    medians = RunningMedianCalculator.new.calculate(values)

    expect(medians).to eq([12.0, 8.0, 5.0, 4.5, 5.0, 6.0])
  end
end
