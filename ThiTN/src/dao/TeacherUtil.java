package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ClassBean;
import model.LoginBean;
import model.PartAndNumQuestionBean;
import model.PartBean;
import model.SemesterBean;
import model.StudentBean;
import model.TestingBean;
import model.SubjectBean;
import model.TestBean;

public class TeacherUtil {
	public TeacherUtil() {
		
	}
	public ArrayList<PartBean> getPartsOfSubject(SubjectBean bean) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement cmd = con.prepareCall("{call sp_tcLoadParts(?)}");
				) {
			cmd.setString(1, bean.getId());
			try(ResultSet res = cmd.executeQuery()) {
				ArrayList<PartBean> arr = new ArrayList<PartBean>();
				while(res.next()) {
					PartBean part = new PartBean();
					part.setId(res.getString("maphan"));
					part.setName(res.getString("tenphan"));
					arr.add(part);
				}
				return arr;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<SubjectBean> getAllSubjects() {
		try(Connection con = DBConnection.getConnection();
				CallableStatement cmd = con.prepareCall("{call sp_loadAllSubjects()}");
				) {
			try(ResultSet res = cmd.executeQuery()) {
				ArrayList<SubjectBean> arr = new ArrayList<SubjectBean>();
				while(res.next()) {
					SubjectBean part = new SubjectBean();
					part.setId(res.getString("mamh"));
					part.setName(res.getString("tenmh"));
					arr.add(part);
				}
				return arr;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<SubjectBean> getCurrentSubjects(LoginBean user) {
		try(
				Connection con = DBConnection.getConnection();
				CallableStatement getCurrentSemesterCmd = con.prepareCall("{call sp_loadCurrentSemester()}");
				) {
			try(ResultSet currentSemesterRes = getCurrentSemesterCmd.executeQuery()) {
				if(currentSemesterRes.next()) {
					String semesterID = currentSemesterRes.getString("mahk");
					try(CallableStatement getSubjectsCmd = con.prepareCall("{call sp_tcloadSubjects(?,?)}")) {
						getSubjectsCmd.setString(1, user.getUsername());
						getSubjectsCmd.setString(2, semesterID);
						try(ResultSet subjectsRes = getSubjectsCmd.executeQuery()) {
							ArrayList<SubjectBean> subjects = new ArrayList<SubjectBean>();
							while(subjectsRes.next()) {
								SubjectBean subject = new SubjectBean();
								subject.setId(subjectsRes.getString("mamh"));
								subject.setName(subjectsRes.getString("tenmh"));
								subjects.add(subject);
							}
							return subjects;
						}
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<SemesterBean> getAllSemesters() {
		try(Connection con = DBConnection.getConnection();
				CallableStatement semestersCmd = con.prepareCall("{call sp_loadAllSemesters()}");
				ResultSet semestersRes = semestersCmd.executeQuery()) {
			List<SemesterBean> semesters = new ArrayList<SemesterBean>();
			while(semestersRes.next()) {
				SemesterBean semester = new SemesterBean();
				semester.setId(semestersRes.getString("mahk"));
				semester.setName(semestersRes.getString("mota"));
				semester.setStart(semestersRes.getString("tgbatdau"));
				semester.setEnd(semestersRes.getString("tgketthuc"));
				semesters.add(semester);
			}
			return semesters;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<SubjectBean> getSubjectsOfSemester(LoginBean user, SemesterBean semester) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement subjectsCmd = con.prepareCall("{call sp_tcloadSubjects(?,?)}");
				) {
			subjectsCmd.setString(1, user.getUsername());
			subjectsCmd.setString(2, semester.getId());
			try(ResultSet subjectsRes = subjectsCmd.executeQuery()) {
				List<SubjectBean> subjects = new ArrayList<SubjectBean>();
				while(subjectsRes.next()) {
					SubjectBean subject = new SubjectBean();
					subject.setId(subjectsRes.getString("mamh"));
					subject.setName(subjectsRes.getString("tenmh"));
					subjects.add(subject);
				}
				return subjects;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<PartAndNumQuestionBean> getPartAndNumQuesion(SubjectBean subject) {
    	try(
    			Connection con = DBConnection.getConnection();
    			CallableStatement cmd = con.prepareCall("{call sp_tcNumOfQuestionPerPart(?)}");
    			) {
    		cmd.setString(1, subject.getId());
    		try(ResultSet res = cmd.executeQuery()) {
    			List<PartAndNumQuestionBean> partAndNumQs = new ArrayList<PartAndNumQuestionBean>();
    			while(res.next()) {
    				PartAndNumQuestionBean partAndNumQ = new PartAndNumQuestionBean();
    				PartBean part = new PartBean();
    				part.setId(res.getString("maphan"));
    				part.setName(res.getString("tenphan"));
    				partAndNumQ.setPart(part);
    				partAndNumQ.setNumberOfQuestion(res.getInt("socauhoi"));
    				partAndNumQs.add(partAndNumQ);
    			}
    			return partAndNumQs;
    		}
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return null;
    }
	
	public List<TestingBean> getTestings(ClassBean _class, TestBean test) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement testingsCmd = con.prepareCall("{call sp_tcLoadStudentsOfTest(?,?)}")) {
			testingsCmd.setString(1, _class.getId());
			testingsCmd.setString(2, test.getId());
			try(ResultSet tesingsRes = testingsCmd.executeQuery()) {
				List<TestingBean> testings = new ArrayList<TestingBean>();
				while(tesingsRes.next()) {
					TestingBean testing = new TestingBean();
					StudentBean student = new StudentBean();	
					student.setUsername(tesingsRes.getString("mssv"));
					student.setName(tesingsRes.getString("hoten"));
					testing.setPoint(tesingsRes.getFloat("diemthi"));
					testing.setStart(tesingsRes.getString("ngaythi"));
					testing.setStudent(student);
					testings.add(testing);
				}
				return testings;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<ClassBean> getClasses(SemesterBean semester, LoginBean user, SubjectBean subject) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement classesCmd = con.prepareCall("{call sp_tcLoadClasses(?,?,?)}")) {
			classesCmd.setString(1, semester.getId());
			classesCmd.setString(2, user.getUsername());
			classesCmd.setString(3, subject.getId());
			try(ResultSet classesRes = classesCmd.executeQuery()) {
				List<ClassBean> classes = new ArrayList<ClassBean>();
				while(classesRes.next()) {
					ClassBean _class = new ClassBean();
					_class.setId(classesRes.getString("malop"));
					_class.setName(classesRes.getString("tenlop"));
					_class.setSemesterID(classesRes.getString("mahk"));
					_class.setTeacherID(classesRes.getString("magv"));
					_class.setSubjectID(classesRes.getString("mamh"));
					classes.add(_class);
				}
				return classes;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<TestingBean> getStudentsAndTest(TestBean test, ClassBean _class) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement testingsCmd = con.prepareCall("{call sp_tcLoadStudentsAndTest(?,?)}")) {
			testingsCmd.setString(1, test.getId());
			testingsCmd.setString(2, _class.getId());
			try(ResultSet tesingsRes = testingsCmd.executeQuery()) {
				List<TestingBean> testings = new ArrayList<TestingBean>();
				while(tesingsRes.next()) {
					TestingBean testing = new TestingBean();
					StudentBean student = new StudentBean();
					TestBean _test = new TestBean();
					student.setUsername(tesingsRes.getString("mssv"));
					student.setName(tesingsRes.getString("hoten"));
					_test.setId(tesingsRes.getString("madt"));
					testing.setStudent(student);
					testing.setTest(_test);
					testings.add(testing);
				}
				return testings;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
