class ApisController < ApplicationController
	def getWaterSamples()
		
		puts params[:site_id]
		@factor_weights = FactorWeight.find(params[:factor_id])
		@sample = WaterSampleLib.find(params[:site_id])
		@sample_factor = @sample.factor(params[:factor_id])
		result = Hash.new
		result[:sample] = @sample
		result[:factor] = @sample_factor
		render json: result
	end
end