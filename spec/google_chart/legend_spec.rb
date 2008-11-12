require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::Legend do
  before do
    @klass = Class.new(MockChart).class_eval { include GoogleChart::Legend }
  end
end
