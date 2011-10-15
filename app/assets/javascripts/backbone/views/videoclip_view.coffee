class @.Clipmeme.Views.VideoClip extends Backbone.View
  events:
    'click': 'play'
  
  initialize: (options)->
    @playerId = "#{@id}-player"
    @playerContainerId = "#{@id}-player-container"
    @videoId = options.videoId
    @startSeconds = options.startSeconds
    @endSeconds = options.endSeconds
    Clipmeme.Views.VideoClip.allById[@playerId] = this
  
  render: ->
    $(@el).css 'position', 'relative'
    $(@el).css 'display', 'inline-block'
    $(@el).css 'overflow', 'hidden'
    $(@el).css 'width', '480px'
    $(@el).css 'height', '295px'
    $(@el).html "<img src='http://img.youtube.com/vi/#{@videoId}/hqdefault.jpg'></img>"
    $(@el).append "<div id='#{@playerContainerId}'></div>"
    
    swfobject.embedSWF "http://www.youtube.com/apiplayer?enablejsapi=1&version=3&playerapiid=#{@playerId}",
      @playerContainerId,
      "480",
      "295",
      "9",
      null,
      null,
      {allowScriptAccess: "always"},
      {id: @playerId}
    

  ready: ->
    @player = $("##{@playerId}")[0]
    @player.cueVideoById(@videoId)
  
  play: ->
    @player.seekTo @startSeconds
    @player.playVideo()
    setTimeout @updatePlayerInfo, 50
    @$("img").hide()
  
  updatePlayerInfo: =>
    if @player.getCurrentTime() > @endSeconds
      @player.stopVideo()
      @$("img").show()
    else
      setTimeout @updatePlayerInfo, 50

@.Clipmeme.Views.VideoClip.allById = {}
@.onYouTubePlayerReady = (playerId)->
  Clipmeme.Views.VideoClip.allById[playerId].ready()