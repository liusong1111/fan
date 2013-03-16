class OrderItemsController < ApplicationController
  # GET /order_items
  # GET /order_items.json
  def all
    @order_items = OrderItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_items }
    end
  end

  def result
    @order = Order.current
    @order_items = @order.order_items.order("created_at DESC").all
    render :index
  end

  def history
    if params[:order_name] == Time.new.strftime("%Y-%m-%d")
      redirect_to '/' and return
    end
    @order = Order.where(name: params[:order_name]).first
    @order_items = @order.order_items if @order
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_item }
    end
  end

  # GET /order_items/new
  # GET /order_items/new.json
  def new
    @order = Order.current
    @order_item = OrderItem.new
    @foods = Food.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_item }
    end
  end

  # GET /order_items/1/edit
  def edit
    @order_item = OrderItem.find(params[:id])
    @foods = Food.all
  end

  # POST /order_items
  # POST /order_items.json
  def create
    order = Order.current
    @order_item = OrderItem.new(params[:order_item])
    @order_item.order = order

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to "/", notice: "#{@order_item.user_name}你好，你订#{@order_item.food.name}成功，价格#{@order_item.food.price}元" }
        format.json { render json: @order_item, status: :created, location: @order_item }
      else
        format.html { render action: "new" }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_items/1
  # PUT /order_items/1.json
  def update
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      if @order_item.update_attributes(params[:order_item])
        format.html { redirect_to "/", notice: "#{@order_item.user_name}你好，你订#{@order_item.food.name}成功，价格#{@order_item.food.price}元" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end
end
