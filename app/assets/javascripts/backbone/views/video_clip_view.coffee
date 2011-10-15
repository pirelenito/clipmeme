class @.Clipmeme.Views.VideoClipView extends Backbone.View
  events:
    'click': 'play'
  
  initialize: (options)->
    @videoId = @model.get 'youtube_video_id'
    
    @playerId = "#{@videoId}-player"
    @playerContainerId = "#{@videoId}-player-container"
    
    @startSeconds = @model.get 'start_seconds'
    @endSeconds = @model.get 'end_seconds'
    Clipmeme.Views.VideoClipView.allById[@playerId] = this
    
    @width = 320
    @height = 200
  
  render: ->
    $(@el).css 'position', 'relative'
    $(@el).css 'display', 'inline-block'
    $(@el).css 'overflow', 'hidden'
    $(@el).css 'width', @width
    $(@el).css 'height', @height
    $(@el).html "<img src='http://img.youtube.com/vi/#{@videoId}/default.jpg'></img>"
    $(@el).append "<div id='#{@playerContainerId}'></div>"
    
  ready: ->
    @player = $("##{@playerId}")[0]
    @player.cueVideoById(@videoId)
    @play()
  
  createPlayer: ->
    swfobject.embedSWF "http://www.youtube.com/apiplayer?enablejsapi=1&version=3&playerapiid=#{@playerId}",
      @playerContainerId,
      @width,
      @height,
      "9",
      null,
      null,
      {allowScriptAccess: "always"},
      {id: @playerId}
  
  play: ->
    return @createPlayer() unless @player
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

@.Clipmeme.Views.VideoClipView.allById = {}
@.onYouTubePlayerReady = (playerId)->
  Clipmeme.Views.VideoClipView.allById[playerId].ready()