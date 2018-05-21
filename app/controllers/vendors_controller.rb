class VendorsController < ApplicationController
  def show
    @vendor = Vendor.friendly.find(params[:id])

    authorize @vendor
  end
end
