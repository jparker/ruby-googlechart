require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::Axis do
  before do
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Axis }
  end
end
