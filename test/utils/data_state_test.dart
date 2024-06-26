import 'package:flutter_data/flutter_data.dart';
import 'package:test/test.dart';

void main() {
  late DataStateNotifier<String?> notifier;
  delay() => Future.delayed(Duration(milliseconds: 12));

  setUpAll(() {
    notifier = DataStateNotifier(data: DataState('initial'));
  });

  test('merge', () {
    final d1 =
        DataState(1, isLoading: true, exception: DataException('message'));
    final d2 = DataState(2);
    // optional exception from "older" state gets passed on in merge
    expect(DataState(2, isLoading: false, exception: DataException('message')),
        d1.merge(d2));
  });

  test('updates state', () async {
    var i = 0;
    final dispose = notifier.addListener((state) {
      switch (i) {
        case 0:
          expect(state.model, 'initial');
          break;
        case 1:
          expect(state.model, 'data');
          expect(state.message, 'random message');
          break;
        case 2:
          expect(state.model, 'data2');
          expect(state.isLoading, isTrue);
          break;
        case 3:
          expect(state.model, 'data3');
          expect(state.isLoading, isTrue);
          expect(state.message, isNull);
          break;
        case 4:
          expect(state.model, isNull);
          break;
        case 5:
          expect(state.model, 'data4');
          expect(state.isLoading, isFalse);
          expect(state.exception, equals(DataException('test')));
          break;
        default:
          throw Exception('zzz');
      }
    }, fireImmediately: false);

    i++;
    notifier.updateWith(model: 'data', message: 'random message');
    i++;
    notifier.updateWith(model: 'data2', isLoading: true);
    i++;
    notifier.updateWith(model: 'data3', message: null);
    i++;
    notifier.updateWith(model: null);
    await delay();
    i++;
    notifier.updateWith(
        model: 'data4', isLoading: false, exception: DataException('test'));
    dispose();
  });

  tearDownAll(() {
    notifier.dispose();
  });
}
