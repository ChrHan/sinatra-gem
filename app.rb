require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require "database_wrapper"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  'Hello world!'
end

get '/select' do
  #db = DatabaseWrapper.new
  #db.select
	@result = DatabaseWrapper.select
  erb :select
end

get '/insert' do
	id = params[:id]
	product_name = params[:product_name]
  DatabaseWrapper.insert(id, product_name)
end

get '/update' do
	id = params[:id]
	product_name = params[:product_name]
  DatabaseWrapper.update(id, product_name)
end

get '/delete' do
	id = params[:id]
  DatabaseWrapper.delete(id)
end

get '/selectcount' do
  DatabaseWrapper.execute('select count(1) from products').to_s
end
