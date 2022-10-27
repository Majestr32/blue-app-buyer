import 'package:ffo/models/chat.dart';
import 'package:ffo/models/local_message.dart';
import 'package:ffo/models/local_performance_report.dart';
import 'package:ffo/models/receipt.dart';

abstract class DataSourceContract{
  Future<void> addChat(Chat chat);
  Future<void> addMessage(LocalMessage localMessage);
  Future<Chat?> findChat(String chatId);
  Future<List<Chat>> findAllChats();
  Future<void> updateMessage(LocalMessage message);
  Future<List<LocalMessage>> findMessages(String chatId);
  Future<void> deleteChat(String chatId);
  Future<void> updateMessageReceipt(String messageId, ReceiptStatus status);
  Future<void> updateMessageDownloadedLink(String messageId, String localFileUrl);
  Future<void> addReport(LocalPerformanceReport report);
  Future<LocalPerformanceReport?> findReport(String reportId);
  Future<void> updateReportDownloadedLink(String reportId, String localFileUrl);
}