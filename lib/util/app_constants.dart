import 'package:flutter/material.dart';
import '../features/home/domain/models/movie.dart';
import '../features/home/domain/models/series.dart';

class AppConstants {
  static const Color lightPrimary = Color.fromARGB(255, 32, 32, 32);
  static const Color darkPrimary = Color.fromARGB(255, 0, 0, 0);
  static const String fontFamily = 'SFProText';
  static const double coverageRadiusInMeter = 50;

  static const String apiUrl = 'https://dummyjson.com/recipes/';


  static final movies = <Movie>[
    Movie(id: "1", title: "Soul mate", imagUrl: 'https://th.bing.com/th/id/R.805fbe5d1f82c05ccd982fb37ec243d5?rik=jzE1UR2ah%2b8zpA&riu=http%3a%2f%2fimages2.fanpop.com%2fimages%2fphotos%2f8400000%2fMovie-Posters-movies-8405245-1224-1773.jpg&ehk=k87cjy7XpNwrPb49EzeBjqw44Wxff4qiNh8iim3NcRI%3d&risl=&pid=ImgRaw&r=0'),
    Movie(id: "2", title: "UB's secret", imagUrl: 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/c358f738155793.57575971b1c09.jpg'),
    Movie(id: "3", title: "Yes I do", imagUrl: 'https://mir-s3-cdn-cf.behance.net/project_modules/1400/61da8438155793.57575971afe13.jpg'),
    Movie(id: "4", title: "Double Love", imagUrl: 'https://th.bing.com/th/id/OIP.Cd7O9dhPpf05Jzq1YOwP0gAAAA?w=474&h=670&rs=1&pid=ImgDetMain'),
    Movie(id: "5", title: "Curse of the river", imagUrl: 'https://moviegalleri.net/wp-content/uploads/2020/03/RRR-Movie-Ram-Charan-First-Look-Posters-HD-Telugu.jpg'),
    Movie(id: "5", title: "Sunita", imagUrl: 'https://d2h7z5r5pp4sed.cloudfront.net/tamil/news/baahubali_261215.jpg'),
  ];

  static final series = <Series>[
    Series(id: "1", title: "Wednesday | Season - 1", imagUrl: 'https://d2h7z5r5pp4sed.cloudfront.net/tamil/news/baahubali_261215.jpg', episode: 'Episode - 3'),
    Series(id: "2", title: "Emily in Paris| Season - 1", imagUrl: 'https://mir-s3-cdn-cf.behance.net/project_modules/1400/61da8438155793.57575971afe13.jpg', episode: 'Episode - 1'),
  ];

  static final categories = <String>[
    'All', 'Action', 'Anime', 'Sci-fi', 'Thriller'
  ];

  static final navItems = <IconData>[
    Icons.home_filled, Icons.tv, Icons.download, Icons.account_circle_outlined
  ];

}
