class PublisherReflex < ApplicationReflex
  def publish
    post = Post.find(element.dataset[:post_id])
    post.update(published: true, published_at: Time.zone.now)
  end

  def unpublish
    post = Post.find(element.dataset[:post_id])
    post.update(published: false, published_at: nil)
  end
end
