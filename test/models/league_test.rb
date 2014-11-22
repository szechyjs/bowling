require 'test_helper'

describe League do
  it 'has a string version' do
    build(:league).to_s.must_equal 'A League - January 2014'
  end

  it 'has decimal version of percentage' do
    build(:league).percentage_decimal.must_equal 0.9
  end
end
