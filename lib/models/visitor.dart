class Visitor {
	int? visitorPersonId;
	int? personId;
	int? visitorId;
	bool? deleted;
	String? dataHash;
	DateTime? createDate;
	DateTime? updateDate;
	int? createSyncId;
	int? updateSyncId;
	int? rowVersion;
	int? personClientId;
	int? personCode;
	int? visitorClientId;
	int? visitorCode;

	Visitor({
		this.visitorPersonId, 
		this.personId, 
		this.visitorId, 
		this.deleted, 
		this.dataHash, 
		this.createDate, 
		this.updateDate, 
		this.createSyncId, 
		this.updateSyncId, 
		this.rowVersion, 
		this.personClientId, 
		this.personCode, 
		this.visitorClientId, 
		this.visitorCode, 
	});

	factory Visitor.fromJson(Map<String, dynamic> json) => Visitor(
				visitorPersonId: json['VisitorPersonId'] as int?,
				personId: json['PersonId'] as int?,
				visitorId: json['VisitorId'] as int?,
				deleted: json['Deleted'] as bool?,
				dataHash: json['DataHash'] as String?,
				createDate: json['CreateDate'] == null
						? null
						: DateTime.parse(json['CreateDate'] as String),
				updateDate: json['UpdateDate'] == null
						? null
						: DateTime.parse(json['UpdateDate'] as String),
				createSyncId: json['CreateSyncId'] as int?,
				updateSyncId: json['UpdateSyncId'] as int?,
				rowVersion: json['RowVersion'] as int?,
				personClientId: json['PersonClientId'] as int?,
				personCode: json['PersonCode'] as int?,
				visitorClientId: json['VisitorClientId'] as int?,
				visitorCode: json['VisitorCode'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'VisitorPersonId': visitorPersonId,
				'PersonId': personId,
				'VisitorId': visitorId,
				'Deleted': deleted,
				'DataHash': dataHash,
				'CreateDate': createDate?.toIso8601String(),
				'UpdateDate': updateDate?.toIso8601String(),
				'CreateSyncId': createSyncId,
				'UpdateSyncId': updateSyncId,
				'RowVersion': rowVersion,
				'PersonClientId': personClientId,
				'PersonCode': personCode,
				'VisitorClientId': visitorClientId,
				'VisitorCode': visitorCode,
			};
}
