require_relative '../views/posts_view'
require_relative '../models/post'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    posts = Post.all
    @view.display(posts)
  end

  def create
    title = @view.ask_for("Title")
    url = @view.ask_for("URL")
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    id = @view.ask_id
    title = @view.ask_for("Title")
    url = @view.ask_for("URL")
    post = Post.find(id).first
    post.title = title
    post.url = url
    post.save
    # TODO: implement updating an existing post
  end

  def destroy
    id = @view.ask_id
    post = Post.find(id).first
    post.destroy
    # TODO: implement destroying a post
  end

  def upvote
    id = @view.ask_id
    post = Post.find(id).first
    post.votes += 1
    post.save
  end

  def find
    id = @view.ask_id
    post = Post.find(id)
    @view.display(post)
  end
end
