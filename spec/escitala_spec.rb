require 'escitala'

describe Scytale do
  context 'when encrypting' do
    it 'returns  "hotomalosae cs " ' do
      ci = Scytale.new()
      str = 'holacomoestas'
      expect(ci.encrypt(str, 3)).to eq('hotomalosae*cs*')
    end
    it 'returns "holacomoestas**" ' do
      ci = Scytale.new()
      str = 'holacomoestas'
      expect(ci.encrypt(str, 4)).to eq('hcesoos*lmt*aoa*')
    end
    it 'encryts a file' do
      ci = Scytale.new()
      file = File.new('test.txt', 'rb').read
      expect(ci.encrypt(file, 4)).to eq('a')
    end
  end
  context 'when decrypting' do
    it 'returns "holacomoestas" ' do
      ci = Scytale.new()
      str = 'hotomalosae*cs*'
      expect(ci.decrypt(str, 3)).to eq('holacomoestas**')
    end
    it 'returns "holacomoestas" ' do
      ci = Scytale.new()
      str = 'hcesoos*lmt*aoa*'
      expect(ci.decrypt(str, 4)).to eq('holacomoestas***')
    end
    it 'decrypts a file' do
      ci = Scytale.new()
      file = File.new('test.e.txt', 'rb').read
      expect(ci.decrypt(file, 4)).to eq('a')
    end
  end
end
