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

	def getFactors()

		factors = Array.new
		sites = Array.new 
		samples = WaterSampleLib.get_all_sites()
		samples.each do |s|
			factors << WaterSampleLib.find(s[:id]).factor(params[:factor_id])
			sites << s[:site]
		end
		result = Hash.new
		result[:factor_weights] = factors
		result[:site_names] = sites
		render json: result
	end

	def getSamples()

		sample_results = Array.new
		samples = WaterSampleLib.get_all_sites()
		samples.each do |s|
			findRes = WaterSampleLib.find(s[:id])
			res = Hash.new
			res[:id] = findRes.id
			res[:site] = findRes.site
			res[:chloroform] = findRes.chloroform
			res[:bromoform] = findRes.bromoform
			res[:bromodichloromethane] = findRes.bromodichloromethane
			res[:dibromichloromethane] = findRes.dibromichloromethane

			sample_results << res
		end
		render json: sample_results
	end
end