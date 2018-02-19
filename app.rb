require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require "database_wrapper"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/healthz' do
  'Service is up and running!'
end

get '/select' do
  db = DatabaseWrapper.new
  @result = db.select
  erb :select
end

get '/insert' do
	id = params[:id]
	product_name = params[:product_name]
  db = DatabaseWrapper.new
  db.insert(id, product_name)
end

get '/update' do
	id = params[:id]
	product_name = params[:product_name]
  db = DatabaseWrapper.new
  db.update(id, product_name)
end

get '/delete' do
	id = params[:id]
  db = DatabaseWrapper.new
  db.delete(id)
end

get '/selectcount' do
  db = DatabaseWrapper.new
  @result = db.execute("select count(1) from products")
  erb :select_count
end
