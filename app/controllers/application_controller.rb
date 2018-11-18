# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Estos metodos pueden ser llamados dentro de los controladores

  # El metodo sign_in recibe el user desde el controlador sessions e implanta una cookie en el navegador, con el id del usuario
  def sign_in(user)
    cookies.permanent.signed[:user_id] = user.id
    @current_user = user
    end

  # Cuando es llamado borra la cookie y reinicia la variable que contiene la informacion del usuario actual
  def sign_out
    cookies.delete(:user_id)
    @current_user = nil
  end

  private

  # metodo que permite saber si el usuario esta autenticado o no
  def signed_in?
    !current_user.nil?
  end
  helper_method :signed_in?

  def current_user
    @current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
  rescue ActiveRecord::RecordNotFound
  end
  helper_method :current_user

  def private_access
    redirect_to :login unless signed_in?
  end

  def public_access
    redirect_to root_path if signed_in?
  end
end
