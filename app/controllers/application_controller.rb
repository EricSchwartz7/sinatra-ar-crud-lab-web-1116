require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(id = params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(id = params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(id = params[:id])
    # binding.pry
    @post.update(name: params[:name], content: params[:content])
    redirect 'posts/'"#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(id = params[:id])
    @post_name = @post.name
    # Need to store the name before the instance gets deleted.
    @post.delete
    erb :deleted
  end


end
