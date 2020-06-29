import consumer from "./consumer";
//import ownerMessage from "../components/owner_message";
// const insertOwnMessage = (event) => {
//   event.preventDefault()
//   const allMessages = document.getElementById('messages');
//   const input = document.getElementById('message_body');
//   const html = ownerMessage()
//   allMessages.insertAdjacentHTML('beforeend', `${html}`);
//   allMessages.scrollTop = allMessages.scrollHeight;
//   console.log(html)
// }


const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    //const btn = document.querySelector('.create-btn');
    //btn.addEventListener('click', insertOwnMessage );
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
          messagesContainer.insertAdjacentHTML('beforeend', `${data}`);
          messagesContainer.scrollTop = messagesContainer.scrollHeight;
      },
    });
  }
}



export { initChatroomCable };
