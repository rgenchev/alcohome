class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all

    authorize @vendors
  end

  def show
    @vendor = Vendor.find(params[:id])

    authorize @vendor
  end
end
