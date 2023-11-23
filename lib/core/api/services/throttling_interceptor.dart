import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

class ThrottlingInterceptor extends QueuedInterceptorsWrapper {
  final Duration period;
  final int limit;
  final PriorityQueue<DateTime> _buffer;

  ThrottlingInterceptor({required this.period, required this.limit}) : _buffer = HeapPriorityQueue();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final now = DateTime.now();
    _buffer.add(now);
    if (_buffer.length > limit) {
      final oldest = _buffer.removeFirst();
      final elapsed = now.difference(oldest);
      if (elapsed < period) {
        await Future.delayed(period - elapsed);
      }
    }
    super.onRequest(options, handler);
  }
}
