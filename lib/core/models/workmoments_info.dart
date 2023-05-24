class WorkMomentsInfo {
  int? notificationMsgType;
  String? replyUserName;
  String? replyUserID;
  String? content;
  String? contentID;
  String? workMomentID;
  String? userID;
  String? userName;
  String? faceURL;
  String? workMomentContent;
  int? createTime;

  WorkMomentsInfo(
      {this.notificationMsgType,
      this.replyUserName,
      this.replyUserID,
      this.content,
      this.contentID,
      this.workMomentID,
      this.userID,
      this.userName,
      this.faceURL,
      this.workMomentContent,
      this.createTime});

  WorkMomentsInfo.fromJson(Map<String, dynamic> json) {
    notificationMsgType = json['notificationMsgType'];
    replyUserName = json['replyUserName'];
    replyUserID = json['replyUserID'];
    content = json['content'];
    contentID = json['contentID'];
    workMomentID = json['workMomentID'];
    userID = json['userID'];
    userName = json['userName'];
    faceURL = json['faceURL'];
    workMomentContent = json['workMomentContent'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationMsgType'] = notificationMsgType;
    data['replyUserName'] = replyUserName;
    data['replyUserID'] = replyUserID;
    data['content'] = content;
    data['contentID'] = contentID;
    data['workMomentID'] = workMomentID;
    data['userID'] = userID;
    data['userName'] = userName;
    data['faceURL'] = faceURL;
    data['workMomentContent'] = workMomentContent;
    data['createTime'] = createTime;
    return data;
  }
}
