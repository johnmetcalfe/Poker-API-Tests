describe "Api Tests" do

  before(:all) do
    cardz = HTTParty.get url('/api/cards')
    File.write('./cards.txt', cardz)
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

  it "Create new game. deal cards, check unique cards. Check flop cards. Tear down game." do

    HTTParty.get url('/api/end')
    game = HTTParty.post url('/api/game'), body:{name: "Jack", isComputer: false, name1: "Comp", isComputer1: true}

    deal = HTTParty.get url('/api/deal')
    #First Dealing Round
    expect(deal['user']['hand'][0]['_id']).not_to eq deal['user']['hand'][1]['_id']
    expect(deal['user']['hand'][0]['_id']).not_to eq deal['computer']['hand'][0]['_id']
    expect(deal['user']['hand'][1]['_id']).not_to eq deal['computer']['hand'][1]['_id']
    expect(deal['user']['hand'][0]['_id']).not_to eq deal['computer']['hand'][1]['_id']
    expect(deal['user']['hand'][1]['_id']).not_to eq deal['computer']['hand'][0]['_id']
    expect(deal['computer']['hand'][0]['_id']).not_to eq deal['computer']['hand'][1]['_id']
    #Flop Dealing Round
    5.times do |i|
      expect(deal['user']['hand'][0]['_id']).not_to eq deal['flop'][i]['_id']
      expect(deal['computer']['hand'][0]['_id']).not_to eq deal['flop'][i]['_id']
      expect(deal['computer']['hand'][1]['_id']).not_to eq deal['flop'][i]['_id']
      expect(deal['user']['hand'][1]['_id']).not_to eq deal['flop'][i]['_id']
    end
    HTTParty.get url('/api/end')
    exit
  end

  # it "Send winning hand to the API" do
  #
  #   HTTParty.get url('/api/end')
  #
  #   game = HTTParty.post url('/api/winner')
  #
  #   HTTParty.get url('/api/end')
  #
  #
  # end

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
