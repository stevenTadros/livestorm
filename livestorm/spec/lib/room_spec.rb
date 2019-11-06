RSpec.describe Livestorm::Room do
    context 'with good data' do
        let (:data) {{ "id"=>1,
                       "name"=>"foo",
                       "enemy"=>"bar"}}

        it "parse room data" do
        parsed_data = Livestorm::Room.parse(data)

        expect(parsed_data.id).to eql(1)
        expect(parsed_data.name).to eql("foo")
        expect(parsed_data.enemy).to eql("bar")
        end
    end

    context 'with missing data' do
        let (:data) {{"id"=>1}}

        it "raise an error" do
            expect {Livestorm::Room.parse(data)}.to raise_error("invalid room data format")
        end
    end
end