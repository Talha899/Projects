package jclass.model;

public class name_id {
    private String name;
    private int id;

    // Default constructor
    public name_id() {
    }

    // Parameterized constructor
    public name_id(String name, int id) {
        this.name = name;
        this.id = id;
    }

    // Getter for name
    public String getName() {
        return name;
    }

    // Setter for name
    public void setName(String name) {
        this.name = name;
    }

    // Getter for id
    public int getId() {
        return id;
    }

    // Setter for id
    public void setId(int id) {
        this.id = id;
    }

    // You can add additional methods or behavior as needed
}
