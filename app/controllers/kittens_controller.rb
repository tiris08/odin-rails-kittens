class KittensController < ApplicationController

  def index
    @kittens = Kitten.all

    respond_to do |f|
      f.html
      f.json { render :json => @kittens }
    end
  end  
  
  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |f|
      f.html
      f.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, notice: "Succsesfully created!"
    else
      render :new
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Succsesfully updated!"
    else
      render :edit
    end 
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, notice: "Your post was successfully deleted!"
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
