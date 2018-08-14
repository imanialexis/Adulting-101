require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './models/user.rb'
require './models/post.rb'
require './models/tag.rb'
require './models/post_tag.rb'

enable :sessions

set :database, {adapter: 'postgresql', database: 'adulting'}

get "/" do

    erb :homepage , :layout => :layouttwo
end

get "/login" do
    
    erb :login_page
end



# get "/" do
#     if session[:user_id]
#       erb :signed_in_homepage
#     else
#       erb :signed_out_homepage
#     end
#   end