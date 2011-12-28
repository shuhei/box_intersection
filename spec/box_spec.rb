require_relative '../box'
Bundler.require(:test)

describe Box do
  before do
    @box = Box.new(0, 0, 0, 10, 10, 10)

    @distant = Box.new(100, 100, 100, 10, 10, 10)
    @eighth = Box.new(5, 5, 5, 10, 10, 10)
    @included = Box.new(2, 2, 2, 6, 6, 6)
    @next = Box.new(10, 0, 0, 10, 10, 10)
    @almost = Box.new(5, 5, 10, 10 ,10, 10)
  end
  
  it 'intersects on eighth' do
    @box.should be_intersect @eighth
  end

  it 'does not intersect with distant box' do
    @box.should_not be_intersect @distant
  end

  it 'intersects with included box' do
    @box.should be_intersect @included
  end

  it 'does not intersect with next box' do
    @box.should_not be_intersect @next
  end

  it 'does not intersect with almost intersecting box' do
    @box.should_not be_intersect @almost
  end

  context 'given illegal arguments' do
    it 'raises error for negative size' do
      expect { Box.new(0, 0, 0, -10, 10, 10) }.to raise_error ArgumentError
    end

    it 'raises error for zero size' do
      expect { Box.new(0, 0, 0, 0, 10, 10) }.to raise_error ArgumentError
    end

    it 'raises error for non-integer size' do
      expect { Box.new(0, 0, 0, 10.1, 10, 10) }.to raise_error ArgumentError
    end
    
    it 'raises error for non-integer coordinate' do
      expect { Box.new(0.2, 0, 0, 10, 10, 10) }.to raise_error ArgumentError
    end
  end
end

