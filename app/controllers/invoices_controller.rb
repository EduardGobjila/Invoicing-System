class InvoicesController < ApplicationController

  def index
    if params[:sort] == "current"

      # @invoices = Invoice.where("created_at >= ?", Date.today.beginning_of_week..Date.today.end_of_week)
      @invoices = Invoice.where("created_at >= ?", DateTime.now.beginning_of_week)
    elsif params[:sort] == "last_week"
      # @invoices = ActiveRecord::Base.connection.execute(SELECT * FROM invoices WHERE id = 1)
      @invoice = Invcoice.all
    elsif params[:sort] == "newest"
      @invoices = Invoice.order(created_at: :desc)
    elsif params[:sort] == "oldest"
      @invoices = Invoice.order(created_at: :asc)
    else
      @invoices = Invoice.all.reverse
    end

    if params[:q].present?
      @invoices = Invoice.where("company_name ILIKE ?", "%#{params[:q]}%")
    else
      @invcoices = Invoice.all
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoices_path(@invoice)
      flash[:success] = "Invoice Added Successfully"
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path, notice: 'Post was successfully destroyed.', status: :see_other
  end

  private

  def invoice_params
    params.require(:invoice).permit(:company_name, :invoice_number, :price, :paid_with)
  end
end
