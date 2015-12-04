class RecipesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipe = Recipe.all.order("created_at DESC")
	end

	def show
	end

	def new 
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to @recipe, notice: "Successfully created a recipe!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.destroy
   respond_to do |format|
      format.html { redirect_to recipes_path }
      format.json { head :no_content }
      render :js => "window.location = '#{recipes_path}'"
    end
	end

	private

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
	end

end