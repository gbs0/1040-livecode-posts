class Post
  # TODO: Gather all code from all previous exercises
  # - reader and accessors
  # - initialize
  attr_reader :id
  attr_accessor :title, :url, :votes
    
  def initialize(attributes = {})
  @id = attributes[:id] || attributes["id"]
  @title = attributes[:title] || attributes["title"]
  @url = attributes[:url] || attributes["url"]
  @votes = attributes[:votes] || attributes["votes"] ||  0 
  end

  def self.find(id)
    result = []
    DB.results_as_hash = true
    post = DB.execute('SELECT * FROM posts WHERE id = ?', id)
    result << Post.new(id: post.first["id"], title: post.first["title"], url: post.first["url"], votes: post.first["votes"])
    result
  end

  def self.all
    DB.results_as_hash = true
    posts = DB.execute("SELECT * FROM posts");
    # [Post.new({}), Post.new({}), {}, {}]
    posts.map { |post| Post.new(post) }
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO posts (title, url) VALUES (?, ?)", @title, @url)
    else
      DB.execute("UPDATE posts SET title = ?, url = ?, votes = ? WHERE id = ?", @title, @url, @votes, @id)
    end
  end

  def destroy
    DB.execute("DELETE FROM posts WHERE id = ?", @id)
  end
  
  def upvote
    
  end
  
end
