import consumer from "./consumer";

const scrollToBottom = (element) => {
  element.scrollTop = element.scrollHeight;
}

const htmlToElem = (html) => {
  const temp = document.createElement('template');
  html = html.trim();
  temp.innerHTML = html;
  return temp.content.firstChild;
}

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    scrollToBottom(messagesContainer);
    const id = messagesContainer.dataset.chatroomId;
    const currentUserId = document.querySelector('meta[name="current"]').content;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        const message = htmlToElem(data);
        const senderId = message.dataset.senderId;

        if (currentUserId === senderId) {
          message.classList.add('text-right', 'right')
        } else {
          message.classList.remove('text-right', 'right')
        }

        messagesContainer.appendChild(message)
        scrollToBottom(messagesContainer);
      },
    });
  }
}

export { initChatroomCable };
