$ ->
  #view = new Clipmeme.Views.VideoClip id: 'yay', videoId: 'JEbUdt3u7ak', startSeconds: 7.0, endSeconds: 11
  
  videoClips.each  (videoClip) -> 
    view = new Clipmeme.Views.VideoClipView model: videoClip  #id: 'you', videoId: 'ykwqXuMPsoc', startSeconds: 21, endSeconds: 23.8
    $('body').append view.el
    view.render()
  

  