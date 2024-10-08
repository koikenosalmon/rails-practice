module Api
  module V1
    class PostsController < ApplicationController
      # :show, :update, :destroy三つの関数を実行する前に:set_postを自動実行する
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        @posts = Post.all
        puts @posts
        render json: @posts
      end
        def show
        render json: @post
      end

      def create
        @post = Post.new(post_params)
        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy
        head :no_content
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :body) # 適切なパラメータに変更
      end

      def json_request?
        request.format.json?
      end
    end
  end
end
