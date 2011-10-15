class Clipmeme.Models.VideoClip extends Backbone.Model
  paramRoot: 'video_clip'

class Clipmeme.Collections.VideoClipsCollection extends Backbone.Collection
  model: Clipmeme.Models.VideoClip
  url: '/video_clips'