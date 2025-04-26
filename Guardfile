# Guardのマッチング規則を定義

guard :minitest, all_on_start: false do
  watch(%r{^test/?(.*)_test\.rb$})

  watch(%r{^bin/(.*?)\.rb$}) do |matches|
    ["test/#{matches[1].downcase}_test.rb"]
  end

  watch(%r{^lib/(.*?)\.rb$}) do |matches|
    ["test/#{matches[1].downcase}_test.rb"]
  end
end