import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class BaseProvider with ChangeNotifier {
  Dio _dio;

  /// Returns a new [Dio] instance without any interceptors
  /// Using [NetworkManager] is prefer
  Dio get dio => _dio ?? Dio(); 

  BaseProvider() {
    if (_dio == null) _dio = Dio();
  }

  bool _isLoading2 = false;
  bool _isLoading1 = false;
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMsg = '';

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMsg;



  void setLoading(bool val, {bool shouldNotifyListeners = true}) {
    if (_isLoading == val) return;

    _isLoading = val;
    if (shouldNotifyListeners) notifyListeners();
  }

  void setLoading1(bool val, {bool shouldNotifyListeners = true}) {
    if (_isLoading1 == val) return;

    _isLoading1 = val;
    if (shouldNotifyListeners) notifyListeners();
  }

  void setLoading2(bool val, {bool shouldNotifyListeners = true}) {
    if (_isLoading2 == val) return;

    _isLoading2 = val;
    if (shouldNotifyListeners) notifyListeners();
  }

  void setError(bool val, {bool shouldNotifyListeners = true}) {
    if (_hasError == val) return;
    _hasError = val;
    if (shouldNotifyListeners) notifyListeners();
  }

  void setErrorMsg(String val, {bool shouldNotifyListeners = false}) {
    _errorMsg = val;
    if (shouldNotifyListeners) notifyListeners();
  }

 
}