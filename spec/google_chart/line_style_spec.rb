require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::LineStyle do
  before do
    @klass = Class.new(MockChart).class_eval { include GoogleChart::LineStyle }
  end
end
