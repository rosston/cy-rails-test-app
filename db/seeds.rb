# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ActiveRecord::Base.transaction do
  Community.destroy_all
  User.destroy_all

  pat = User.create(name: 'Pat')
  cottages = Community.create(name: 'The Cottages')
  the_board = cottages.committees.create(name: 'The Board')
  the_board.tickets.create(title: 'Help', body: 'I need somebody', user: pat)
end
