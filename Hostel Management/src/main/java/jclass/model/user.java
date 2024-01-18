package jclass.model;

public class user {
    private int userID;
    private String username;
    private String password;
    private String email;
    private String name;
    private String CNIC;
    private String CNICImage;
    private int age;
    private String contact;
    private String type;
    private String gender;
    private String Address;
    // Constructors
    public user() {
        // Default constructor
    }

    public user(String username, String password, String email, String name, String CNIC,
                String CNICImage, int age, String contact, String type, String gender,String Address) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
        this.CNIC = CNIC;
        this.CNICImage = CNICImage;
        this.age = age;
        this.contact = contact;
        this.type = type;
        this.gender = gender;
        this.Address=Address;
    }

    // Getters and Setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCNIC() {
        return CNIC;
    }

    public void setCNIC(String CNIC) {
        this.CNIC = CNIC;
    }

    public String getCNICImage() {
        return CNICImage;
    }

    public void setCNICImage(String CNICImage) {
        this.CNICImage = CNICImage;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}
}
