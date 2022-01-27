abstract class Materia {

  String title;
  String publisher;
  String topic;
  String teacher;
  String department;
  List<String> images;

  Materia(this.title, this.publisher, this.topic, this.teacher, this.department, this.images);

  String getTitle() { return title; }

  String getPublisher() { return publisher; }

  String getTopic() { return topic; }

  String getTeacher() { return teacher; }

  String getDepartment() { return department; }

  List<String> getList() { return images; }
}