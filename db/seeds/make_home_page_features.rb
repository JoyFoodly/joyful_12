keys = [:box11_text, :box12_text, :box21_text, :box22_text, :box11_header, :box12_header, :box21_header, :box22_header, :gift_message]

contents = {box11_header: 'Eat the Rainbox', box11_text: 'Feel great about the meals you make for your family. 12 veggies and fruits', box12_header: 'Time Saving Shopping List', box12_text: 'Make shopping easy with a shopping list. You can email', gift_message: 'They offered her a ride home. Buddy orders her a new hat. I buy her a gift. Those barbers offered her a ride home.' }

keys.each do |k|
  h=HomePageFeature.find_or_create_by key: k

  h.content = contents[k] if contents[k]
  h.save
end
