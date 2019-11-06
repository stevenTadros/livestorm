RSpec.describe Livestorm::Enemy do
    context 'with good data' do
        let (:data) {{ "id"=>1,
                       "name"=>"foo",
                       "question"=>"bar",
                       "narrative"=>"oto"}}

        it "parse enemy data" do
        parsed_data = Livestorm::Enemy.parse(data)

        expect(parsed_data.id).to eql(1)
        expect(parsed_data.name).to eql("foo")
        expect(parsed_data.question).to eql("bar")
        expect(parsed_data.narrative).to eql("oto")
        end
    end

    context 'with missing data' do
        let (:data) {{"id"=>1}}

        it "raise an error" do
            expect {Livestorm::Enemy.parse(data)}.to raise_error("invalid enemy data format")
        end
    end
end