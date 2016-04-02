class FirstHand
  def initialize(cards)
    @cards = cards.map.with_index { |card, i| card.tap { |c| c['position'] = i } }
  end

  def good?
    return true if find('A').count >= 2

    return true if find('K').count >= 2

    return true if find('Q').count >= 2

    a = find('A')
    k = find('K')
    return true if a.any? && k.any? && right_pos?(a, k) && same_suit?(a + k)

    a = find('A')
    q = find('Q')
    return true if a.any? && q.any? && right_pos?(a, q) && same_suit?(a + q)

    return true if find('J').count >= 2

    k = find('K')
    q = find('Q')
    return true if k.any? && q.any? && right_pos?(k, q) && same_suit?(k + q)

    a = find('A')
    j = find('J')
    return true if a.any? && j.any? && right_pos?(a, j) && same_suit?(a + j)

    return true if find('A').any? && find('K').any?

    return true if find('10').count >= 2

    a = find('A')
    _10 = find('10')
    return true if a.any? && _10.any? && right_pos?(a, _10) && same_suit?(a + _10)

    k = find('K')
    j = find('J')
    return true if k.any? && j.any?  && right_pos?(k, j) && same_suit?(k + j)

    return true if find('A').any? && find('Q').any?

    return true if find('9').count >= 2

    q = find('Q')
    j = find('J')
    return true if q.any? && j.any? && right_pos?(q, j)  && same_suit?(q + j)

    k = find('K')
    _10 = find('10')
    return true if k.any? && _10.any? && right_pos?(k, _10) && same_suit?(k + _10)

    return true if find('8').count >= 2

    q = find('Q')
    _10 = find('10')
    return true if q.any? && _10.any? && right_pos?(q, _10)  && same_suit?(q + _10)

    a = find('A')
    _9 = find('9')
    return true if a.any? && _9.any? && right_pos?(a, _9)  && same_suit?(a + _9)

    a = find('A')
    j = find('J')
    return true if a.any? && j.any?

    false
  end

  def right_pos?(a,b)
    a.first['position'] < b.first['position']
  end

  def same_suit?(cards)
    suits = []
    cards.each { |c| suits.push c['suit'] }
    suits.uniq.each do |s|
      return true if suits.select { |s1| s1 == s }.length >= 2
    end
    return false
  end

  def find(rank, suit = nil)
    @cards.select do |card|
      rank_matched = card['rank'] == rank
      suit_matched = suit ? (card['suit'] == suit) : true

      rank_matched && suit_matched
    end
  end
end
