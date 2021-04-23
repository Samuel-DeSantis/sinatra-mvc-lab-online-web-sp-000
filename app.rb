require_relative 'config/environment'

class App < Sinatra::Base

    get '/' do
        erb :user_input
    end

    post '/piglatinize' do
        p = PigLatinizer.new(params[:user_phrase])
        @pl = p.piglatinize
        erb :results
    end
end