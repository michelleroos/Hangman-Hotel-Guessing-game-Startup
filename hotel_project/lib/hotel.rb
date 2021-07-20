require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, rooms_hash)
        @name = name
        @rooms = Hash.new 
        rooms_hash.each { |k, v| @rooms[k] = Room.new(v) }
    end
    
    def name
        new_string = []
        @name.split.each { |word| new_string << word.capitalize }
        new_string.join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
        else
            puts 'sorry, room does not exist'
        end
    end

    # def has_vacancy?
    #     @rooms.each do |k, v| 
    #         return false if @rooms[k].full? 
    #     end
    #     true
    # end

    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0 }
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts room_name + ": " + room.available_space.to_s
        end
    end

end

# hotel_1 = Hotel.new("Chris Hotel", {"room_1"=>4, "room_2"=>2})
# room_1 = Room.new(4)

# <Room:0x00007fcb0f03ef58 @capacity=4, @occupants=[]>