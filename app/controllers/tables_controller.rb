class TablesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    # Default will render `new.html`.
  end

  def create
    table = Table.make_table(params[:csv], params[:numColumns].to_i)
    render json: table
  end
end
