App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    const messagesNode = document.getElementById('messages')
    messagesNode.classList.remove('hidden')
    console.log(messagesNode.classList.remove('hidden'))
    return messagesNode.appendChild(this.renderMessage(data))
  },

  renderMessage: function(data) {
    p = document.createElement('p')
    p.innerHTML = `<b>${data.user}</b> ${data.message}`
    return p
  }
});