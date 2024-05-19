import React, { useEffect, useState } from "react";
import { useNavigate } from 'react-router-dom';
import Inbox from '../components/inbox';

export default function Chat() {
  const [credentials, setCredentials] = useState({ text: "" });
  const [messages, setMessages] = useState([]);
  const Senderid = localStorage.getItem("userId"); // Retrieve the sender ID from localStorage

  let navigate = useNavigate();

  useEffect(() => {
    fetchMessages(); // Fetch messages initially
    const intervalId = setInterval(fetchMessages, 100); // Poll every 5 seconds
    return () => clearInterval(intervalId); // Cleanup interval on component unmount
  }, []);

  const fetchMessages = async () => {
    try {
      const Reciverid = localStorage.getItem("OID"); 
      const response = await fetch("http://localhost:5000/api/displaymessage", {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ Senderid, Reciverid })
      });

      const data = await response.json();
      if (Array.isArray(data)) {
        setMessages(data);
      } else {
        console.error('Fetched data is not an array:', data);
        setMessages([]); // Ensure messages is an array
      }
    } catch (error) {
      console.error('Error fetching messages:', error.message);
      setMessages([]); // Ensure messages is an array even on error
    }
  };

  const handleSubmit = async () => {
    if (credentials.text.trim() === "") {
      alert("Message text cannot be empty");
      return;
    }
    try {
      const Reciverid = localStorage.getItem("OID"); 
      const response = await fetch("http://localhost:5000/api/createmessage", {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ ...credentials, Senderid, Reciverid })
      });

      const json = await response.json();
      if (!json.success) {
        alert("Message not added");
      } else {
        setCredentials({ text: "" }); // Clear the input field after successful message send
        fetchMessages(); // Fetch the messages again to update the list
      }
    } catch (error) {
      console.error('Error:', error.message);
      alert('An error occurred while adding the message. Please try again.');
    }
  };

  const onChange = (e) => {
    setCredentials({ ...credentials, [e.target.name]: e.target.value });
  };

  return (
    <div>
      <div className="container">
        <h3 className="text-center">Messaging</h3>
        <div className="messaging">
          <div className="inbox_msg">
            <Inbox />
            <div className="mesgs">
              <div className="msg_history">
                {messages.map((msg, index) => (
                  <div key={index} className={msg.Senderid === Senderid ? "outgoing_msg" : "incoming_msg"}>
                    <div className={msg.Senderid === Senderid ? "sent_msg" : "received_msg"}>
                      <div className={msg.Senderid === Senderid ? "" : "received_withd_msg"}>
                        <p>{msg.text}</p>
                        <span className="time_date">
                          {new Date(msg.date).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: true })} 
                          | {new Date(msg.date).toLocaleDateString()}
                        </span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
              <div className="type_msg">
                <div className="input_msg_write">
                  <input
                    type="text"
                    className="write_msg"
                    placeholder="Type a message"
                    name="text"
                    value={credentials.text}
                    onChange={onChange}
                  />
                  <button
                    className="msg_send_btn"
                    type="button"
                    onClick={handleSubmit}
                  >
                    <i className="fa fa-paper-plane-o" aria-hidden="true"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>          
        </div>
      </div>
    </div>
  );
}
