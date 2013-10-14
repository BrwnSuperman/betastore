class LoginsController < ApplicationController

  skip_before_filter :require_log_in

  def create
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      cookies[:customer_id] = customer.id
      redirect_to products_path
    else
      redirect_to log_in_path, alert: 'Log In Failed'
    end
  end

  def destroy
    cookies.delete(:customer_id)
    redirect_to products_path
  end

  def index
    @logins = Login.all
  end

  # GET /logins/1
  # GET /logins/1.json
  def show
  end

  # GET /logins/new
  def new
    @login = Login.new
  end

  # GET /logins/1/edit
  def edit
  end

  # POST /logins
  # POST /logins.json
  def create
    @login = Login.new(login_params)

  end
  # respond_to do |format|
  #  if @login.save
  #      format.html { redirect_to @login, notice: 'Login was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @login }
  #    else
  #       format.html { render action: 'new' }
  #       format.json { render json: @login.errors, status: :unprocessable_entity }
  #      end
  #    end
  # end

  # # PATCH/PUT /logins/1
  # # PATCH/PUT /logins/1.json
  # def update
  #   respond_to do |format|
  #     if @login.update(login_params)
  #       format.html { redirect_to @login, notice: 'Login was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @login.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /logins/1
  # # DELETE /logins/1.json
  # def destroy
  #   @login.destroy
  #   respond_to do |format|
  #     format.html { redirect_to logins_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_login
    @login = Login.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def login_params
    params[:login, :email, :password]
  end
end