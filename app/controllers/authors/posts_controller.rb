module Authors
  class PostsController < AuthorsController
    before_action :set_post, only: %i[edit update destroy]

    def index
      @posts = current_author.posts
    end

    def new
      @post = current_author.posts.build
    end

    def edit; end

    def create
      @post = current_author.posts.build(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_author.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description)
    end
  end
end