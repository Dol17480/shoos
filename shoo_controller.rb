require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/shoe')

get '/shoe/new' do
  # return 'Hello World'
  erb( :new )
end

post '/shoe' do 
  @shoe = Shoe.new(params)
  @shoe.save
  erb( :confirm )


end

get '/orders' do 

  @shoes = Shoe.all
  erb( :orders)

end