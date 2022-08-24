class Api::V1::AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :update, :destroy]

  def index
    @accounts = current_user.accounts
    render json: @accounts, status: :ok
  end

  def show
    render json: @account, status: :ok
  end

  def create
    @account = current_user.accounts.new(account_params)
    if @account.save
      render json: @account, status: :created
    else
      render json: { errors: @account.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      render json: @account, status: :ok
    else
      render json: { errors: @account.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @account.destroy
      render json: { message: 'Account successfully destroyed'}, status: :ok
    else
      render json: { errors: @account.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :description, :initial_amount)
  end

  def set_account
    @account = current_user.accounts.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { message: 'You are not authorized'}, status: :unauthorized if @account.nil?
  end
end
