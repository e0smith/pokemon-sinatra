require_relative './config/environment.rb'
use Rack::MethodOverride
use PokemonsController
use UsersController
use SessionsController
run ApplicationController
