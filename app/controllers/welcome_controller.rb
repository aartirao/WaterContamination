class WelcomeController < ApplicationController
  def index
	@sample = WaterSampleLib.find(1)
	@factors = WaterSampleLib.get_all_factors()
	@sites = WaterSampleLib.get_all_sites()
  end
end
