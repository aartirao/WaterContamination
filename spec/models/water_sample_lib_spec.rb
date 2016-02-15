require 'spec_helper'
require 'rails_helper'

describe WaterSample do 
	describe FactorWeight do
		it 'ascertains correct values' do
	    	test = FactoryGirl.build(:factor_weight1)
	    	FactoryGirl.create(:factor_weight1)
	    	sample = FactoryGirl.build(:water_sample1)
	    	FactoryGirl.create(:water_sample1)

		    factor = WaterSampleLib.find(1).factor(1)

		    expect(factor) == test.chloroform_weight*sample.chloroform + test.bromoform_weight*sample.bromoform 
		    + test.bromodichloromethane_weight*sample.bromodichloromethane + test.dibromichloromethane_weight*sample.dibromichloromethane
  		end

  		it 'checks to_hash with factors' do
			test = FactoryGirl.build(:water_sample1)
		    FactoryGirl.create(:water_sample1)
		    FactoryGirl.create(:factor_weight1)
		    FactoryGirl.create(:factor_weight2)

		    sample = WaterSampleLib.find(1).to_hash(true)

		    hash = Hash.new
		    hash[:id] = test.id
		    hash[:site] = test.site
		    hash[:chloroform] = test.chloroform
		    hash[:bromoform] = test.bromoform
		    hash[:bromodichloromethane] = test.bromodichloromethane
		    hash[:dibromichloromethane] = test.dibromichloromethane
		    expect(sample[:id]) == hash[:id]
		    expect(sample[:site]) == hash[:site]
		    expect(sample[:chloroform]) == hash[:chloroform]
		    expect(sample[:bromoform]) == hash[:bromoform]
		    expect(sample[:bromodichloromethane]) == hash[:bromodichloromethane]
		    expect(sample[:dibromichloromethane]) == hash[:dibromichloromethane]
		    expect(sample[:factor_1]) == hash[:factor_1]
			expect(sample[:factor_2]) == hash[:factor_2]

		end

	end

	it 'checks find method' do
		test = FactoryGirl.build(:water_sample1)
	    FactoryGirl.create(:water_sample1)

	    sample = WaterSampleLib.find(1)

	    expect(sample.chloroform) == test.chloroform
	    expect(sample.bromoform) == test.bromoform
	    expect(sample.bromodichloromethane) == test.bromodichloromethane
	    expect(sample.dibromichloromethane) == test.dibromichloromethane


	end

	it 'checks to_hash without factors' do
		test = FactoryGirl.build(:water_sample1)
	    FactoryGirl.create(:water_sample1)

	    sample = WaterSampleLib.find(1).to_hash(true)
	    
	    hash = Hash.new
	    hash[:id] = test.id
	    hash[:site] = test.site
	    hash[:chloroform] = test.chloroform
	    hash[:bromoform] = test.bromoform
	    hash[:bromodichloromethane] = test.bromodichloromethane
	    hash[:dibromichloromethane] = test.dibromichloromethane

	    expect(sample[:id]) == hash[:id]
		expect(sample[:site]) == hash[:site]
		expect(sample[:chloroform]) == hash[:chloroform]
		expect(sample[:bromoform]) == hash[:bromoform]
		expect(sample[:bromodichloromethane]) == hash[:bromodichloromethane]
		expect(sample[:dibromichloromethane]) == hash[:dibromichloromethane]

	end
end