class WelcomeController < ApplicationController
  def index
	@factor_weights = FactorWeight.find(params[:id])
	@sample = WaterSampleLib.find(1)
	@hash = WaterSampleLib.find(1).to_hash(true)
	@factors = WaterSampleLib.get_all_factors()
	@sites = WaterSampleLib.get_all_sites()
  end
end
