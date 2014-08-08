difficulty 2
description "Changes in `app.rb` file have been staged for commit and then the file has been modified. Find out the value of `@message` that is going to be committed."

setup do
  init_from_level
end

solution do
  line = request "What is the value of `@message` in the staged version of `app.rb`?"
  return false unless line == "42"
  true
end

hint do
  puts "Try `git diff` with an option that displays staged changes."
end
