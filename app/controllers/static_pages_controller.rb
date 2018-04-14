class StaticPagesController < ApplicationController
	def home
    @category_schnaps_and_minis = Category.find_by(name: "Schnaps & Minis")
    @category_gin = Category.find_by(name: "Gin")
    @category_rum = Category.find_by(name: "Rum")
    @category_vodka = Category.find_by(name: "Vodka")
    @category_whiskey = Category.find_by(name: "Whiskey")
    @category_wine = Category.find_by(name: "Wein")
	end
end
