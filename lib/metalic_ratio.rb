require "metalic_ratio/version"

# This namespace contains methods returning metalic ratio numbers.
# @note 貴金属比（黄金比 1.618... など）を返すメソッドを格納する名前空間
module MetalicRatio
  
  # 黄金比 (golden ratio)
  # @return [Float]
  # @example
  #   MetalicRatio.golden_ratio => 1.618033988749895
  #   MetalicRatio::GOLDEN_RATIO => 1.618033988749895
  def self.golden_ratio
    metalic_ratio(1)
  end

  # 白銀比 (silver ratio)
  # @return [Float]
  # @example
  #   MetalicRatio.silver_ratio => 2.414213562373095
  #   MetalicRatio::SILVER_RATIO => 2.414213562373095
  def self.silver_ratio
    metalic_ratio(2)
  end

  # 青銅比 (bronze ratio)
  # @return [Float]
  # @example
  #   MetalicRatio.bronze_ratio => 3.302775637731995
  #   MetalicRatio::BRONZE_RATIO => 3.302775637731995
  def self.bronze_ratio
    metalic_ratio(3)
  end

  # 大和比 (yamato ratio)
  # @return [Float]
  # @example
  #   MetalicRatio::yamato_ratio => 1.4142135623730951 (= sqrt(2) )
  #   MetalicRatio::YAMATO_RATIO => 1.4142135623730951
  # @return [Float]
  def self.yamato_ratio
    ::Math.sqrt(2)
  end

  # 黄金角 (golden angle) [deg]
  # @return [Float]
  # @example
  #   MetalicRatio.golden_angle_deg => 137.50776405003785
  #   MetalicRatio.golden_angle_degree => 137.50776405003785
  #   MetalicRatio.golden_angle( :deg ) => 137.50776405003785
  #   MetalicRatio.golden_angle( "degree" ) => 137.50776405003785
  #   MetalicRatio::GOLDEN_ANGLE_DEG => 137.50776405003785
  def self.golden_angle_deg
    360 / ( 1 + golden_ratio )
  end

  # 黄金角 [rad]
  # @return [Float]
  # @example
  #   MetalicRatio.golden_angle_rad => 2.399963229728653 ( = 0.7639320225002102 * pi )
  #   MetalicRatio.golden_angle_radian => 2.399963229728653
  #   MetalicRatio.golden_angle( :rad ) => 2.399963229728653
  #   MetalicRatio.golden_angle( "radian" ) => 2.399963229728653
  #   MetalicRatio::GOLDEN_ANGLE_RAD => 2.399963229728653
  def self.golden_angle_rad
    2 * Math::PI / ( 1 + golden_ratio )
  end
  
  def self.golden_angle( type )
    raise "Error" unless [ "deg" , "degree" , "rad" , "radian" ].include?( type.to_s )
    case type.to_s
    when "deg" , "degree"
      golden_angle_deg
    when "rad" , "radian"
      golden_angle_rad
    end
  end

  # 貴金属比 (metalic ratio)
  # @return [Float]
  def self.metalic_ratio(n)
    ( n + Math.sqrt( n ** 2 + 4 ) ) * 1.0 / 2
  end

  class << self
    alias :golden_angle_degree :golden_angle_deg
    alias :golden_angle_radian :golden_angle_rad

    alias :of :metalic_ratio
    alias :get :metalic_ratio
  end

  [
    :golden_ratio , :silver_ratio , :bronze_ratio , :yamato_ratio ,
    :golden_angle_deg , :golden_angle_degree , :golden_angle_rad , :golden_angle_radian ,
    :golden_angle
  ].each do | instance_method_name |
    eval <<-DEF
      def #{ instance_method_name }( *args )
        ::MatalicRatio.send( instance_method_name , *args )
      end
    DEF
  end

  MISSING_CONSTS = [
    :golden_ratio , :silver_ratio , :bronze_ratio , :yamato_ratio ,
    :golden_angle_deg , :golden_angle_degree , :golden_angle_rad , :golden_angle_radian
  ].map { | class_method_name |
    class_method_name.to_s.upcase
  }

  def self.const_missing( const_name , *args )
    if MISSING_CONSTS.include?( const_name.to_s ) and args.empty?
      self.send( const_name.downcase )
    else
      super( const_name , *args )
    end
  end

  def const_missing( const_name , *args )
    if MISSING_CONSTS.include?( const_name.to_s ) and args.empty?
      self.class.send( const_name.downcase )
    else
      super( const_name , *args )
    end
  end

end