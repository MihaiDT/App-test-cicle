import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;

  DioInterceptor({
    required this.dio,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(
      {
        "Authorization":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWNlMTAyZTE0ZjU5Yjg5MDljOWQ4NDBkMGExOWFlNGU3OTg5M2NmNWExZjYzMmQ3NDA4ZmM5OGMyZmE2MjRjMTQzODc1MGJhNDY1ZjhkYTgiLCJpYXQiOjE3MDc5MjUyMDMuNTk3MDQ0LCJuYmYiOjE3MDc5MjUyMDMuNTk3MDQ3LCJleHAiOjE3Mzk1NDc2MDMuNTUxOTc5LCJzdWIiOiIxNTciLCJzY29wZXMiOltdfQ.FQw2BsP7coUO1bEg-mI4hoHDtj9EMchxxsd_z5fCJSUP3HvDJ5lSWNspyefHUQ5NxEoYRT9HFDjOgGKDrMxtTkOaYbrft9JO_EYwgXTMQXK4zjgu36yaWexZpcMOgvz83rwzepyoamHrXA6eOl1LUG6TwBiWWZv-uaLmtSlNbIZdYymkkMm4EoUuJZjsU-gXvmN3AUKttYDWaHCTTxFFenefCVoIzr19N-pFVeLWI9lDGvW9niJ8EzpVJxOx2DXlNbl1lYiCngkRVqCddg-rI_HhJwTZm5lVeS-4Gr9lmUWkbN1qOKcFyNDGd7IgHzirJzeH83CjraiT0H8rcRsgVxFXvDEXUOQVvOss6qj5VKvxQI8UHhL-HTKnW9_dejrQ1POWj2d6RT9XCE8D0b5Nel8bLD7m5ydFSIA8koCT_plg9v_MgJyDvZUd7uHfj-dtfw8r0CIYTt09EmzVhd1vqifyRKHF3ZG3mswoD4z_y2iYOD5skRFEEkw6E622-XyWEVnwMPSLH-JsGzI7hR_C4BAFsKfcPSQwuuM1LZ4QO50YxBcJ97hULyUtQjkh0btVCp1dZ0RZqtwlVyg97i8r1c3BUBZjQpGo7rrnUlo0BBT4XSJFyqaGOictf4BXpF2F3I2gaPB6e3EcPaKyGlK7JzhK1BXRCwAOQIVGES1M1Rs",
      },
    );
    super.onRequest(options, handler);
  }
}
