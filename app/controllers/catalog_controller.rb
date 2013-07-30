class CatalogController < ApplicationController
  def home
    respond_to do |format|
      format.html
      format.mobile
    end

  end

  def mobile
  end
end
