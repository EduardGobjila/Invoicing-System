class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all.reverse
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
