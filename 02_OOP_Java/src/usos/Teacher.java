package usos;

import java.util.*;

public class Teacher extends Person {

    private List<Course> courses = new ArrayList<>();

    public Teacher(String name, int id) {
        super(name, id);
    }

    public void assignCourse(Course c) {
        courses.add(c);
    }

    public void gradeStudent(Student s, Course c, int grade) {
        if (courses.contains(c)) {
            s.receiveGrade(c, grade);
            System.out.println("Graded " + s.getName());
        }
    }

    public void showPlan() {
        System.out.println("Teacher: " + name + " teaches:");
        for (Course c : courses) {
            System.out.println("- " + c.getName());
        }
    }
}