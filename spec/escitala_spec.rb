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
      expect(ci.encrypt(file, 4)).to_not eq(file)
    end
    it 'encryts a jpg image' do
      ci = Scytale.new()
      file = File.new('img.jpg', 'rb').read
      File.open('img.e.jpg', 'wb').write(ci.encrypt(file, 91))
      expect(ci.encrypt(file, 91)).to_not eq(file)
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
      expect(ci.decrypt(file, 4)).to_not eq(file)
    end
    it 'encryts a jpg image' do
      ci = Scytale.new()
      file = File.new('img.e.jpg', 'rb').read
      File.open('img.de.jpg', 'wb').write(ci.decrypt(file, 91))
      expect(ci.encrypt(file, 91)).to_not eq(file)
    end
  end
end
