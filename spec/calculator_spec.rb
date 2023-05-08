require 'calculator'

describe Calculator do

#   subject(:calculator) { described_class.new }

  it 'should accept a string' do
    expect{ Calculator.add('1,2,3') }.not_to raise_error
  end

  it 'should not accept other data types' do
    expect{ Calculator.add(123) }.to raise_error('only accepts a string')
    expect{ Calculator.add(['123']) }.to raise_error('only accepts a string')
  end

  it 'should return 0 for an empty string' do
    expect(Calculator.add('')).to eq(0)
  end

  it 'should return a number if the passed string contains no delimiters' do
    expect(Calculator.add('123')).to eq (123)
  end

  it 'should return the sum of the numbers in the passed string, if the passed 
string contains comma delimiters' do
    expect(Calculator.add('12,34')).to eq(46)
  end

  it 'should return the sum of the numbers in the passed string, if the passed 
string contains new line delimiters' do
    expect(Calculator.add("12\n34\n56")).to eq(102)
  end

  it 'should handle multiple random delimiters' do
    expect(Calculator.add("//;\n1;2")).to eq(3)
  end

  it 'should not accept negative numbers' do
    expect{ Calculator.add("123,-2") }.to raise_error("cannot accept negatives - -2")
  end

  it 'should ignore numbers larger than 1000' do
    expect(Calculator.add("//;\n1;2:1001")).to eq(3)
  end

end
