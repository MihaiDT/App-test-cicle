import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;

  DioInterceptor({
    required this.dio,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(
      {
        "Authorization":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTI4YzgwNDJhYjMzYzAwOTU0YjcxMTNmM2Y4YTY4NWRhN2JmOWU1MDJhOTA2MGE3YmEwODQ4ZjM3NGYyNjk4NjMzNjRlZDkwMGZkODU2YTYiLCJpYXQiOjE3MDM3NjE4ODAuODc0MDE5LCJuYmYiOjE3MDM3NjE4ODAuODc0MDIyLCJleHAiOjE3MzUzODQyODAuODExNjc3LCJzdWIiOiIyMiIsInNjb3BlcyI6W119.uvwtvxw_wT7LQPnJbdTRKVv0OowDKclrnsm3Jqwirr_lSNXNOy6zu-bu1SYbWM7TdLBMVfaMSO32Ya8fO8rppsJ0JJiBkWnneWiZXZue8VASTgPD2WTDM73bGsTXYNPPiWJjToYgPLRsreGlk3nAxwAglMke0hmdDaTZeA7gHc1Iqne4jp8Ii7Zq_YVOV_d1p3OZdtwEK64LKW1QuQVlekFoH-aXGVFCA1yqMhxOogHPnFfuVfb07P-_IZNXx9qyRY7dlHffks6GOQ2DwijjtS02gqzcTnUIBGmCQ-JRHgT142zYj5FkFi3cxR5C05R7HZyGPGFFt7OjXP9I4JyLjJoTt4HKZ9uYPu5FUpc6vpsUCwAgSx9gFLilsz4LzztOz_E-5e6vvY9_F0SVr72FPiz74fupScXmhnR44mdoEPPQ7enIDFoYF-Wn1Vvtdc74JKVVjhY6_WV6HI0AFxKG0W5hJ_p5U_DstOZFqP4HBEmYvFzS945Ab3zzR7fsIF3QnFUSGp-4M42nbNCzCWBfHuzz_w1xHoV-L8ZAaYPLjmDdrJTL3HQcEvdtHR4b0Y3whvrTSDcN6pGuNTlPbQXUZHyfwGcBqHoPOE5uRET6rrCPhEVqQUszabD27tIoQT-ihTybCbGXwcJ3iTt_c4kn-nL9BDLPFm7nPUTwEYI9UBo"
      },
    );
    super.onRequest(options, handler);
  }
}
