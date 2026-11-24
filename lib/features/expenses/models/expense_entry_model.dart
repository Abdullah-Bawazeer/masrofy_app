import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseEntryModel {
  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final int year;
  final int month;
  final String category;

  ExpenseEntryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.year,
    required this.month,
    required this.category,
  });

  String get month_year => "$year-${month.toString().padLeft(2, "0")}";

  factory ExpenseEntryModel.fromMap(String id, Map<String, dynamic> json) {
    DateTime parsedDate;
    final dateVal = json['date'];
    if (dateVal is Timestamp) {
      parsedDate = dateVal.toDate();
    } else if (dateVal is String) {
      parsedDate = DateTime.tryParse(dateVal) ?? DateTime.now();
    } else {
      parsedDate = DateTime.now();
    }

    return ExpenseEntryModel(
      id: id,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      date: parsedDate,
      year: json['year'] as int? ?? parsedDate.year,
      month: json['month'] as int? ?? parsedDate.month,
      category: json['category'] as String? ?? 'other',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'amount': amount,
      'date': date,
      'year': year,
      'month': month,
      'category': category,
    };
  }
}
