class TweetsController < ApplicationController
  
   def new
  	@tweet = Tweet.new
  end

  def create
  	@tweet = Tweet.new(tweet_params)
  	if @tweet.save
      flash[:success] = "Votre tweet a bien été twitté !" 
      SendTweet.new("#{@tweet.content}").perform
      redirect_to root_path 
  	else render 'new'
  	end
  end

  private
  	def tweet_params
      params.permit(:content)
  	end

end
