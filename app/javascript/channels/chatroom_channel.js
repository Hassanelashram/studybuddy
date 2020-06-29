import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const currentUserId = Number.parseInt(messagesContainer.dataset.currentUser, 10)
    console.log(currentUserId)
    //const btn = document.querySelector('.create-btn');
    //btn.addEventListener('click', insertOwnMessage );
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data.message_author, currentUserId)
        if (data.message_author != currentUserId ) {
          messagesContainer.insertAdjacentHTML('beforeend', `${data.owner_partial}`);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;

        } else {
          messagesContainer.insertAdjacentHTML('beforeend', `${data.reciever_partial}`);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }
      },
    });
  }
}



export { initChatroomCable };
