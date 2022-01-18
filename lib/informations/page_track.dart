import 'package:ium_project/enums/my_page.dart';

/*
file che mantiente le informazioni sulla pagina corrente
*/
class PageTrack {
  static final PageTrack pagesTrack = PageTrack._internal();

  int size = 0;
  int maxSize = 20;
  List<MyPage> page = List<MyPage>.filled(20, MyPage.home);

  PageTrack._internal();

  factory PageTrack() {
    return pagesTrack;
  }

  MyPage getLast() {
    return page[size];
  }

  MyPage popPage() {
    if (size > 0) {
      return page[size--];
    } else {
      throw Error();
    }
  }

  void pushPage(MyPage page) {
    if (size < maxSize) {
      this.page[size] = page;
    } else {
      this.page = List<MyPage>.generate(maxSize * 2, (i) => this.page[i % maxSize]);
      maxSize = maxSize * 2;
      pushPage(page);
    }
  }
}