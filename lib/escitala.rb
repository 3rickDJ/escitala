class Scytale
  def encrypt(msg, key)
    l = (msg.size / key.to_f).ceil
    msg.ljust(l * key, '*').chars.each_slice(l).to_a.transpose.join
  end

  def decrypt(msg, key)
    msg.chars.each_slice(key).to_a.transpose.join
  end

  def hack_puts(msg)
    puts "\n\nPossible messages:"
    valid_size = (2..(msg.size-1)).filter { |key| msg.size % key == 0 }
    valid_size.each do |key|
      puts "💌'#{decrypt(msg, key)}' 🔑 #{key}"
    end
  end

  def hack(msg, name='file', dir='files/')
    valid_size = (2...msg.size).filter { |key| msg.size % key == 0 }
    valid_size.each do |key|
      save_file(dir,  key.to_s, name, decrypt(msg, key))
    end
  end

  :private
  def save_file(path, prefix, sufix, data)
    File.open(path + prefix +  '_' + sufix, 'wb').write(data)
  end
end

def data(path)
  File.open(path, 'rb').read
end


if $PROGRAM_NAME == __FILE__
  img = File.open('imagen.jpg', 'rb').read
  cipher = Scytale.new.encrypt(img, 90)
  File.open('ciphered.jpg', 'wb').write(cipher)
  # Guardar imagen cifrada
  data = File.open('ciphered.jpg', 'rb').read
  Scytale.new.hack(data, name='XXXXXimg.txt', dir='imgs/')
  data = data('texto_original.txt')
  cipher = Scytale.new.encrypt(data, 109)
  File.open('texto_ciphered.txt', 'wb').write(cipher)
  data = data('texto_ciphered.txt')
  Scytale.new.hack(data, name='texto_desencriptado.txt', dir='files/')
end

