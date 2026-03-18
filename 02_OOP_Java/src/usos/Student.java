package usos;

import java.util.*;

public class Student extends Person {

    private List<Course> courses = new ArrayList<>();
    private Map<Course, Integer> grades = new HashMap<>();

    public Student(String name, int id) {
        super(name, id);
    }

    public void enrollCourse(Course c) {
        courses.add(c);
    }

    public void receiveGrade(Course c, int grade) {
        grades.put(c, grade);
    }

    public void showGrades() {
        System.out.println("Grades for " + name + ":");

        if (grades.isEmpty()) {
            System.out.println("No grades yet.");
            return;
        }

        for (Course c : grades.keySet()) {
            System.out.println(c.getName() + ": " + grades.get(c));
        }
    }
    
    public void showPlan() {
        System.out.println("Student: " + name + " courses:");
        for (Course c : courses) {
            System.out.println("- " + c.getName());
        }
    }
}