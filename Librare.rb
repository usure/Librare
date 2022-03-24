require 'yaml'
require 'optparse'
require 'ostruct'
require 'psych'

$library = "library.yaml"

def add_book(title, author, pages)
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

stuff.each do |
options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('-t', '--title TITLE', 'The title') { |o| options.title = o }
  opt.on('-a', '--author AUTHOR', 'The author') { |o| options.author = o }
  opt.on('-p', '--pages PAGES', 'Book length') { |o| options.pages = o }
  opt.on('-r', '--reading') { |o| list_books() }
end.parse!


#puts "------------"
#puts "Title: #{options.title}"
#puts "Author: #{options.author}"
#puts "Pages: #{options.pages}"
#puts "------------"
add_book(options.title, options.author, options.pages.to_i)
