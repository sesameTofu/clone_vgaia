# MOBILE

A new Flutter project.

## Official CLI for the GetX™ framework.

To install:

(to use this add the following to system PATH: [FlutterSDKInstallDir]\bin\cache\dart-sdk\bin

- pub global activate get_cli

- flutter pub global activate get_cli

To generate a localization file:
Note: 'assets/locales' directory with your translation files in json format

- get generate locales assets/translations

### BaseController

- Loading toàn app
- Lấy sự kiện khi app bật lên từ background để call lại api hay làm gì... WidgetController extends BaseController và override onResumed

### Class WebSocketManager (data/source)

- Lắng nghe websocket lắng nghe realtime order, trade, market
- WidgetController extends BaseController và override onResumed

- connect webhook

### Run flutter with ENV

- flutter run android --flavor dev|prod|uat
- flutter run --flavor uat -t lib/main_uat.dart

###

- Quy tắc đăt tên
  - Các Widget con trong 1 class cần bắt đầu từ \_buildXXX(XXX mô tả widget đó làm gì)
  - Các tên biến chỉ dùng trong class thì thêm dấu '\_' đằng trước
  - Tên biến cần thể hiện biến đó để làm gì ra sao tránh viết tắt(https://viblo.asia/p/naming-rules-cac-quy-tac-vang-trong-lang-dat-ten-ByEZkMXE5Q0)

//