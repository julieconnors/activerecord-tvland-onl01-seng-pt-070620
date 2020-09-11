class Show < ActiveRecord::Base
    belongs_to :network
    has_many :characters
    has_many :actors, through: :characters

    def actors_list
        characters.collect do |character_obj|
            character_obj.actor.full_name
        end
    end

    def build_network(network_letters)
        self.network = Network.find_or_create_by(network_letters)
    end
  
end