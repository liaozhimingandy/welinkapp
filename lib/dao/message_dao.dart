import 'package:floor/floor.dart';

import '../models/message.dart';

@dao
abstract class MessageDao {
  @Query('select * from Message')
  Future<List<Message>> findAllMessage();
}
