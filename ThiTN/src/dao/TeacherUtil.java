package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.LoginBean;
import model.PartAndNumQuestionBean;
import model.PartBean;
import model.SemesterBean;
import model.SubjectBean;

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
				semester.setName(semestersRes.getString("tenhk"));
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
    			List<PartAndNumQuestionBean> parts = new ArrayList<PartAndNumQuestionBean>();
    			while(res.next()) {
    				PartAndNumQuestionBean part = new PartAndNumQuestionBean();
    				part.setPartID(res.getString("maphan"));
    				part.setPartName(res.getString("tenphan"));
    				part.setNumberOfQuestion(res.getInt("socauhoi"));
    				parts.add(part);
    			}
    			return parts;
    		}
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return null;
    }
}
