import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pagesapp/services/authService.dart';
import 'package:pagesapp/services/utilization.dart';
import 'package:uuid/uuid.dart';

class MainstreamProcess {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _utilization = Utilization;

  Future<String> _generateId() async {
    final uuid_value = Uuid();
    return uuid_value.v4();
  } // _generateId()

  Future<void> createMainstreamPost(
      String caption_content, String user_id, String image_upload_id) async {
    try {
      String fuid = await _generateId();
      final dateTimeNow = DateTime.now().toUtc();
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      final DateFormatValue = formatter.format(dateTimeNow);

      await _firebaseFirestore.collection('mainstream_content').doc(fuid).set({
        'caption_content': caption_content,
        'date_time_last_edited': '',
        'date_time_posted': DateFormatValue,
        'image_upload_id': image_upload_id,
        'is_deleted': '0',
        'mainstream_id': fuid,
        'privacy_type': '1',
        'user_id': user_id
      });
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }
}
