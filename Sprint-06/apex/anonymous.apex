Student__c stu = [
    SELECT Id
    FROM Student__c
    LIMIT 1
];

Student__c result = Student.getStudent(stu.Id);

System.debug(result);
