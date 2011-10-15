$ ->
  view = new Clipmeme.Views.VideoClip id: 'yay', videoId: 'JEbUdt3u7ak', startSeconds: 7.0, endSeconds: 11
  $('body').append view.el
  view.render()
  
  view = new Clipmeme.Views.VideoClip id: 'you', videoId: 'ykwqXuMPsoc', startSeconds: 21, endSeconds: 23.8
  $('body').append view.el
  view.render()

  