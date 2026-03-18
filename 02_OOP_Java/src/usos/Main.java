package usos;

public class Main {

    public static void main(String[] args) {

        Admin admin = new Admin("Admin", 1);
        Teacher teacher = new Teacher("Dr Smith", 100);
        Student student = new Student("Alice", 200);

        Course oop = admin.createCourse("Object Oriented Programming");

        admin.assignTeacher(oop, teacher);
        admin.assignStudent(oop, student);

        student.showPlan();
        teacher.showPlan();

        teacher.gradeStudent(student, oop, 5);

        student.showGrades();
    }
}