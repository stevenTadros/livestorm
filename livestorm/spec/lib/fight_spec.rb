RSpec.describe Livestorm::Fight do
    describe "::answer_is_correct" do
        let(:result) {Livestorm::Fight.answer_is_correct?(userAnswer, answer)}
        context 'right answer' do
            let(:userAnswer) { "yes" }
            let(:answer) { Livestorm::Answer.new(1, "yes") }

            it "return true" do
                expect(result).to eql(true)
            end
        end

        context 'wrong answer' do
            let(:userAnswer) { "no" }
            let(:answer) { Livestorm::Answer.new(1, "yes") }

            it "return false" do
                expect(result).to eql(false)
            end
        end
    end

    describe "::find_ennemy" do
        context 'enemy is in data' do
            let(:result) { Livestorm::Fight.find_enemy(enemies, room) }
            let(:room) { Livestorm::Room.new(1, "foo", 1) }
            let(:enemy_1) { Livestorm::Enemy.new(1, "foo", "test?", "text")}
            let(:enemy_2) { Livestorm::Enemy.new(2, "bar", "test?", "text")}
            let(:enemies) { [enemy_1, enemy_2] }

            it "return enemy" do
                expect(result).to eql(enemy_1)
            end
        end
    end

    describe "::find_answer" do
        context 'answer is in data' do
            let(:result) { Livestorm::Fight.find_answer(answers, room) }
            let(:room) { Livestorm::Room.new(2, "foo", 1) }
            let(:answer_1) { Livestorm::Answer.new(1, "yes")}
            let(:answer_2) { Livestorm::Answer.new(2, "no")}
            let(:answers) { [answer_1, answer_2] }

            it "return answer" do
                expect(result).to eql(answer_2)
            end
        end
    end

    describe "::last_room" do
        let(:result) { Livestorm::Fight.last_room?(index, roomCount) }
        let(:roomCount) { 3 }

        context "it's the last room" do
            let(:index) { 2 }

            it "return true" do
                expect(result).to eql(true)
            end
        end

        context "it's not the last room" do
            let(:index) { 0 }

            it "return false" do
                expect(result).to eql(false)
            end
        end
    end
end