class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @posts = Post.all
    end
    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    # Before_action is being used so that we keep our code DRY.
    # Otherwise we'd have a find function in each method.
    def show

    end
    def edit

    end
    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end
    def destroy
            @post.destroy
            # status: see_other is a workaround 
            redirect_to root_path, status: :see_other 
    end

    private

    def post_params
    params.require(:post).permit(:title, :body)
    end
    def find_post
        @post = Post.find(params[:id])
    end
end
