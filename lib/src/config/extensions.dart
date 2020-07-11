import '../init.dart';

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but callback have index as second argument
  Iterable<T> mapIndex<T>(T f(E e, int i)) {
    var i = 0;
    return this.map((e) => f(e, i++));
  }

  void forEachIndex(void f(E e, int i)) {
    var i = 0;
    this.forEach((e) => f(e, i++));
  }
}

extension widgets on Widget {
  Widget left() {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  Widget right() {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }

  Widget space(
      {double bottom = 10, double left: 0, double top: 0, double right: 0}) {
    return Container(
      child: this,
      margin:
          EdgeInsets.only(bottom: bottom, left: left, right: right, top: top),
    );
  }
}