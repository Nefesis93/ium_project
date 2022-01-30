import 'package:ium_project/enums/home_query.dart';

class QueryState {
  static final QueryState _user = QueryState._internal();

  HomeQuery _query = HomeQuery.home;

  QueryState._internal();

  factory QueryState() {
    return _user;
  }

  HomeQuery getState() {
    return _query;
  }

  void setState(HomeQuery query) {
    _query = query;
  }
}