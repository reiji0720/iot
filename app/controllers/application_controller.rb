class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :nickname
    end
#ランキング
    before_action :ranking
  def ranking
    product_ids = Comment.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
      @ranking = product_ids.map { |id| Product.find(id) }
  end

#カテ
before_action :cate
  def cate
    @catettl = Category.all
    @tagttl = Tag.all
  end

#サインアウト後
  def after_sign_out_path_for(resource)
      '/users/sign_in' # サインアウト後のリダイレクト先URL
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :nickname
      devise_parameter_sanitizer.for(:account_update) << :nickname
      devise_parameter_sanitizer.for(:sign_up) << :avatar
      devise_parameter_sanitizer.for(:account_update) << :avatar # アバターもdeviseに変更可能にさせる
    end

end
