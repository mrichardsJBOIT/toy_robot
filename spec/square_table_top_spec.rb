require 'rspec'
require 'square_table_top'

describe 'SquareTableTop' do

  context 'when new' do
    it 'is square' do
      table = SquareTableTop.new(5)
      expect(table.side_length).to be == 5
    end
  end

  context 'when checking a location exist' do
    it 'is does if inside square' do
      table = SquareTableTop.new(5)
      expect(table.check_position_exist(0,5)).to be_truthy
    end
    it 'is does not if outide square' do
      table = SquareTableTop.new(5)
      expect(table.check_position_exist(1, 6)).to be_falsey
    end
  end

end
