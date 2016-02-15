require 'spec_helper'
require 'rails_helper'

describe WaterSample do
  it 'ascertains correct creation' do
    expect(WaterSample.count) == 0
    FactoryGirl.create(:water_sample1)
    expect(WaterSample.count) == 1

    expect(WaterSample.find(1).id) == 1
  end
 

  it 'ascertains correct values' do
    test = FactoryGirl.build(:water_sample1)
    FactoryGirl.create(:water_sample1)

    sample = WaterSample.find(1)

    expect(sample.chloroform) == test.chloroform
    expect(sample.bromoform) == test.bromoform
    expect(sample.bromodichloromethane) == test.bromodichloromethane
    expect(sample.dibromichloromethane) == test.dibromichloromethane
  end
end