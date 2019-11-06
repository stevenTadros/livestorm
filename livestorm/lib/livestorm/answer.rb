require "json"

module Livestorm
    class Answer
        attr_accessor :id,
                      :result

        def initialize(id, result)
            @id = id
            @result = result

            validate!
        end

        def self.parse(answer_data)
            Answer.new(answer_data['id'],
                       answer_data['result'])
        end

        def validate!
            instance_variables.map do |var|
                if instance_variable_get(var) === nil
                    raise "invalid answer data format"
                end
            end
        end

    end
end