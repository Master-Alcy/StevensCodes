# Guanqin Zeng Feedback
Software testing is a very important phase in the software engineering process, and its impact on software reliability is important. Software testing is the phase of the software life cycle that must pass before the software is put into use. The purpose of software testing is to find out what problems exist in the software, and to diagnose and correct the test results through the test results, thereby improving the stability, practicability, reliability and ease of use of the system. This chapter is a use case test of the electronic file management system based on the mail system to discover the problems and fix the system.

## Test Environment

* OS：mac os10.12.2 
* Database：MongoDB 
* Browser：Google Chrome66.0


## Case testing
The basic task of the test phase is to carefully design a set of test cases based on the documentation of the software development phase and the internal structure of the program. There are two main test methods for the system test, namely white box test and black box test. This article uses the black box test method, the black box test is also called the function test, and its main target group is the user error! The reference source was not found. . The idea of the black box test is to treat the system as an invisible black box, and only the input and output can be seen. This use case test method can test whether the system implements the originally required functions, while the black box test uses the method of executing test cases.



| Function                                   | Expected Results                   | Results                         |
| --------------                             | -------------------                | ------------------------------- |
| User login as student                      | login as student                   | login as student                |
| User login as staff                        | login as staff                     | login as staff                  |
| login with not exist acount                | can not login and receive error    | can not login and receive error |
| log out and relog                          | relog                              | relog                           |


## Summary
Identity information is well associated with roles. Database storage, deletion, and modification are all running well. Functionally, it is recommended to add more discerning function distinctions to make the human-computer interaction experience more perfect.