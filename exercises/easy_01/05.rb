
ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze


LETTERS = ('a'..'z').to_a

def rot13(encrypted_text)
  encrypted_text.split.map do |word|
    word.chars.map do |c|
      c = c.downcase
      LETTERS.include?(c) ? decipher_char(c) : c
    end.join.capitalize
  end.join(' ')
end

def decipher_char(c)
  idx = LETTERS.find_index(c)
  idx = idx < 13 ? idx + 13 : idx - 13
  LETTERS[idx]
end


ENCRYPTED_PIONEERS.map { |name| puts rot13(name) }