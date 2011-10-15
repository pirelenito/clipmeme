class VideoClip
  include Mongoid::Document
  field :name, :type => String
  field :youtube_video_id, :type => String
  field :start_seconds, :type => Float
  field :end_seconds, :type => Float
end
