require 'spec_helper'
require 'rails_helper'

describe WaterSample do
  it 'ascertains correct creation' do
    WaterSample.count.should == 0
    FactoryGirl.create(:water_sample1)
    WaterSample.count.should == 1

    WaterSample.find(1).id.should == 1
  end
 

  it 'ascertains correct values' do
    test = FactoryGirl.build(:water_sample1)
    FactoryGirl.create(:water_sample1)

    sample = WaterSample.find(1)

    sample.chloroform.should == test.chloroform
    sample.bromoform.should == test.bromoform
    sample.bromodichloromethane.should == test.bromodichloromethane
    sample.dibromichloromethane.should == test.dibromichloromethane
  end


end