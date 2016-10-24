require 'csv'
@folder_name = 'gen6'

def get_pokemon_names
  names = []
  CSV.foreach('pokemon_list.csv') do |name|
    names << name[0]
  end

  names
end

#get file list
def get_file_names
  file_names = Dir.entries('./'+@folder_name)
  file_names.delete '.'
  file_names.delete '..'
  file_names
end

#get pokemon id
def get_number name
  name.scan(/\d/).join('')
end

file_names = get_file_names
pokemon_names = get_pokemon_names
file_names.each do |file_name|
  pokemon_id =file_name.scan(/\d/).join('') 
  next if pokemon_id == ""
  pokemon_name = pokemon_names[pokemon_id.to_i-1]
  split_pokemon_name = pokemon_name.split('+')
  new_file_name = file_name.sub(pokemon_id, split_pokemon_name[0])
  puts new_file_name
  File.rename("#{@folder_name}/#{file_name}", "#{@folder_name}/#{new_file_name}")
end