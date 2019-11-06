RSpec.describe Livestorm do
  it "has a version number" do
    expect(Livestorm::VERSION).not_to be nil
  end

  describe "::parse_file" do
    context 'data is complete' do
      let(:data) { {"rooms"=>[ {"id"=>1, "name"=>"foo", "enemy"=>1} ],
                    "enemies"=>[ {"id"=>1, "name"=>"foo", "question"=>"test?", "narrative"=>"text"} ],
                    "answers"=>[ {"id"=>1, "result"=>"yes"} ]} }
      let(:result) { Livestorm::GameLauncher.parse_file(data) }

      it "return data" do
        expect(result.count).to eq(3)
        expect(result[0]).to all(be_an_instance_of(Livestorm::Room))
        expect(result[1]).to all(be_an_instance_of(Livestorm::Enemy))
        expect(result[2]).to all(be_an_instance_of(Livestorm::Answer))
      end
    end
  end


end
