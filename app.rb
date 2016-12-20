require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/store")
require("./lib/brand")
require("pg")

get('/') do
  erb(:index)
end
