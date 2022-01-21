class Category {
  final String name;
  final String numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'].toString(), item['courses'].toString(), item['image'].toString()))
    .toList();

var categoriesData = [
  {"name": "Extended Reality", 'courses': 17, 'image': "assets/images/business.png"},
  {"name": "UX Design", 'courses': 25, 'image': "assets/images/photography.png"},
  {
    "name": "Control and Automation", 
    'courses': 13,
    'image': "assets/images/ux_design.png"
  },
  {"name": "Data Science", 'courses': 17, 'image': "assets/images/mobile.png"},
  {"name": "Mobile Applications", 'courses': 12, 'image': "assets/images/marketing.png"},
];