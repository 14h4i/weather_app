import 'package:mockito/mockito.dart';

class MockListener<T> extends Mock {
  void call(T? previous, T? value);
}
