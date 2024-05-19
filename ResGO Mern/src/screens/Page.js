import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import Header from "../components/header";
import Footer from "../components/footer";
import Comments from "../components/comments";
import Singlecomment from "../components/singlecomment";

export default function Page() {
  const selectedKey = localStorage.getItem("selectedKey");
  const selectedName = localStorage.getItem("selectedname");
  const selectedDescription = localStorage.getItem("selectedDescription");
  const selectedImageLink = localStorage.getItem("selectedImageLink");
  const [comments, setComments] = useState([]);
  const navigate = useNavigate();
  const pollingInterval = 5000; // Fetch data every 5 seconds

  const loadData = async () => {
    try {
      const response = await fetch("http://localhost:5000/api/DisplayComments", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
      });
      const data = await response.json();
      setComments(data);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };

  useEffect(() => {
    loadData(); // Initial data load

    const intervalId = setInterval(() => {
      loadData(); // Polling data at specified intervals
    }, pollingInterval);

    return () => clearInterval(intervalId); // Cleanup interval on component unmount
  }, []);

  const handleRedirect = () => {
    navigate("/cardowner");
  };
  const handleRedirecttochat = () => {
    navigate("/chat");
  };

  return (
    <div>
      <Header />
      <div className="btn-box ml-5 mt-5">
        <button className="btn btn-success custom-btn" type="button" onClick={handleRedirect}>
          Visit Restaurant
        </button>
        <button className="btn btn-success custom-btn" type="button" onClick={handleRedirecttochat}>
          Chat
        </button>
      </div>
      <section className="blog_area single-post-area section-padding">
        <div className="container">
          <div className="row">
            <div className="col-lg-8 posts-list">
              <div className="single-post">
                <div className="feature-img">
                  <img className="img-fluid" src={selectedImageLink} alt="" />
                </div>
                <div className="blog_details">
                  <h2>{selectedName}</h2>
                  <p>{selectedDescription}</p>
                </div>
              </div>
            </div>
            <h4> Comments</h4>
            {comments.length > 0 
              ? comments.map((data) => (
                  selectedKey === data.Postid ? (
                    <Singlecomment key={data.id} name={data.name} post={data.post} date={data.date} label1={data.Discount} imageLink={data.ImageLink} />
                  ) : null
                ))
              : null}
          </div>
          <Comments />
        </div>
      </section>
      <Footer />
    </div>
  );
}