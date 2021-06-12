import 'dart:async';
import 'package:journal/services/authentication_api.dart';
import 'package:journal/services/db_firestore_api.dart';
import 'package:journal/models/journal.dart';

class HomeBloc {
  DbApi dbApi;
  AuthenticationApi authenticationApi;
  final StreamController<List<Journal>> _journalController =
      StreamController<List<Journal>>.broadcast();
  Sink<List<Journal>> get _addListJournal => _journalController.sink;
  Stream<List<Journal>> get listJournal => _journalController.stream;
}
