class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :nickname
    end
#ランキング
    before_action :ranking
  def ranking
    product_ids = Comment.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
      @ranking = product_ids.map { |id| Product.find(id) }
  end
end
