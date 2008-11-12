require File.dirname(__FILE__) + '/../spec_helper'

describe GoogleChart::GridLine do
  before do
    @klass = Class.new(MockChart).class_eval { include GoogleChart::GridLine }
  end
end
