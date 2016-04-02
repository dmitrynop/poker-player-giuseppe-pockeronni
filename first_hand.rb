class FirstHand
  def initialize(cards)
    @cards = cards
  end

  def good?
    return true if find('A').count >= 2

    return true if find('K').count >= 2

    return true if find('Q').count >= 2

    return true if find('J').count >= 2

    return true if find('10').count >= 2

    k = find('A')
    a = find('K')
    return true if k.any? && a.any? && same_suit?(k + a)

    k = find('A')
    a = find('Q')
    return true if k.any? && a.any? && same_suit?(k + a)

    k = find('K')
    a = find('Q')
    return true if k.any? && a.any? && same_suit?(k + a)

    k = find('A')
    a = find('J')
    return true if k.any? && a.any? && same_suit?(k + a)

    false
  end

  def same_suit?(cards)
    suits = []
    cards.each { |c| suits.push c['suit'] }
    suits.uniq.each do |s|
      return true if suits.select { |s1| s1 == s }.length >= 2
    end
  end

  def find(rank, suit = nil)
    @cards.select do |card|
      rank_matched = card['rank'] == rank
      suit_matched = suit ? (card['suit'] == suit) : true

      rank_matched && suit_matched
    end
  end
end
