// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on _Controller, Store {
  late final _$loadingAtom =
      Atom(name: '_Controller.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$finishScrollAtom =
      Atom(name: '_Controller.finishScroll', context: context);

  @override
  bool get finishScroll {
    _$finishScrollAtom.reportRead();
    return super.finishScroll;
  }

  @override
  set finishScroll(bool value) {
    _$finishScrollAtom.reportWrite(value, super.finishScroll, () {
      super.finishScroll = value;
    });
  }

  late final _$newsAtom = Atom(name: '_Controller.news', context: context);

  @override
  List<News> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(List<News> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  late final _$searchNewsAsyncAction =
      AsyncAction('_Controller.searchNews', context: context);

  @override
  Future<void> searchNews({int page = 1, String keyword = ''}) {
    return _$searchNewsAsyncAction
        .run(() => super.searchNews(page: page, keyword: keyword));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
finishScroll: ${finishScroll},
news: ${news}
    ''';
  }
}
