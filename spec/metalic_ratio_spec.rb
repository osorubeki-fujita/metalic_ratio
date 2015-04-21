require 'spec_helper'

describe MetalicRatio do
  it 'has a version number' do
    expect(MetalicRatio::VERSION).to eq( "0.0.1rc2" )
  end
  
  it 'has a constants as class methods' do
    expect( MetalicRatio::golden_ratio ).to eq( 1.618033988749895 )
    expect( MetalicRatio::silver_ratio ).to eq( 2.414213562373095 )
  end

  it 'can call constants by const_missing' do
    expect( MetalicRatio::GOLDEN_RATIO ).to eq( 1.618033988749895 )
    expect( MetalicRatio::SILVER_RATIO ).to eq( 2.414213562373095 )
  end
end