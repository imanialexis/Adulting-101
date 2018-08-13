require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './models/user.rb'
require './models/post.rb'
require './models/tag.rb'
require './models/post_tag.rb'



set :database, {adapter: 'postgresql', database: 'adulting'}