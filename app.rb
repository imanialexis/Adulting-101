require 'sinatra'
# require 'sinatra/reloader'
#comment out reloader when deploying to heroku
require 'sinatra/activerecord'
require './models/user.rb'
require './models/post.rb'
require './models/tag.rb'
require './models/post_tag.rb'

enable :sessions



get "/" do
    if session[:user_id]
        #if user session is active send them to the posts page
        @posts = Post.all
        erb :post
    else
        #if user session isn't active send them to the homepage with option to login or sign-up
        erb :homepage , :layout => :layouttwo
    end
end

get "/login" do
    erb :login
end

post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
        session[:user_id] = @user.id
        redirect "/posts"
    else
        #popup saying username or password was incorrect send them back to 
        # redirect "/signup"
        redirect "/"
    end
end


get "/signup" do
    erb :signup
end


post "/signup" do
    @user = User.create(
        first_name: params[:first_name],
        last_name: params[:last_name],
        password: params[:password], 
        username: params[:username], 
        email: params[:email], 
        birthday: params[:birthday],
        photo_url: params[:photo_url]
    )
    #this MUST be in the same order as in your database

    # this line does the signing in
    session[:user_id] = @user.id
  
    redirect "/posts"
  end


  get "/signout" do
    # this is the line that signs a user out
    session[:user_id] = nil
      
    redirect "/"
  end



get "/posts" do
    if session[:user_id]
    @posts = Post.order('created_at DESC').all
    #post are in order where newest will be on top

    erb :post
    else
        redirect "/"
    end
end

get "/posts/:id/edit" do
    puts 'HELLO WORLD'
    # @user = User.find(params[:id])
    @current_post = Post.find(params[:id])
    puts '*************'
    puts @current_post.id
    puts '*************'
    erb :edit_post
end


put "/posts/:id/edit" do

        @current_post = Post.find(params[:id])
        @current_post.update(title: params[:title], post_content: params[:post_content], photo_url: params[:photo_url], user_id: session[:user_id])
    
        redirect "/posts"
    end

    delete "/posts/:id/delete" do
        puts "IM IN THE DELETE METHOD"
        @current_user =  User.find(session[:user_id])
        @current_post =  Post.find(params[:id])
        @current_post.destroy
    
        redirect "/users/#{@current_user.id}"
    end
    

get "/posts/new" do
    erb :new_post
end


post "/posts" do
    Post.create(
        title: params[:title],
        post_content: params[:post_content],
        photo_url: params[:photo_url],
        user_id: session[:user_id]
        )
    redirect '/posts'
end

 



  get "/users/:id" do
    if session[:user_id]
        @current_user =  User.find(params[:id])
        @posts_by_current_user = Post.where(user_id: @current_user.id)
        erb :profile
    else
        redirect "/"
    end
end


 
put '/users/:id' do 
    @current_user =  User.find(params[:id])
    @current_user.update(
        first_name: params[:first_name],
        last_name: params[:last_name],
        password: params[:password], 
        username: params[:username], 
        email: params[:email], 
        birthday: params[:birthday],
        photo_url: params[:photo_url]
    )
  
    redirect "/users/#{@current_user.id}"
end


delete '/users/:id' do 
    @current_user =  User.find(params[:id])
    @current_user.destroy
    session[:user_id] = nil
    redirect '/'
end



  get '/users/:id/edit_profile' do 
    if session[:user_id]
        @current_user =  User.find(params[:id])
        @posts_by_current_user = @current_user.posts

        erb :edit_profile

    else
        redirect "/"
    end
end

# put "/users/:id/edit_post" do
#     @current_post = Post.find(params[:id])
#     @current_post.update(title: params[:title], post_content: params[:post_content], photo_url: params[:photo_url], user_id: session[:user_id])

#     redirect "/posts"
# end 

# get '/users/:id/edit_post' do 
#     if session[:user_id]
#         @current_post =  Post.find(params[:id])
#         erb :edit_post
#     else
#         redirect "/posts"
#     end
# end

