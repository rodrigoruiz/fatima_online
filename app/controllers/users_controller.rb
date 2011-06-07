class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :show, :edit, :update]
  before_filter :correct_user, :only => [:show, :edit, :update]
  before_filter :admin_user,   :only => [:index, :destroy]
  
  def index
    if current_user.admin?
      @title = "Todos os pacientes"
      @users = User.all
    else
      redirect_to root_path
    end
  end
  
  def show
    @title = @user.nome
  end
  
  def new
    @user = User.new
    @title = "Cadastre-se"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Obrigado por se cadastrar! Se possivel mantenha suas informacoes atualizadas."
      redirect_to @user
    else
      @title = "Cadastre-se"
      @user.password = ""
      @user.password_confirmation = ""
      render 'new'
    end
  end
  
  def edit
    @title = "Editar informacoes"
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Cadastro atualizado."
      redirect_to @user
    else
      @title = "Editar informacoes"
      render 'edit'
    end
  end
  
  def destroy
    user = User.find(params[:id])
    unless user.admin?
      user.destroy
      flash[:success] = "Cadastro destruido."
    end
    redirect_to users_path
  end
  
  private
    def authenticate
      deny_access unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
