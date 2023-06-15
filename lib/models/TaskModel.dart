class TaskModel {
  late String name;
  bool isFinshed = false;

  TaskModel(this.name);
  setIsFinshed() {
    isFinshed = !isFinshed;
  }
}
