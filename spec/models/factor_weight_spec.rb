require 'spec_helper'
require 'rails_helper'

describe FactorWeight do
  it 'ascertains correct creation' do
    expect(FactorWeight.count) == 0
    FactoryGirl.create(:factor_weight1)
    expect(FactorWeight.count) == 1

    expect(FactorWeight.find(1).id) == 1
  end

  it 'ascertains correct values' do
    test = FactoryGirl.build(:factor_weight1)
    FactoryGirl.create(:factor_weight1)

    factor = FactorWeight.find(1)

    expect(factor.chloroform_weight) == test.chloroform_weight
    expect(factor.bromoform_weight) == test.bromoform_weight
    expect(factor.bromodichloromethane_weight) == test.bromodichloromethane_weight
    expect(factor.dibromichloromethane_weight) == test.dibromichloromethane_weight
  end

end