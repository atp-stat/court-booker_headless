$ ->
  onPageLoad 'main#reserve', ->
    App.chat = App.cable.subscriptions.create "ChatChannel",
      connected: ->
        # Called when the subscription is ready for use on the server
        console.log 'Connected!'

      disconnected: ->
        # Called when the subscription has been terminated by the server
        @perform 'unsubscribed'
        console.log 'Disonnected!'

      received: (data) ->
        # Called when there's incoming data on the websocket for this channel
        console.log data
        li = document.createElement('li')
        li.className = "list-group-item list-item-reserve-result"
        li.textContent = '>  ' + data['message']
        document.getElementById('message-list').appendChild(li)

      # クライアントブラウザから叩く用のメソッド
      # put_message: (msg)->
      #   @perform 'put_message', message: msg
