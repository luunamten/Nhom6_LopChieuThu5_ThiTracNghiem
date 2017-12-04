package controller.teacher;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;
import dao.TeacherUtil;
import model.LoginBean;
import model.PartAndNumQuestionBean;
import model.QuestionBean;
import model.SubjectBean;
import model.TestBean;

/**
 * Servlet implementation class CreateTestServlet
 */
@WebServlet("/CreateTest")
public class CreateTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateTest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		try {
			Class.forName(DRIVER);
		} catch(ClassNotFoundException exp) {
			exp.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {
				String userType = bean.getUserType();
				if(userType.equals("gv")) {
					TeacherUtil util = new TeacherUtil();
					List<SubjectBean> subjects = util.getCurrentSubjects(bean);
					if(subjects != null && subjects.size() > 0) {
						List<PartAndNumQuestionBean> parts = util.getPartAndNumQuesion(subjects.get(0));
						if(parts != null && parts.size() > 0) {
							request.setAttribute("parts", parts);
						}
						request.setAttribute("subjects", subjects);
					}
					request.getRequestDispatcher("WEB-INF/teacher/tcCreateTest.jsp").forward(request, response);
				} else if(userType.equals("sv")) {
					response.sendRedirect("Student");
				}
				return;
			}
		}
		response.sendRedirect("Home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean loginBean = (LoginBean)ses.getAttribute("loginBean");
			if(loginBean != null) {		
				request.setCharacterEncoding("utf-8");
				String strStartDate = request.getParameter("start_date");
				String strEndDate = request.getParameter("end_date");
				String strStartTime = request.getParameter("start_time");
				String strEndTime = request.getParameter("end_time");
				String testName = request.getParameter("test_name");
				String strDuration = request.getParameter("duration");
				String startDateTime = "";
				String endDateTime = "";
				String[] selectedParts = request.getParameterValues("selectedPart");
				String[] numQuestions = request.getParameterValues("numQuestion");
				String[] totalQuestions = request.getParameterValues("totalQuestion");
				List<PartAndNumQuestionBean> parts = new ArrayList<PartAndNumQuestionBean>();
				int duration = 0;
				StringBuilder errors = new StringBuilder();
				boolean isError = false;
				//Kiem tra loi
				if(strStartDate == null || strStartDate.isEmpty() || strStartTime == null || strStartTime.isEmpty()) {
					isError = true;
					errors.append("> Không được để trống điểm bắt đầu thi.<br />");
				}
				if(strEndDate == null || strEndDate.isEmpty() || strEndTime == null || strEndTime.isEmpty()) {
					isError = true;
					errors.append("> không được để trống điểm kết thúc.<br />");
				} 
				if(strStartDate != null && strEndDate != null && !strStartDate.isEmpty() && !strEndDate.isEmpty()
						&& strStartTime != null && strEndTime != null && !strStartTime.isEmpty() && !strEndTime.isEmpty()) {
					try {
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						startDateTime = String.format("%s %s", strStartDate, strStartTime);
						endDateTime = String.format("%s %s", strEndDate, strEndTime);
						Date start = formatter.parse(startDateTime);
						Date end = formatter.parse(endDateTime);						
						int timeCmp = start.compareTo(end);
						duration = Integer.parseInt(strDuration);	
						if(timeCmp == 1 || timeCmp == 0) {
							isError = true;
							errors.append("> Thời điểm bắt đầu thi phải nhỏ hơn thời điểm kết thúc.<br />");
						}
						if(duration < 10) {
							isError = true;
							errors.append("> Thời gian thi tối thiểu 10 phút.");
						}
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						isError = true;
						e.printStackTrace();
					} catch(NumberFormatException exp) {
						isError = true;
						exp.printStackTrace();
					}		
				}															
				if(testName.trim().length() < 6) {
					isError = true;
					errors.append("> Tên bài thi tối thiểu 6 kí tự.<br />");
				}
				if(selectedParts == null || selectedParts.length == 0 
						|| numQuestions == null || numQuestions.length == 0) {
					isError = true;
					errors.append("> Phải thêm ít nhất 1 phần");
				} else {
					int numSelectedPart = selectedParts.length;
					try {
						for(int i = 0; i < numSelectedPart; i++) {
							String selectedPartID = selectedParts[i];
							int numSelectedQuestion = Integer.parseInt(numQuestions[i]);
							int totalQuestion = Integer.parseInt(totalQuestions[i]);
							if(numSelectedQuestion > totalQuestion) {
								isError = true;
								errors.append(
										String.format("> Số câu đã chọn của phần %s lớn hơn tổng số %d", selectedPartID, totalQuestion));
							} else {
								PartAndNumQuestionBean part = new PartAndNumQuestionBean();
								part.setPartID(selectedPartID);
								part.setNumberOfQuestion(numSelectedQuestion);
								parts.add(part);
							}
						}
					} catch(NumberFormatException exp) {
						isError = true;
						exp.printStackTrace();
					}
				}
				request.setAttribute("saveName", testName);
				request.setAttribute("saveStartDate", strStartDate);
				request.setAttribute("saveEndDate", strEndDate);
				request.setAttribute("saveStartTime", strStartTime);
				request.setAttribute("saveEndTime", strEndTime);
				request.setAttribute("saveDuration",strDuration);
				if(!isError) {
					TestBean testBean = new TestBean();
					testBean.setName(testName);
					testBean.setTeacherID(loginBean.getUsername());
					testBean.setDuration(duration);
					testBean.setStart(startDateTime);
					testBean.setEnd(endDateTime);
					if(this.createTests(testBean, parts)) {
						request.setAttribute("createTestSuccess", "\u2713\u2713 Đã tạo bài thi thành công.");
					} else {
						request.setAttribute("createTestError", "!! Tạo bài thi thất bại.");
					}
					
				} else {
					request.setAttribute("createTestError", errors);
				}
			}
		}
		this.doGet(request, response);
	}

	private boolean createTests(TestBean bean, List<PartAndNumQuestionBean> parts) {
		try(
				Connection con = DBConnection.getConnection();
				CallableStatement testCmd = con.prepareCall("{call sp_tcCreateTest(?,?,?,?,?,?)}");
				) {
			int numRowAffected;
			con.setAutoCommit(false);
			testCmd.registerOutParameter(1, Types.VARCHAR, "outid");
			testCmd.setString(2, bean.getName());
			testCmd.setString(3, bean.getTeacherID());
			testCmd.setString(4, bean.getStart());
			testCmd.setString(5, bean.getEnd());
			testCmd.setInt(6, bean.getDuration());		
			numRowAffected = testCmd.executeUpdate();
			if(numRowAffected > 0) {			
				String testID = testCmd.getString(1);		//lay id cua bai thi vua tao
				List<QuestionBean> selectedQuestions = new ArrayList<QuestionBean>();	//Tao danh sach luu cac cau hoi duoc chon
				for(PartAndNumQuestionBean part : parts) {		//Lap qua cac phan duoc chon
					String partID = part.getPartID();
					int numQuestion = part.getNumberOfQuestion();
					try(CallableStatement questionCmd = con.prepareCall("{call sp_tcLoadQuestionsOfPart(?)}")) {    //Xua ra tat ca cac cau hoi cua mot phan
						questionCmd.setString(1, partID);
						try(ResultSet res = questionCmd.executeQuery()) {
							List<QuestionBean> questions = new ArrayList<QuestionBean>();			//Luu tru cac cau hoi da lay ra tu csdl
							int totalQuestion;
							while(res.next()) {
								QuestionBean question = new QuestionBean();
								question.setId(res.getString("mach"));
								questions.add(question);
							}
							totalQuestion = questions.size();
							if(questions.size() > 0 && totalQuestion >= numQuestion) {
								this.generateRandomNumber(questions, selectedQuestions, part.getNumberOfQuestion());
							} else {
								con.rollback();
								return false;
							}
						}
					}
				}
				if(selectedQuestions.size() > 0) {
					try(CallableStatement addQuestionToTestCmd = con.prepareCall("{call sp_tcAddQuestionsToTest(?,?)}")) {
						for(QuestionBean question : selectedQuestions) {
							addQuestionToTestCmd.setString(1, question.getId());
							addQuestionToTestCmd.setString(2, testID);
							addQuestionToTestCmd.addBatch();
						}
						int[] results = addQuestionToTestCmd.executeBatch();
						boolean isError = false;
						for(int result : results) {
							if(result <= 0) {
								isError = true;
								break;
							}
						}
						if(isError) {
							con.rollback();
							return false;
						} else {
							con.commit();
							return true;
						}
					}
				}
			} 
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	//sinh so nguyen ngau nhien roi luu vao DataTable num la so luong, maxValue la random trong khoang [0;maxValue)
	private void generateRandomNumber(List<QuestionBean> questions, 
			List<QuestionBean> selectedQuestions, int num)
	{
		SecureRandom ran = new SecureRandom();
		HashMap<Integer, Integer> hmap = new HashMap<Integer, Integer>();
		int maxValue = questions.size() - 1;
		for (int i = 0; i < num; i++)
		{
			int value = ran.nextInt(maxValue + 1);
			if (hmap.containsKey(value))
			{
				selectedQuestions.add(questions.get(hmap.get(value)));
			}
			else
			{
				selectedQuestions.add(questions.get(value));
			}
			if (hmap.containsKey(maxValue))
			{
				hmap.put(value, hmap.get(maxValue));
				hmap.remove(maxValue);
			}
			else
			{
				hmap.put(value, maxValue);
			}
			maxValue--;
		}
	}

}
