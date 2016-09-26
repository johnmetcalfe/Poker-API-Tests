describe "Api Tests" do

  before(:all) do
    @cards = File.read('./cards.txt')
  end

  it "Get all cards" do

    cardz = HTTParty.get url('/api/cards')
    expect(cardz.to_s).to eq @cards.chomp


  end

  # it "Check cards are shuffled multiple hands" do
  #
  #   shuffle1 = HTTParty.get url('/api/shuffle')
  #   shuffle2 = HTTParty.get url('/api/shuffle')
  #   expect(shuffle1.to_s).not_to eq @cards.chomp
  #   expect(shuffle2.to_s).not_to eq @cards.chomp
  #   expect(shuffle1.to_s).not_to eq shuffle2.to_s
  #
  # end

  it "Checks user and computer have been dealt cards" do

    deal = HTTParty.get url('/api/deal')
    expect(deal['user'][0]['_id']).not_to eq deal['user'][1]['_id']
    expect(deal['user'][0]['_id']).not_to eq deal['computer'][0]['_id']
    expect(deal['user'][1]['_id']).not_to eq deal['computer'][1]['_id']
    expect(deal['user'][0]['_id']).not_to eq deal['computer'][1]['_id']
    expect(deal['user'][1]['_id']).not_to eq deal['computer'][0]['_id']
    expect(deal['computer'][0]['_id']).not_to eq deal['computer'][1]['_id']
    exit
  end

  it "Send winning hand to the API" do

  end

  it "Send losing hand to the API" do

  end

  it "Check Royal flush beats straight flush" do

  end

  it "Check Straight Flush beats Four of a Kind" do

  end

  it "Check Four of a kind beats Full House" do

  end

  it "Check Full House beats Flush" do

  end

  it "Check Flush beats Straight" do

  end

  it "Check Straight beats Three of a Kind" do

  end

  it "Check Three of a Kind beats Two Pair" do

  end

  it "Check Two Pair beats One Pair" do

  end

  it "Check One Pair beats High Card" do

  end

end
