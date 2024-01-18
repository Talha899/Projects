package jclass.model;

public class room {

	
	    private int roomId;
	    private String roomName;
	    private String imgLink;
	    private int price;
	    private double area;
	    private String features;
	    private int totalOccupants;
	    private int noOfOccupants;
	    private String description;
	    private int catagory;
	    private String status;
	    private int managerID;
	    // Constructors
	    public room() {
	        // Default constructor
	    }

	    public room(int roomId, String roomName, String imgLink, int price, double area,
	                String features, int totalOccupants, int noOfOccupants,
	                String description, int catagory, String status, int managerID) {
	        this.roomId = roomId;
	        this.roomName = roomName;
	        this.imgLink = imgLink;
	        this.price = price;
	        this.area = area;
	        this.features = features;
	        this.totalOccupants = totalOccupants;
	        this.noOfOccupants = noOfOccupants;
	        this.description = description;
	        this.catagory = catagory;
	        this.status = status;
	        this.setManagerID(managerID);
	    }

	    // Getters and Setters
	    public int getRoomId() {
	        return roomId;
	    }

	    public void setRoomId(int roomId) {
	        this.roomId = roomId;
	    }

	    public String getRoomName() {
	        return roomName;
	    }

	    public void setRoomName(String roomName) {
	        this.roomName = roomName;
	    }

	    public String getImgLink() {
	        return imgLink;
	    }

	    public void setImgLink(String imgLink) {
	        this.imgLink = imgLink;
	    }

	    public int getPrice() {
	        return price;
	    }

	    public void setPrice(int price) {
	        this.price = price;
	    }

	    public double getArea() {
	        return area;
	    }

	    public void setArea(double area) {
	        this.area = area;
	    }

	    public String getFeatures() {
	        return features;
	    }

	    public void setFeatures(String features) {
	        this.features = features;
	    }

	    public int getTotalOccupants() {
	        return totalOccupants;
	    }

	    public void setTotalOccupants(int totalOccupants) {
	        this.totalOccupants = totalOccupants;
	    }

	    public int getNoOfOccupants() {
	        return noOfOccupants;
	    }

	    public void setNoOfOccupants(int noOfOccupants) {
	        this.noOfOccupants = noOfOccupants;
	    }

	    public String getDescription() {
	        return description;
	    }

	    public void setDescription(String description) {
	        this.description = description;
	    }

	    public int getcatagory() {
	        return catagory;
	    }

	    public void setcatagory(int capacity) {
	        this.catagory = capacity;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }

	    public String toString() {
	        return "room{" +
	                "roomId=" + roomId +
	                ", roomName='" + roomName + '\'' +
	                ", imgLink='" + imgLink + '\'' +
	                ", price=" + price +
	                ", area=" + area +
	                ", features='" + features + '\'' +
	                ", totalOccupants=" + totalOccupants +
	                ", noOfOccupants=" + noOfOccupants +
	                ", description='" + description + '\'' +
	                ", catagory=" + catagory +
	                ", status='" + status + '\'' + 
	                 ", managerID='" + managerID + '\'' +
	                '}';
	    }

		public int getManagerID() {
			return managerID;
		}

		public void setManagerID(int managerID) {
			this.managerID = managerID;
		}
	 
	}



