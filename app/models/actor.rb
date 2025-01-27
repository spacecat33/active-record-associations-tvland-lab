class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        "#{self.characters.all.collect {|c|c.name}[0]} - #{self.shows.all.collect {|s|s.name}.flatten[0]}"
    end
end