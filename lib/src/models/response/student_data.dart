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
  final double averageFinalGrade;
  final double averageGradePurged;
  final double estimatedFinalGradePurged;
  final double purgedAverageFinalGrade;
  final double? mastersAdmissionAverageGrade;
  final int excludedCreditsNumber;
  final int totalCredits;
  final int totalAttendedCredits;
  final int totalAcquiredCredits;
  final int enrollmentCredits;
  final int enrollmentAttendedCredits;
  final int enrollmentAcquiredCredits;
  final String smartCardPicture;
  final EuropeanStudentCard europeanStudentCard;
  final bool usePurgedAverageFinalGrade;
  final double totalOnTimeExamPoints;
  final int maxOnTimeExamPoints;

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
    required this.averageFinalGrade,
    required this.averageGradePurged,
    required this.estimatedFinalGradePurged,
    required this.purgedAverageFinalGrade,
    required this.mastersAdmissionAverageGrade,
    required this.excludedCreditsNumber,
    required this.totalCredits,
    required this.totalAttendedCredits,
    required this.totalAcquiredCredits,
    required this.enrollmentCredits,
    required this.enrollmentAttendedCredits,
    required this.enrollmentAcquiredCredits,
    required this.smartCardPicture,
    required this.europeanStudentCard,
    required this.usePurgedAverageFinalGrade,
    required this.totalOnTimeExamPoints,
    required this.maxOnTimeExamPoints,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return StudentData(
      username: data['username'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      status: data['status'],
      allCareerIds: List<String>.from(data['allCareerIds']),
      degreeId: data['degreeId'],
      degreeCode: data['degreeCode'],
      degreeLevel: data['degreeLevel'],
      degreeName: data['degreeName'],
      firstEnrollmentYear: data['firstEnrollmentYear'],
      lastEnrollmentYear: data['lastEnrollmentYear'],
      isCurrentlyEnrolled: data['isCurrentlyEnrolled'],
      averageGrade: (data['averageGrade'] as num).toDouble(),
      estimatedFinalGrade: (data['estimatedFinalGrade'] as num).toDouble(),
      averageFinalGrade: (data['averageFinalGrade'] as num).toDouble(),
      averageGradePurged: (data['averageGradePurged'] as num).toDouble(),
      estimatedFinalGradePurged: (data['estimatedFinalGradePurged'] as num)
          .toDouble(),
      purgedAverageFinalGrade: (data['purgedAverageFinalGrade'] as num)
          .toDouble(),
      mastersAdmissionAverageGrade: data['mastersAdmissionAverageGrade'] == null
          ? null
          : (data['mastersAdmissionAverageGrade'] as num).toDouble(),
      excludedCreditsNumber: data['excludedCreditsNumber'],
      totalCredits: data['totalCredits'],
      totalAttendedCredits: data['totalAttendedCredits'],
      totalAcquiredCredits: data['totalAcquiredCredits'],
      enrollmentCredits: data['enrollmentCredits'],
      enrollmentAttendedCredits: data['enrollmentAttendedCredits'],
      enrollmentAcquiredCredits: data['enrollmentAcquiredCredits'],
      smartCardPicture: data['smartCardPicture'],
      europeanStudentCard: EuropeanStudentCard.fromJson(
        data['europeanStudentCard'],
      ),
      usePurgedAverageFinalGrade: data['usePurgedAverageFinalGrade'],
      totalOnTimeExamPoints: (data['totalOnTimeExamPoints'] as num).toDouble(),
      maxOnTimeExamPoints: (data['maxOnTimeExamPoints'] as num).toInt(),
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
      "averageFinalGrade": averageFinalGrade,
      "averageGradePurged": averageGradePurged,
      "estimatedFinalGradePurged": estimatedFinalGradePurged,
      "purgedAverageFinalGrade": purgedAverageFinalGrade,
      "mastersAdmissionAverageGrade": mastersAdmissionAverageGrade,
      "excludedCreditsNumber": excludedCreditsNumber,
      "totalCredits": totalCredits,
      "totalAttendedCredits": totalAttendedCredits,
      "totalAcquiredCredits": totalAcquiredCredits,
      "enrollmentCredits": enrollmentCredits,
      "enrollmentAttendedCredits": enrollmentAttendedCredits,
      "enrollmentAcquiredCredits": enrollmentAcquiredCredits,
      "smartCardPicture": smartCardPicture,
      "europeanStudentCard": europeanStudentCard.toJson(),
      "usePurgedAverageFinalGrade": usePurgedAverageFinalGrade,
      "totalOnTimeExamPoints": totalOnTimeExamPoints,
      "maxOnTimeExamPoints": maxOnTimeExamPoints,
    },
  };
}

class EuropeanStudentCard {
  final bool canBeRequested;
  final dynamic details;

  EuropeanStudentCard({required this.canBeRequested, required this.details});

  factory EuropeanStudentCard.fromJson(Map<String, dynamic> json) =>
      EuropeanStudentCard(
        canBeRequested: json['canBeRequested'],
        details: json['details'],
      );

  Map<String, dynamic> toJson() => {
    "canBeRequested": canBeRequested,
    "details": details,
  };
}
