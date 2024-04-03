begin
  10.times do
    FactoryBot.create :quote
  end
rescue
  puts "----- Achtung! Something went wrong..."
end
