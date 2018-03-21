class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_room' #ここが変わった
    sleep 0.1 # Sleep をかけないと後続の処理がチャンネル開通前に呼ばれてしまうことがあるよう
    ActionCable.server.broadcast 'chat_room', message: 'connected'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  # クライアントブラウザから叩く用のメソッド
  # def put_message(data)
  #   ActionCable.server.broadcast 'chat_room', message: data['message']
  # end
end
