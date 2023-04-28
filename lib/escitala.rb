class Scytale
  def encrypt(msg, key)
    l = (msg.size / key.to_f).ceil
    msg.ljust(l * key, '?').chars.each_slice(l).to_a.transpose.join
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

def data(path)
  File.open(path, 'rb').read
end

def process_keyboard_input(scytale, choice)
  puts "Enter the message:"
  msg = gets.chomp
  unless choice == 3
    puts "Enter the key:"
    key = gets.chomp.to_i
  end

  case choice
  when 1
    puts "Encrypted message: #{scytale.encrypt(msg, key)}"
  when 2
    puts "Decrypted message: #{scytale.decrypt(msg, key)}"
  when 3
    scytale.hack_puts(msg)
  end
end

def process_file_input(scytale, choice, file_type)
  puts "Enter the file path:"
  file_path = gets.chomp
  if file_type == "image"
    content = data(file_path)
  else
    content = File.read(file_path)
  end
  unless choice == 3
    puts "Enter the key:"
    key = gets.chomp.to_i
  end
  puts file_path

  case choice
  when 1
    encrypted = scytale.encrypt(content, key)
    save_file(file_path, "encrypted_#{file_type}", encrypted)
  when 2
    decrypted = scytale.decrypt(content, key)
    save_file(file_path, "decrypted_#{file_type}", decrypted)
  when 3
    scytale.hack(content, File.extname(file_path))
  end
end

def save_file(original_path, suffix, data)
  new_path = File.dirname(original_path) + '/' + File.basename(original_path, ".*") + "_#{suffix}" + File.extname(original_path)
  File.open(new_path, 'wb').write(data)
  puts "File saved to: #{new_path}"
end

def main_menu
  scytale = Scytale.new

  loop do
    puts "\nMain Menu:"
    puts "1. Encrypt"
    puts "2. Decrypt"
    puts "3. Hack"
    puts "4. Exit"
    print "Choose an option: "
    main_choice = gets.chomp.to_i

    break if main_choice == 4

    puts "\nChoose input type:"
    puts "1. Text from keyboard"
    puts "2. Text file"
    puts "3. Image file"
    print "Choose an option: "
    input_choice = gets.chomp.to_i

    case input_choice
    when 1
      process_keyboard_input(scytale, main_choice)
    when 2, 3
      file_type = input_choice == 2 ? "text" : "image"
      process_file_input(scytale, main_choice, file_type)
    else
      puts "Invalid option. Please try again."
    end
  end
end

if $PROGRAM_NAME == __FILE__
  main_menu
end
