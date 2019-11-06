require "json"

module Livestorm
    class Enemy
        attr_accessor :id,
                      :name,
                      :question,
                      :narrative

        def initialize(id, name, question, narrative)
            @id = id
            @name = name
            @question = question
            @narrative = narrative

            validate!
        end

        def self.parse(enemy_data)
            Enemy.new(enemy_data['id'],
                      enemy_data['name'],
                      enemy_data['question'],
                      enemy_data['narrative'])
        end

        def validate!
            instance_variables.map do |var|
                if instance_variable_get(var) === nil
                    raise "invalid enemy data format"
                end
            end
        end
    end
end