require 'yaml'
require 'optparse'
require 'ostruct'
require 'psych'

$library = "library.yaml"

def add_book()
  print 'Book title? '
  title = gets.chomp
  print 'Book author? '
  author = gets.chomp
  print 'Book length? '
  pages = gets.chomp.to_i

  book = { title: title,
           author: author,
           pages: pages}
  File.open($library, "a+") { |file| file.write(book.to_yaml) }
  puts "Book added!"
  return book
end

def list_books()
  books = Psych.parse_file($library)
  books.to_ruby.each do |node|
    puts node
  end
end

options = OpenStruct.new
OptionParser.new do |opt|
  #opt.on('-t', '--title TITLE', 'The title') { |o| options.title = o }
  #opt.on('-a', '--author AUTHOR', 'The author') { |o| options.author = o }
  #opt.on('-p', '--pages PAGES', 'Book length') { |o| options.pages = o }
  opt.on('-a', 'Add book') { |o| add_book }
  opt.on('-r', '--reading') { |o| list_books }
end.parse!
