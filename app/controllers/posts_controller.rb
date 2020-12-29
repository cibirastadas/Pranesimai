# frozen_string_literal: true

class PostsController < ApplicationController
  # uzdedu slaptazodi, kad negaletu pasaliniai daryti pakeitimu, isskyrus ant index, show page
  http_basic_authenticate_with name: 'tadas', password: '123', except: %i[index show]
  def index
    @posts = Post.all # Gaunu visus postus
  end

  # Is create metodo nukreipiu cia
  def show
    @post = Post.find(params[:id]) # Is url yra gaunamas id
  end

  def new
    @post = Post.new
  end

  # Sukuriamas post
  def create
    @post = Post.new(post_params) # sukuriu kintamaji post, nurodau modeli ir paduodu metoda
    if @post.save # issaugo duomenis ir vyksta patvirtinimas
      redirect_to @post # peradresuoju i ta posta, show view
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  # Atnaujinu posta
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  # nurodau specialius laukus kur post gali tureti. Gali priimti tik title ir body
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
