class Category2 {
  List<Categories>? categories;

  Category2({this.categories});

  Category2.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  int? noOfCourses;
  String? thumbnail;
  List<Courses2>? courses;

  Categories(
      {this.id, this.name, this.noOfCourses, this.thumbnail, this.courses});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    noOfCourses = json['noOfCourses'];
    thumbnail = json['thumbnail'];
    if (json['courses'] != null) {
      courses = <Courses2>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['noOfCourses'] = this.noOfCourses;
    data['thumbnail'] = this.thumbnail;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses2 {
  int? id;
  String? name;
  double? completedPercentage;
  String? author;
  String? thumbnail;
  List<Lessons>? lessons;

  Courses2(
      {this.id,
        this.name,
        this.completedPercentage,
        this.author,
        this.thumbnail,
        this.lessons});

  Courses2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    completedPercentage = json['completedPercentage'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['completedPercentage'] = this.completedPercentage;
    data['author'] = this.author;
    data['thumbnail'] = this.thumbnail;
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  int? id;
  String? name;
  String? duration;
  bool? isCompleted;
  bool? isPlaying;
  String? pathVideo;
  String? pdf;

  Lessons(
      {this.id,
        this.name,
        this.duration,
        this.isCompleted,
        this.isPlaying,
        this.pathVideo,
        this.pdf});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    isCompleted = json['isCompleted'];
    isPlaying = json['isPlaying'];
    pathVideo = json['path_video'];
    pdf = json['pdf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['isCompleted'] = this.isCompleted;
    data['isPlaying'] = this.isPlaying;
    data['path_video'] = this.pathVideo;
    data['pdf'] = this.pdf;
    return data;
  }
}