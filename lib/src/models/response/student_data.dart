class StudentData {
  final String username;
  final String firstName;
  final String lastName;
  final String status;
  final List<String> allCareerIds;
  final String degreeId;
  final String degreeCode;
  final String degreeLevel;
  final String degreeName;
  final int firstEnrollmentYear;
  final int lastEnrollmentYear;
  final bool isCurrentlyEnrolled;
  final double averageGrade;
  final double estimatedFinalGrade;
  final double averageGradePurged;
  final double estimatedFinalGradePurged;
  final bool usePurgedAverageFinalGrade;
  final double? mastersAdmissionAverageGrade;
  final double totalOnTimeExamPoints;
  final int maxOnTimeExamPoints;
  final int excludedCreditsNumber;
  final int totalCredits;
  final int totalAttendedCredits;
  final int totalAcquiredCredits;
  final int enrollmentCredits;
  final int enrollmentAttendedCredits;
  final int enrollmentAcquiredCredits;
  final String smartCardPicture;
  final EuropeanStudentCard europeanStudentCard;

  StudentData({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.status,
    required this.allCareerIds,
    required this.degreeId,
    required this.degreeCode,
    required this.degreeLevel,
    required this.degreeName,
    required this.firstEnrollmentYear,
    required this.lastEnrollmentYear,
    required this.isCurrentlyEnrolled,
    required this.averageGrade,
    required this.estimatedFinalGrade,
    required this.averageGradePurged,
    required this.estimatedFinalGradePurged,
    required this.usePurgedAverageFinalGrade,
    required this.mastersAdmissionAverageGrade,
    required this.totalOnTimeExamPoints,
    required this.maxOnTimeExamPoints,
    required this.excludedCreditsNumber,
    required this.totalCredits,
    required this.totalAttendedCredits,
    required this.totalAcquiredCredits,
    required this.enrollmentCredits,
    required this.enrollmentAttendedCredits,
    required this.enrollmentAcquiredCredits,
    required this.smartCardPicture,
    required this.europeanStudentCard,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
    final data = (json['data'] ?? {}) as Map<String, dynamic>;

    return StudentData(
      username: data['username'] ?? 's000000',
      firstName: data['firstName'] ?? 'First',
      lastName: data['lastName'] ?? 'Last',
      status: data['status'] ?? 'active',
      allCareerIds: data['allCareerIds'] != null
          ? List<String>.from(data['allCareerIds'])
          : <String>[],
      degreeId: data['degreeId'] ?? '',
      degreeCode: data['degreeCode'] ?? '',
      degreeLevel: data['degreeLevel'] ?? '',
      degreeName: data['degreeName'] ?? '',
      firstEnrollmentYear: data['firstEnrollmentYear'] ?? 0,
      lastEnrollmentYear: data['lastEnrollmentYear'] ?? 0,
      isCurrentlyEnrolled: data['isCurrentlyEnrolled'] ?? false,
      averageGrade: (data['averageGrade'] ?? 0.0).toDouble(),
      estimatedFinalGrade: (data['estimatedFinalGrade'] ?? 0.0).toDouble(),
      averageGradePurged: (data['averageGradePurged'] ?? 0.0)
          .toDouble(), // null → 0.0 safe
      estimatedFinalGradePurged: (data['estimatedFinalGradePurged'] ?? 0.0)
          .toDouble(),
      usePurgedAverageFinalGrade: data['usePurgedAverageFinalGrade'] ?? false,
      mastersAdmissionAverageGrade:
          (data['mastersAdmissionAverageGrade'] as num?)?.toDouble(),
      totalOnTimeExamPoints: (data['totalOnTimeExamPoints'] ?? 0.0).toDouble(),
      maxOnTimeExamPoints: (data['maxOnTimeExamPoints'] ?? 0).toInt(),
      excludedCreditsNumber: data['excludedCreditsNumber'] ?? 0,
      totalCredits: data['totalCredits'] ?? 0,
      totalAttendedCredits: data['totalAttendedCredits'] ?? 0,
      totalAcquiredCredits: data['totalAcquiredCredits'] ?? 0,
      enrollmentCredits: data['enrollmentCredits'] ?? 0,
      enrollmentAttendedCredits: data['enrollmentAttendedCredits'] ?? 0,
      enrollmentAcquiredCredits: data['enrollmentAcquiredCredits'] ?? 0,
      smartCardPicture: data['smartCardPicture'] ?? '',
      europeanStudentCard: data['europeanStudentCard'] != null
          ? EuropeanStudentCard.fromJson(data['europeanStudentCard'])
          : EuropeanStudentCard.empty(),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "status": status,
      "allCareerIds": allCareerIds,
      "degreeId": degreeId,
      "degreeCode": degreeCode,
      "degreeLevel": degreeLevel,
      "degreeName": degreeName,
      "firstEnrollmentYear": firstEnrollmentYear,
      "lastEnrollmentYear": lastEnrollmentYear,
      "isCurrentlyEnrolled": isCurrentlyEnrolled,
      "averageGrade": averageGrade,
      "estimatedFinalGrade": estimatedFinalGrade,
      "averageGradePurged": averageGradePurged,
      "estimatedFinalGradePurged": estimatedFinalGradePurged,
      "usePurgedAverageFinalGrade": usePurgedAverageFinalGrade,
      "mastersAdmissionAverageGrade": mastersAdmissionAverageGrade,
      "totalOnTimeExamPoints": totalOnTimeExamPoints,
      "maxOnTimeExamPoints": maxOnTimeExamPoints,
      "excludedCreditsNumber": excludedCreditsNumber,
      "totalCredits": totalCredits,
      "totalAttendedCredits": totalAttendedCredits,
      "totalAcquiredCredits": totalAcquiredCredits,
      "enrollmentCredits": enrollmentCredits,
      "enrollmentAttendedCredits": enrollmentAttendedCredits,
      "enrollmentAcquiredCredits": enrollmentAcquiredCredits,
      "smartCardPicture": smartCardPicture,
      "europeanStudentCard": europeanStudentCard.toJson(),
    },
  };
}

class EuropeanStudentCard {
  final bool canBeRequested;
  final EuropeanCardDetails details;

  EuropeanStudentCard({required this.canBeRequested, required this.details});

  factory EuropeanStudentCard.fromJson(Map<String, dynamic> json) =>
      EuropeanStudentCard(
        canBeRequested: json['canBeRequested'] ?? false,
        details: json['details'] != null
            ? EuropeanCardDetails.fromJson(json['details'])
            : EuropeanCardDetails.empty(),
      );

  factory EuropeanStudentCard.empty() => EuropeanStudentCard(
    canBeRequested: false,
    details: EuropeanCardDetails.empty(),
  );

  Map<String, dynamic> toJson() => {
    "canBeRequested": canBeRequested,
    "details": details.toJson(),
  };
}

class EuropeanCardDetails {
  final String status;
  final String inactiveStatusReason;
  final String cardNumber;
  final String expiresAt;
  final String qrCode;

  EuropeanCardDetails({
    required this.status,
    required this.inactiveStatusReason,
    required this.cardNumber,
    required this.expiresAt,
    required this.qrCode,
  });

  factory EuropeanCardDetails.fromJson(Map<String, dynamic> json) =>
      EuropeanCardDetails(
        status: json['status'] ?? 'inactive',
        inactiveStatusReason: json['inactiveStatusReason'] ?? '',
        cardNumber: json['cardNumber'] ?? '',
        expiresAt: json['expiresAt'] ?? '',
        qrCode: json['qrCode'] ?? '',
      );

  factory EuropeanCardDetails.empty() => EuropeanCardDetails(
    status: 'inactive',
    inactiveStatusReason: '',
    cardNumber: '',
    expiresAt: '',
    qrCode: '',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "inactiveStatusReason": inactiveStatusReason,
    "cardNumber": cardNumber,
    "expiresAt": expiresAt,
    "qrCode": qrCode,
  };
}
