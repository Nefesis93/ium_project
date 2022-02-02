abstract class Materia {
  String title;
  String publisher;
  String topic;
  String teacher;
  String department;
  String dataPubblicazione;
  int voto;
  int numeroRecensioni;
  List<String> images;

  Materia(this.title, this.publisher, this.topic, this.teacher, this.department,
      this.images, this.voto, this.numeroRecensioni, this.dataPubblicazione);

  String getTitle() {
    return title;
  }

  String getPublisher() {
    return publisher;
  }

  String getTopic() {
    return topic;
  }

  String getTeacher() {
    return teacher;
  }

  String getDepartment() {
    return department;
  }

  int getVoto() {
    return voto;
  }

  int getNumeroRecensioni() {
    return numeroRecensioni;
  }

  List<String> getList() {
    return images;
  }

  String getDate() {
    return dataPubblicazione;
  }
}
