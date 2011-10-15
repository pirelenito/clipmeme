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
    $(@el).html "<div id='#{@playerContainerId}'></div>"
    $(@el).append "<div style='position: absolute; top: 0; bottom:0; left:0; right:0;'></div>"
    
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
    console.log('ready de ', @playerId, @player)
    @player.cueVideoById(@videoId)
  
  play: ->
    @player.seekTo @startSeconds
    @player.playVideo()
    setTimeout @updatePlayerInfo, 50
  
  updatePlayerInfo: =>
    if @player.getCurrentTime() > @endSeconds
      @player.stopVideo() 
    else
      setTimeout @updatePlayerInfo, 50

@.Clipmeme.Views.VideoClip.allById = {}
@.onYouTubePlayerReady = (playerId)->
  Clipmeme.Views.VideoClip.allById[playerId].ready()