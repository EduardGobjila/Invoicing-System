class InvoicesController < ApplicationController

  def index
    if params[:sort] == "current"
      @invoices = Invoice.where("created_at >= ?", DateTime.now.beginning_of_week)
    elsif params[:sort] == "last_week"
      @invoices = Invoice.where("created_at >= ? and created_at <= ?", DateTime.now.beginning_of_week - 7, DateTime.now.end_of_week - 7)
    elsif params[:sort] == "current_month"
      @invoices =  Invoice.where("created_at >= ? and created_at <= ?", DateTime.now.beginning_of_month, DateTime.now.end_of_month)
    elsif params[:sort] == "last_month"
      @invoices =  Invoice.where("created_at >= ? and created_at <= ?", DateTime.now.beginning_of_month.prev_month , DateTime.now.end_of_month.prev_month )
    elsif params[:sort] == "newest"
      @invoices = Invoice.order(created_at: :desc)
    else
      @invoices = Invoice.all
    end

    if params[:q].present?
      @invoices = Invoice.where("company_name ILIKE ?", "%#{params[:q]}%")
    else
      @invcoices = Invoice.all
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    # @user = User.find(@user_id)
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    if @invoice.save
      redirect_to invoices_path(@invoice)
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(invoice_params)
    redirect_to invoice_path(@invoice)
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path, notice: 'Post was successfully deleted.', status: :see_other
  end

  private

  def invoice_params
    params.require(:invoice).permit(:company_name, :invoice_number, :price, :paid_with)
  end
end
