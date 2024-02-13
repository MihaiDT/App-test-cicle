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
    // options.headers.addAll(
    //   {
    //     "Authorization":
    //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWUwNzEwNWI0MDdiOTA3NjA0NDhhYzk0M2MyNDc2MTFjYmY2OWViOGY5N2Q4NWJlZGFmNTljZjJjOGU5YWNlZDRhOWM3MzA5YzAzMjBiN2QiLCJpYXQiOjE3MDc3NDUyNjYuNTIwODYsIm5iZiI6MTcwNzc0NTI2Ni41MjA4NjUsImV4cCI6MTczOTM2NzY2Ni40NTI2ODQsInN1YiI6IjE1MiIsInNjb3BlcyI6W119.FIgLkKzjZM8E4W-CwGL1V_Xy3apkIgxTGK9oRC4_tYenKhhl1a0dPWOdUBwtwCpY2NXcymbKPytgTgSx1hXrMIjzgsxdtbttZBeYIHDQ9w_UE6cWraiH_43PA5zRPv44PqowgUDLxBGLK0BWdAlUNyONFxb7nxq52nYADGKdXDZPCusvZcVvvhafAtsFadunJdiVc9yBqXt9o2rnNDNXAgBRch77Q4AIl5MtVDyKW7VRfo074c7WPexSPmEDf6pp5suA8lJPBSomj90dQE77Tp0Msse9BXeov1VTMEjlKK_V8fmhESuf_4O4qx50Jv6iL02zww0GX0hpSkK3vLJ13OeNSeRvJ8ly3JiJcRmUe04T1x3tXNaUxtEMWf2BMq2uKBEx1mrTrgU9HvVoei6OoKJhgKIrSnAEh5SR31kT-91lOXRUrSGp_EnwakAwsSXMFYW2Z8qMUZCfirgHjjUg6rWnyb2aPQPyufJ5X_pN9iAD2ATZsCDcF8Quwj3HbgBfSpn_odFOQcsyUxGmlMbG8cX2FSIIBKjABzDYQf-2PmhqXohtQJy3izfyl84-boboD0hrjkSPGIT-j8nNUxuARWi-9mRGog3W6h9MKZOO7Nuxr6v5FqOdHmUtTRG9vfIjYO4ccWT3Z0ywxxj6r36m0nWUdx5p7-4vaHWGsPfQTOU",
    //   },
    // );
    super.onRequest(options, handler);
  }
}
