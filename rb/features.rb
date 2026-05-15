# Answerbook SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module AnswerbookFeatures
  def self.make_feature(name)
    case name
    when "base"
      AnswerbookBaseFeature.new
    when "test"
      AnswerbookTestFeature.new
    else
      AnswerbookBaseFeature.new
    end
  end
end
