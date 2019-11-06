Dir[File.join(__dir__, 'livestorm', '*.rb')].each { |file| require file }
require 'tty-prompt'
require 'i18n'

module Livestorm
  class GameLauncher

    def self.start_game(path)
      init_game()
      game_intro()

      file = File.read(path)
      data = JSON.parse(file)

      rooms, enemies, answers = parse_file(data)

      Fight.explore_rooms(rooms, enemies, answers)
    end

    def self.parse_file(data)
      # TODO test if all data are present
      rooms = data['rooms'].map do |room_data|
        Room.parse(room_data)
      end

      enemies = data['enemies'].map do |enemy_data|
        Enemy.parse(enemy_data)
      end

      answers = data['answers'].map do |answer_data|
        Answer.parse(answer_data)
      end

      return [rooms, enemies, answers]
    end

    def self.game_intro
      @prompt.ok(I18n.t(:welcome))
      @prompt.ok(I18n.t(:help_info))
      @prompt.ok(I18n.t(:rules))

      if @prompt.select(I18n.t(:ready), [I18n.t(:positive), I18n.t(:negative)]) === I18n.t(:negative)
        @prompt.error(I18n.t(:bye))
        exit(1)
      end
    end

    def self.init_game
      I18n.load_path << Dir['livestorm/config/locales/en.yml']
      I18n.default_locale = :en

      @prompt = TTY::Prompt.new

      @prompt.on(:keypress) do |event|
        if event.value == 'h'
          @prompt.multiline(help: I18n.t(:help))
        end
      end
    end

  end
end
