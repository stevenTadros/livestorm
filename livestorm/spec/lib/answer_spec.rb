RSpec.describe Livestorm::Answer do
    context 'with good data' do
        let (:data) {{"id"=>1, "result"=>"no"}}

        it "parse answer data" do
        parsed_data = Livestorm::Answer.parse(data)

        expect(parsed_data.id).to eql(1)
        expect(parsed_data.result).to eql("no")
        end
    end

    context 'with missing data' do
        let (:data) {{"id"=>1}}

        it "raise an error" do
            expect {Livestorm::Answer.parse(data)}.to raise_error("invalid answer data format")
        end
    end
end