require 'sinatra'
require 'pry'


get '/' do
  erb :index
end

get '/command_line_list' do
  erb :command_line_list
end

get '/command_line_command/:command' do
  @command = params[:command]
  @command_value = `man #{@command} | col -b`
  erb :command
end

get '/search' do
  erb :search
end

post '/search' do
  term = params[:term]
  @command = term
  @command_value = `man #{term} | col -b`
  @search = true
  @command_value = 'Invalid Command' if @command_value == ''
  erb :command
end