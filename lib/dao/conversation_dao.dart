import 'package:floor/floor.dart';

import 'package:welinkapp/models/conversation.dart';

@dao
abstract class ConversationDao {
    @Query('SELECT * FROM task WHERE avatar = :avatar')
    Future<Conversation?> findTaskById(String avatar);

    @Query('SELECT * FROM Conversation')
    Future<List<Conversation>> findAllConversations();

    @Query('SELECT * FROM Conversation')
    Stream<List<Conversation>> findAllConversationsAsStream();

    @Query('SELECT DISTINCT COUNT(title) FROM Conversation')
    Stream<int?> findUniqueMessagesCountAsStream();

    @insert
    Future<void> insertConversation(Conversation task);

    @update
    Future<void> updateConversation(Conversation task);

    @delete
    Future<void> deleteConversation(Conversation task);

    @delete
    Future<void> deleteConversations(List<Conversation> tasks);
}