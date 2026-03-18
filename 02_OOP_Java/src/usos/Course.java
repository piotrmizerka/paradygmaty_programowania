package usos;

import java.util.*;

public class Course {

    private String name;
    private Teacher teacher;
    private List<Student> students = new ArrayList<>();

    public Course(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setTeacher(Teacher t) {
        teacher = t;
        t.assignCourse(this);
    }

    public void addStudent(Student s) {
        students.add(s);
        s.enrollCourse(this);
    }

    public void removeStudent(Student s) {
        students.remove(s);
    }
}