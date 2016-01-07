class PizzasController < ApplicationController
  before_action :set_pizza, only: [:show, :edit, :update, :destroy]

  # GET /pizzas
  def index
    @pizzas = Pizza.all
  end

  # GET /pizzas/1
  def show
  end

  # GET /pizzas/new
  def new
    @pizza = Pizza.new
    @pizza.ingredients.build
  end

  # GET /pizzas/1/edit
  def edit
    @pizza.ingredients.build
  end

  # POST /pizzas
  def create
    @pizza = Pizza.new(pizza_params)

    if @pizza.save
      redirect_to @pizza, notice: 'Pizza was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pizzas/1
  def update
    if @pizza.update(pizza_params)
      redirect_to @pizza, notice: 'Pizza was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pizzas/1
  def destroy
    @pizza.destroy
    redirect_to pizzas_url, notice: 'Pizza was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza
      @pizza = Pizza.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pizza_params
      params.require(:pizza).permit(:name, ingredients_attributes: [:id, :name, :_destroy])
    end
end
