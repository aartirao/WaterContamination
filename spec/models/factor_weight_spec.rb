require 'spec_helper'
require 'rails_helper'

describe FactorWeight do
  it 'ascertains correct creation' do
    FactorWeight.count.should == 0
    FactoryGirl.create(:factor_weight1)
    FactorWeight.count.should == 1

    FactorWeight.find(1).id.should == 1
  end

  it 'ascertains correct values' do
    test = FactoryGirl.build(:factor_weight1)
    FactoryGirl.create(:factor_weight1)

    factor = FactorWeight.find(1)

    factor.chloroform_weight.should == test.chloroform_weight
    factor.bromoform_weight.should == test.bromoform_weight
    factor.bromodichloromethane_weight.should == test.bromodichloromethane_weight
    factor.dibromichloromethane_weight.should == test.dibromichloromethane_weight
  end

end