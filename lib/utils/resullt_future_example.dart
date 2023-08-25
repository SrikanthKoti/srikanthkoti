// class Result<T, E> {
//   final T? _value;
//   final E? _error;
//   final bool _isSuccess;

//   Result._(this._value, this._error, this._isSuccess);

//   factory Result.success(T value) {
//     return Result._(value, null, true);
//   }

//   factory Result.failure(E error) {
//     return Result._(null, error, false);
//   }

//   static Future<Result<T, E>> fromFuture<T, E>(Future<T> future) {
//     return future.then(
//       (value) => Result.success(value),
//       onError: (error) => Result.failure(error as E),
//     );
//   }

//   bool get isSuccess => _isSuccess;

//   bool get isFailure => !_isSuccess;

//   T get value {
//     if (!isSuccess) {
//       throw StateError('Cannot retrieve value from a failure Result');
//     }
//     return _value!;
//   }

//   E get error {
//     if (isSuccess) {
//       throw StateError('Cannot retrieve error from a success Result');
//     }
//     return _error!;
//   }
// }

// void main() {
//   final result = fetchData();

//   result.then((res) {
//     if (res.isSuccess) {
//       print('Data fetched successfully: ${res.value}');
//     } else {
//       print('Failed to fetch data: ${res.error}');
//     }
//   });
// }

// Future<Result<String, String>> fetchData() async {
//   try {
//     // Simulating an asynchronous data fetch
//     await Future.delayed(Duration(seconds: 2));
//     final data = 'Sample data';
//     return Result.success(data);
//   } catch (error) {
//     final errorMessage = 'Failed to fetch data';
//     return Result.failure(errorMessage);
//   }
// }
