# encoding: utf-8

class ::String

  # wszystkie litery na duże
  def upcase
    # pl_replace z tablicy małych liter na tablicę dużych liter
    pl_replace(String.polish_chars('small') + ('a'..'z').to_a, String.polish_chars('big') + ('A'..'Z').to_a)
  end

  def upcase!
    replace upcase
  end

  # wszystkie litery na małe
  def downcase
    # pl_replace z tablicy dużych liter na tablicę małych liter
    pl_replace(String.polish_chars('big') + ('A'..'Z').to_a, String.polish_chars('small') + ('a'..'z').to_a)
  end

  def downcase!
    replace downcase
  end

  # usuń polskie znaki
  def no_pl
    # pl_replace z tablicy polskich małych i dużych liter na tablicę odpowiadających im kodów ascii
    pl_replace(String.polish_chars, %w[a e s c z z o l n] + %w[A E S C Z Z O L N])
  end

  def no_pl!
    replace no_pl
  end

  # pierwsza litera duża, reszta mała
  def capitalize
    s = self.downcase
    s[0] = s[0].upcase if s.size > 0
    s
  end

  def capitalize!
    replace capitalize
  end

  # tablica polskich znaków, np do użycia z regexpami jako zakres
  # ('small' => tylko małe, 'big' => tylko duże, 'all' lub brak => wszystkie)
  def self.polish_chars(size = 'all')
    small = %w[ą ę ś ć ź ż ó ł ń]
    big = %w[Ą Ę Ś Ć Ź Ż Ó Ł Ń]
    case size
    when 'small'
      small
    when 'big'
      big
    else
      small + big
    end
  end

  protected

  # zamienia znaki z tablicy search na tablicę replace
  def pl_replace(search, replace)
    self.chars.collect{|c| (id = search.index(c)) ? replace[id] : c}.join('')
  end
end
