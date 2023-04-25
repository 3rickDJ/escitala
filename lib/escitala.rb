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
    valid_size.each do |key|
      save_file(dir,  key.to_s, name, decrypt(msg, key))
    end
  end
  :private
  def save_file(path, prefix, sufix, data)
    File.open(path + prefix +  '_' + sufix, 'wb').write(data)
  end
end

if $PROGRAM_NAME == __FILE__
  #name = File.expand_path('test.txt')
  msg = File.open('img.jpg', 'rb').read
  cipher = Scytale.new.encrypt(msg, 1027)
  #puts cipher
  #puts Scytale.new.decrypt(cipher, 4)
  Scytale.new.hack(cipher, name='.jpg', dir='imgs/')
end
