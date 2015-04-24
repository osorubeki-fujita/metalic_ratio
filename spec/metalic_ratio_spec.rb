require 'spec_helper'
require 'versionomy'

this_file = ::File.expand_path( ::File.dirname( __FILE__ ) )
latest_version = open( "#{ this_file }/../.latest_version" , "r:utf-8" ).read

version = "0.1.2"

describe MetalicRatio do
  it "has a version number \'#{ version }\'" do
    expect( MetalicRatio::VERSION ).to eq( version )
    expect( Versionomy.parse( MetalicRatio::VERSION ) >= Versionomy.parse( latest_version ) ).to eq( true )
  end

  it 'has a constants as class methods' do
    expect( MetalicRatio.golden_ratio ).to eq( 1.618033988749895 )
    expect( MetalicRatio.silver_ratio ).to eq( 2.414213562373095 )
    expect( MetalicRatio.bronze_ratio ).to eq( 3.302775637731995 )

    expect( MetalicRatio.yamato_ratio ).to eq( 1.4142135623730951 )


    expect( MetalicRatio.golden_angle_deg ).to eq( 137.50776405003785 )
    expect( MetalicRatio.golden_angle(:deg) ).to eq( 137.50776405003785 )
    expect( MetalicRatio.golden_angle("deg") ).to eq( 137.50776405003785 )

    expect( MetalicRatio.golden_angle_degree ).to eq( 137.50776405003785 )
    expect( MetalicRatio.golden_angle(:degree) ).to eq( 137.50776405003785 )
    expect( MetalicRatio.golden_angle("degree") ).to eq( 137.50776405003785 )


    expect( MetalicRatio.golden_angle_rad ).to eq( 2.399963229728653 )
    expect( MetalicRatio.golden_angle(:rad) ).to eq( 2.399963229728653 )
    expect( MetalicRatio.golden_angle("rad") ).to eq( 2.399963229728653 )

    expect( MetalicRatio.golden_angle_radian ).to eq( 2.399963229728653 )
    expect( MetalicRatio.golden_angle(:radian) ).to eq( 2.399963229728653 )
    expect( MetalicRatio.golden_angle("radian") ).to eq( 2.399963229728653 )

    expect( MetalicRatio.metalic_ratio(5) ).to eq( 5.192582403567252 )
    expect( MetalicRatio.get(5) ).to eq( 5.192582403567252 )
    expect( MetalicRatio.of(5) ).to eq( 5.192582403567252 )

  end

  it 'can call constants by using const_missing' do
    expect( MetalicRatio::GOLDEN_RATIO ).to eq( 1.618033988749895 )
    expect( MetalicRatio::SILVER_RATIO ).to eq( 2.414213562373095 )
    expect( MetalicRatio::BRONZE_RATIO ).to eq( 3.302775637731995 )

    expect( MetalicRatio::YAMATO_RATIO ).to eq( 1.4142135623730951 )

    expect( MetalicRatio::GOLDEN_ANGLE_DEG ).to eq( 137.50776405003785 )
    expect( MetalicRatio::GOLDEN_ANGLE_DEGREE ).to eq( 137.50776405003785 )

    expect( MetalicRatio::GOLDEN_ANGLE_RAD ).to eq( 2.399963229728653 )
    expect( MetalicRatio::GOLDEN_ANGLE_RADIAN ).to eq( 2.399963229728653 )
  end
end