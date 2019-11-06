require 'tty-prompt'
require 'i18n'

module Livestorm
    class Fight
        def self.explore_rooms(rooms, enemies, answers)
            set_prompt()

            rooms.each_with_index do |room, index|
                lastRoom = last_room?(index, rooms.size)
                enemy = find_enemy(enemies, room)
                answer = find_answer(answers, room)

                puts ""
                @prompt.ok(I18n.t(:final_level)) if lastRoom
                @prompt.ok(I18n.t(:room_greatings, param: room.name))

                puts ""
                @prompt.say(I18n.t(:enemy_greatings, param: enemy.name))
                @prompt.say(enemy.narrative)

                puts ""
                userAnswer = @prompt.select(enemy.question, [I18n.t(:positive), I18n.t(:negative)])

                unless answer_is_correct?(userAnswer, answer)
                    puts ""
                    @prompt.error(I18n.t(:wrong))
                    break
                end

                puts ""
                @prompt.ok(I18n.t(:right))
                puts ""
                @prompt.ok(I18n.t(:congrats)) if lastRoom
            end
        end

        def self.set_prompt()
            @prompt = TTY::Prompt.new

            @prompt.on(:keypress) do |event|
                if event.value == 'h'
                  @prompt.multiline(help: I18n.t(:help))
                end
            end
        end

        def self.last_room?(index, roomsCount)
            if index === roomsCount - 1
                true
            else
                false
            end
        end

        def self.find_enemy(enemies, room)
            # TODO handle errors if enemy is absent from data
            enemies.find { |enemy| enemy.id === room.enemy}
        end

        def self.find_answer(answers, room)
            # TODO handle errors if answer is absent from data
            answers.find { |answer| answer.id === room.id}
        end

        def self.answer_is_correct?(userAnswer, answer)
            if userAnswer === answer.result
                true
            else
                false
            end
        end

    end
end
