require 'parallel'
class Scytale
  def encrypt(msg, key)
    l = (msg.size / key.to_f).ceil
    msg.ljust(l * key, '*').chars.each_slice(l).to_a.transpose.join
  end

  def decrypt(msg, key)
    msg.chars.each_slice(key).to_a.transpose.join
  end

  def hack(msg, name='file', dir='files/')
    valid_size = (2..msg.size).filter { |key| msg.size % key == 0 }
    Parallel.each(valid_size, in_threads: 10) do |key|
      save_file(dir,  key.to_s, name, decrypt(msg, key))
    end
  end
  :private
  def save_file(path, prefix, sufix, data)
    File.open(path + prefix +  '_' + sufix, 'wb').write(data)
  end
end

if $PROGRAM_NAME == __FILE__
  name = File.expand_path('test.txt')
  msg = File.open('img.jpg', 'rb').read
  cipher = Scytale.new.encrypt(msg, 1027)
  File.open('ciphered.jpg', 'wb').write(cipher)
  data = File.open('ciphered.jpg', 'rb').read
  Scytale.new.hack(data, name='.jpg', dir='imgs/')
  #name = File.open('test.txt', 'rb').read
  #cipher = Scytale.new.encrypt(name, 1291)
  #Scytale.new.hack(cipher, name='.txt', dir='files/')
end
