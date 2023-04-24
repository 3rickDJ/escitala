# frozen_string_literal: true

# Scytale Cipher
class Scytale
  def encrypt(msg, key)
    l = (msg.size / key.to_f).ceil
    msg.ljust(l * key, '*').chars.each_slice(l).to_a.transpose.join
  end

  def decrypt(msg, key)
    msg.chars.each_slice(key).to_a.transpose.join
  end
end

if $PROGRAM_NAME == __FILE__
  image_path = File.new('', rb)
  # cipher = Scytale.new
end
