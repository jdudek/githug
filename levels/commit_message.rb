difficulty 1
description "Make a commit with multine message. The first line should be 'Add README', followed by empty line and 'This is very important'."

setup do
  repo.init
  FileUtils.touch("README")
  repo.add("README")
end

solution do
  message = repo.commits.last.message
  return false unless message.lines[0].strip == 'Add README'
  return false unless message.lines[1].strip == ''
  return false unless message.lines[2].strip == 'This is very important'
  true
end

hint do
  puts "Do not pass -m in the command line. Set editor in .gitconfig."
end
