import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthController {

  final String _url = "http://192.168.100.179/api/v1";
  final String _urlRegisters = 'http://192.168.100.179/api/v1/user/';
  final String _urlLogin = 'http://192.168.100.179/api/v1/auth/user/';

  final String _urlPhoneVerification = "http://192.168.100.179/api/v1/auth/user/verified/phone/";
  final String _urlEmailVerification = "http://192.168.100.179/api/v1/auth/user/verified/email/";
  final String _activatePhone = "http://192.168.100.179/api/v1/auth/user/activate/phone/";

  final String _askInitiateCode = "http://192.168.100.179/api/v1/auth/user/";

  final String _reinitiateCode = "http://192.168.100.179/api/v1/auth/user/reset-password/";

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };



  registerUser(data, apiUrl) async {
    var fullUrl = _urlRegisters + apiUrl;

    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  
  loginUser(data, apiUrl) async {
    var fullUrl = _urlLogin + apiUrl;

    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  forgotBySms(data, apiUrl) async {
    var fullUrl = _askInitiateCode + apiUrl;

    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

    forgotByEmail(data, apiUrl) async {
    var fullUrl = _askInitiateCode + apiUrl;

    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  verificationPhone( userId) async {
    var fullUrl = _urlPhoneVerification + userId;
    http.Response response = await http.get(
        Uri.parse(fullUrl),
        headers: _setHeaders(),
    );
        try {

          if(response.statusCode == 200) {
            return response;
          } else {
            return 'echec';
          }
            
          } catch (e) {
            print(e);
            return 'echec';
        }
  }

    verificationEmail( userId) async {
    var fullUrl = _urlEmailVerification + userId;
    http.Response response = await http.get(
        Uri.parse(fullUrl),
        headers: _setHeaders(),
    );
        try {

          if(response.statusCode == 200) {
            return response;
          } else {
            return 'echec';
          }
            
          } catch (e) {
            print(e);
            return 'echec';
        }
  }

  activatePhone(code, userId) async {
    var fullUrl = _activatePhone + userId;

    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(code),
        headers: _setHeaders()
    );
  }

  reInitiateCode(code, apiUrl, codeID) async {
    var fullUrl = _reinitiateCode + apiUrl + '/' + codeID;

    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(code),
        headers: _setHeaders()
    );
  }
}