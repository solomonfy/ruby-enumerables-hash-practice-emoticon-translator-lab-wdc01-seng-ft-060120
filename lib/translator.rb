require "pry"
require "yaml"

def load_library(yaml_file)

   translator = {}
   data = YAML.load_file(yaml_file)

    data.each do |meaning, value|

    translator[meaning] = {
      english: "#{value[0]}",
      japanese: "#{value[1]}"
    }

  end
translator
end



def get_english_meaning(yaml_file, emoticon)

  emoticons = load_library(yaml_file)
    emoticons.each do |meaning, value|

    if value[:japanese] == emoticon
       return meaning
       # we dont need to put the else statement here. If we have iterated over the entire hash,
      #  'end' ended our loop and it never hit that if and returned then,
      #  this would mean that we didn't find the item and should give the apology
  end
end
"Sorry, that emoticon was not found"
end



def get_japanese_emoticon(yaml_file, emoticon)

  emoticons = load_library(yaml_file)
    emoticons.each do |meaning, value|

    if value[:english] == emoticon
       return value[:japanese]
  end
end
"Sorry, that emoticon was not found"
end
