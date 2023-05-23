import 'package:welinkapp/core/flutter_im_sdk.dart';

/// 好友关系监听
class OnFriendshipListener {
  Function(FriendApplicationInfo i)? onFriendApplicationAdded;
  Function(FriendApplicationInfo i)? onFriendApplicationDeleted;
  Function(FriendApplicationInfo i)? onFriendApplicationAccepted;
  Function(FriendApplicationInfo i)? onFriendApplicationRejected;
  Function(FriendInfo i)? onFriendAdded;
  Function(FriendInfo i)? onFriendDeleted;
  Function(FriendInfo i)? onFriendInfoChanged;
  Function(BlacklistInfo i)? onBlacklistAdded;
  Function(BlacklistInfo i)? onBlacklistDeleted;

  OnFriendshipListener({
    this.onBlacklistAdded,
    this.onBlacklistDeleted,
    this.onFriendAdded,
    this.onFriendApplicationAccepted,
    this.onFriendApplicationAdded,
    this.onFriendApplicationDeleted,
    this.onFriendApplicationRejected,
    this.onFriendDeleted,
    this.onFriendInfoChanged,
  });

  /// 已被加入黑名单
  void blacklistAdded(BlacklistInfo u) {
    onBlacklistAdded?.call(u);
  }

  /// 已从黑名单移除
  void blacklistDeleted(BlacklistInfo u) {
    onBlacklistDeleted?.call(u);
  }

  /// 好友已添加
  void friendAdded(FriendInfo u) {
    onFriendAdded?.call(u);
  }

  /// 好友申请已被接受
  void friendApplicationAccepted(FriendApplicationInfo u) {
    onFriendApplicationAccepted?.call(u);
  }

  /// 已添加新的好友申请
  void friendApplicationAdded(FriendApplicationInfo u) {
    onFriendApplicationAdded?.call(u);
  }

  /// 好友申请已被删除
  void friendApplicationDeleted(FriendApplicationInfo u) {
    onFriendApplicationDeleted?.call(u);
  }

  /// 好友申请已被拒绝
  void friendApplicationRejected(FriendApplicationInfo u) {
    onFriendApplicationRejected?.call(u);
  }

  /// 好友已被删除
  void friendDeleted(FriendInfo u) {
    onFriendDeleted?.call(u);
  }

  ///  好友资料发生改变
  void friendInfoChanged(FriendInfo u) {
    onFriendInfoChanged?.call(u);
  }
}
