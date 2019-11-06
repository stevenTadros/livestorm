require "json"

module Livestorm
    class Room
        attr_accessor :id, :name, :enemy

        def initialize(id, name, enemy)
            @id = id
            @name = name
            @enemy = enemy

            validate!
        end

        def self.parse(room_data)
            Room.new(room_data['id'],
                     room_data['name'],
                     room_data['enemy'])
        end

        def validate!
            instance_variables.map do |var|
                if instance_variable_get(var) === nil
                    raise "invalid room data format"
                end
            end
        end

    end
end
