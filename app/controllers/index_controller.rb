class IndexController < ApplicationController
  def index
    @video_clips = VideoClip.all
  end
end
