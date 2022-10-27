import 'dart:developer';

import 'package:ffo/data/data_sources/data_source_contract.dart';
import 'package:ffo/models/chat.dart';
import 'package:ffo/models/local_message.dart';
import 'package:ffo/models/local_performance_report.dart';
import 'package:ffo/models/receipt.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/user.dart';

class SqfliteDataSource implements DataSourceContract{
  final Database _db;

  const SqfliteDataSource(this._db);

  @override
  Future<void> addChat(Chat chat) async{
      await _db.insert('chats', chat.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> addMessage(LocalMessage localMessage) async{
    await _db.insert('messages', localMessage.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> deleteChat(String chatId) async{
    final batch = _db.batch();
    batch.delete('messages', where: 'chat_id = ?', whereArgs: [chatId]);
    batch.delete('chats', where: 'id = ?', whereArgs: [chatId]);
    await batch.commit(noResult: true);
  }

  @override
  Future<List<Chat>> findAllChats() {
    return _db.transaction((txn) async {
      final chatsWithLatestMessage = await txn.rawQuery(''' SELECT messages.* FROM 
      (
        SELECT
        chat_id, MAX(received_at) AS received_at
        FROM messages
        GROUP BY chat_id
      ) AS latest_messages
      INNER JOIN messages
      ON messages.chat_id = latest_messages.chat_id
      AND messages.received_at = latest_messages.received_at
       ''');


      if(chatsWithLatestMessage.isEmpty){
        return [];
      }

      final chatsWithUnreadMessages = await txn.rawQuery(''' 
      SELECT
      chat_id, COUNT(*) as unread
      FROM messages
      WHERE receipt = ?
      GROUP BY chat_id
      ''', ['delivered']);

      return chatsWithLatestMessage.map<Chat>((e) {
        final int? unread = int.tryParse(chatsWithUnreadMessages.firstWhere((chat) => chat['chat_id'] == e['chat_id'], orElse: () => {'unread': 0})['unread'].toString());
        final chat = Chat.fromMap({"id" : e['chat_id']});
        chat.unread = unread ?? 0;
        chat.mostRecent = LocalMessage.fromMap(e);
        return chat;
      }).toList();
    });
  }

  @override
  Future<Chat?> findChat(String chatId) async{
    return await _db.transaction((txn) async{
      final listOfChatMaps = await txn.query(
        'chats',
        where: 'id = ?',
        whereArgs: [chatId]
      );

      if(listOfChatMaps.isEmpty){
        return null;
      }

      final unread = Sqflite.firstIntValue(
        await txn.rawQuery('SELECT COUNT(*) FROM messages WHERE chat_id = ? AND receipt = ?', [chatId, 'delivered'])
      );

      final mostRecent = await txn.query('messages',
      where: 'chat_id = ?',
      whereArgs: [chatId],
      orderBy: 'created_at DESC',
      limit: 1);

      final chat = Chat.fromMap(listOfChatMaps.first);
      chat.unread = unread ?? 0;
      chat.mostRecent = LocalMessage.fromMap(mostRecent.first);
      return chat;
    });
  }

  @override
  Future<List<LocalMessage>> findMessages(String chatId) async{
    final listOfMaps = await _db.query('messages',
    where: 'chat_id = ?',
    whereArgs: [chatId],
    groupBy: 'received_at');

    return listOfMaps.map<LocalMessage>((e) => LocalMessage.fromMap(e)).toList();
  }

  @override
  Future<void> updateMessage(LocalMessage message) async{
    await _db.update('messages', message.toMap(),
    where: 'id = ?',
    whereArgs: [message.message.id],
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> updateMessageReceipt(String messageId, ReceiptStatus status) async{
      await _db.update('messages', {'receipt': status.value()},
      where: 'id = ?',
      whereArgs: [messageId],
      conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> updateMessageDownloadedLink(String messageId, String localFileUrl) async{
    await _db.update('messages', {'local_url': localFileUrl},
        where: 'id = ?',
        whereArgs: [messageId],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> addReport(LocalPerformanceReport report) async{
    await _db.insert('performance_reports', report.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<LocalPerformanceReport?> findReport(String reportId) async{
    final listOfMaps = await _db.query('performance_reports',
        where: 'id = ?',
        whereArgs: [reportId],
    limit: 1);

    if(listOfMaps.isEmpty){
      return null;
    }

    return LocalPerformanceReport.fromMap(listOfMaps.first);
  }

  @override
  Future<void> updateReportDownloadedLink(String reportId, String localFileUrl) async{
    await _db.update('performance_reports', {'local_url': localFileUrl},
        where: 'id = ?',
        whereArgs: [reportId],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }


}