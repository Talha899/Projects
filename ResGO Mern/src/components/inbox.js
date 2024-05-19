import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Inbox() {
  const [chat, setChat] = useState([]);
  const [selectedReceiverId, setSelectedReceiverId] = useState(null); // State for selected receiver ID
  const Senderid = localStorage.getItem("userId"); // Retrieve the sender ID from localStorage
  const navigate = useNavigate();

  useEffect(() => {
    fetchChat();
  }, []);

  useEffect(() => {
    fetchChat(); 
    const intervalId = setInterval(fetchChat, 5000); 
    return () => clearInterval(intervalId);
  }, []);

  const fetchChat = async () => {
    try {
      const response = await fetch("http://localhost:5000/api/inboxmessages", {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ Senderid })
      });

      const data = await response.json();
      if (Array.isArray(data)) {
        setChat(data);
      } else {
        console.error('Fetched data is not an array:', data);
        setChat([]); // Ensure chat is an array
      }
    } catch (error) {
      console.error('Error fetching chat:', error.message);
      setChat([]); // Ensure chat is an array even on error
    }
  };

  const handleChatClick = (ReceiverId) => {
    setSelectedReceiverId(ReceiverId); // Update the selected receiver ID
    localStorage.setItem("OID", ReceiverId);
    navigate("/chat");
  };

  return (
    <div>
      <div className="inbox_people">
        <div className="headind_srch">
          <div className="recent_heading">
            <h4>Recent</h4>
          </div>
          <div className="srch_bar">
            <div className="stylish-input-group">
              <input type="text" className="search-bar" placeholder="Search" />
              <span className="input-group-addon">
                <button type="button"> <i className="fa fa-search" aria-hidden="true"></i> </button>
              </span>
            </div>
          </div>
        </div>
        <div className="inbox_chat">
          {chat.map((user, index) => (
            <div
              key={index}
              className={`chat_list ${selectedReceiverId === user.Reciverid ? 'selected_chat' : ''}`}
              onClick={() => handleChatClick(user.Reciverid)}
            >
              <div className="chat_people">
                <div className="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil" /> </div>
                <div className="chat_ib">
                  <h5>{user.name}</h5>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
