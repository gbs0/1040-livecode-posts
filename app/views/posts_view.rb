class PostsView
  # TODO: implement methods called by the PostsController
  def ask_id
    puts "What's the ID you're looking for:"
    print "> "
    gets.chomp.to_i
  end

  def ask_for(label)
    puts "What's #{label} of your post?"
    print "> "
    gets.chomp
  end
  def display(array)
    array.each do |post|
      puts "ID: #{post.id} | Title: #{post.title} | URL: #{post.url} | Votes: #{post.votes}"
    end
  end
end
