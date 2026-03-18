package usos;

import java.util.*;

public class Admin extends Person {

    private List<Course> courses = new ArrayList<>();

    public Admin(String name, int id) {
        super(name, id);
    }

    public Course createCourse(String name) {
        Course c = new Course(name);
        courses.add(c);
        return c;
    }

    public void assignTeacher(Course c, Teacher t) {
        c.setTeacher(t);
    }

    public void assignStudent(Course c, Student s) {
        c.addStudent(s);
    }

    public void removeStudent(Course c, Student s) {
        c.removeStudent(s);
    }

    public void showPlan() {
        System.out.println("Admin panel");
    }
}