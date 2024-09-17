import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<String> _generateId() async {
    final uuid_value = Uuid();
    return uuid_value.v4();
  } // _generateId

  Future<UserCredential> signUpWithEmailAndPassword(
      String email,
      String password,
      String firstname,
      String lastname,
      String username,
      String phone) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      String generated_uid = await _generateId();

      final dateTimeNow = DateTime.now().toUtc();
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      final DateFormatValue = formatter.format(dateTimeNow);

      _firebaseFirestore.collection('users_list').doc(generated_uid).set({
        'user_id': generated_uid,
        'firstname': firstname,
        'lastname': lastname,
        'username': username,
        'phone': phone,
        'email': email,
        'date_time_registered': DateFormatValue,
        'date_time_verification': '0000-00-00 00:00:00',
        'role': '1'
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  } // signUpWithEmailAndPassword

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  } // signOut
}
