package controller.student;

import java.io.IOException;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Login;
import dao.DBConnection;
import model.AnswerBean;
import model.ClassBean;
import model.LoginBean;
import model.QuestionBean;
import model.SubjectBean;
import model.TestBean;
import model.TestingBean;
import model.TestingInfoBean;

/**
 * Servlet implementation class Testing
 */
@WebServlet("/Testing")
public class Testing extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Testing() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
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

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean user = (LoginBean)ses.getAttribute("loginBean");
			if(user != null) {
				String userType = user.getUserType();
				if(userType.equals("sv")) {
					String testID = request.getParameter("test_id");
					String classID = request.getParameter("class_id");
					if(testID != null && !testID.trim().isEmpty() 
							&& classID != null && !classID.trim().isEmpty()) {
						TestBean test = new TestBean();
						ClassBean _class = new ClassBean();
						TestingInfoBean testInfo;
						test.setId(testID);
						_class.setId(classID);
						testInfo = this.getTestingInfo(_class, test, user);
						if(testInfo != null) {
							/*cac truong hop con thi duoc?
					chua thi (ngay thi == null && thoi diem hien tai van con nam trong [bat dau thi; thoi han])
					Da thi, nhung con thoi gian thi. (ngaythi+thoigian > hien tai && xac nhan = 1)
				cac truong hop khong thi duoc
					chua den luc thi (hien tai < bat dau thi)
					sinh vien da thi, nhung het thoi gian (hien tai > ngaythi+thoigian && ngay thi != null)
					sinh vien khong thi va da qua han. (ngaythi == null && hien tai > thoi han)*/
							try {
								SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
								TestingBean testing = testInfo.getTesting();
								String startTesting = testing.getStart();
								Date current = new Date();
								Date start = formatter.parse(testing.getTest().getStart());
								Date end = formatter.parse(testing.getTest().getEnd());
								Calendar cld1 = Calendar.getInstance();
								Calendar cld2 = Calendar.getInstance();
								boolean commit = testing.isCommit();
								boolean isTested = (startTesting != null && !startTesting.isEmpty());
								int duration = testing.getTest().getDuration();
								if(isTested) {
									cld2.setTime(formatter.parse(startTesting));
									cld2.add(Calendar.MINUTE, duration);
								}
								cld1.setTime(current);
								if(!isTested &&
										current.after(start) && current.before(end)	) {
									//Bat dau thi
									System.out.println("bat dau thi");
									this.testing(request, response, test, user);
									

								} else if(!commit && isTested && cld1.compareTo(cld2) < 1) {
									//Tiep tuc thi
									System.out.println("tiep");

								} else if(current.before(start) && !isTested) {
									//Chua den luc thi
									this.beforeStart(request, response, _class, testInfo);
									return;
								} else if(isTested && cld1.compareTo(cld2) > 0) {					
									//Het thoi gian
								} else if(!isTested && current.after(end)) {
									//Qua han
									this.expired(request, response, _class, testInfo);
									return;
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
						String urlEncoded = response.encodeRedirectURL(
								String.format("STLoadTestDetails?tid=%s&cid=%s",testID, classID));
						response.sendRedirect(urlEncoded);
						return;
					}
				} 
			}
		}
		response.sendRedirect("Home");
	}
	private void testing(HttpServletRequest request, HttpServletResponse response,
			TestBean test, LoginBean user) throws ServletException, IOException {
		boolean res = this.getTest(test);
		if(res) {
			HttpSession ses = request.getSession(true);
			ses.setAttribute("test", test);
			if(this.saveStartTesting(user, test) > 0) {
				AnswerBean answers = new AnswerBean();
				answers.setTest(test);		
				ses.setAttribute("answers", answers);
			}
		}
	}
	

	private void viewTesting(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void beforeStart(HttpServletRequest request, HttpServletResponse response,
			ClassBean _class, TestingInfoBean testInfo) throws ServletException, IOException {
		request.setAttribute("errors", "> Chưa đến lúc thi.<br />");
		request.setAttribute("_class", _class);
		request.setAttribute("testInfo", testInfo);
		request.getRequestDispatcher("WEB-INF/student/stViewTestDetails.jsp").forward(request, response);
	}

	private void expired(HttpServletRequest request, HttpServletResponse response, 
			ClassBean _class, TestingInfoBean testInfo) throws ServletException, IOException {
		request.setAttribute("errors", "> Bạn đã bỏ thi.<br />");
		request.setAttribute("_class", _class);
		request.setAttribute("testInfo", testInfo);
		request.getRequestDispatcher("WEB-INF/student/stViewTestDetails.jsp").forward(request, response);
	}

	private TestingInfoBean getTestingInfo(ClassBean _class, TestBean test, LoginBean user) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement testCmd = con.prepareCall("{call sp_stLoadTestDetails(?,?,?)}");) {
			testCmd.setString(1, _class.getId());
			testCmd.setString(2, test.getId());
			testCmd.setString(3, user.getUsername());
			try(ResultSet testRes = testCmd.executeQuery()) {
				if(testRes.next()) {
					TestingInfoBean testingInfo = new TestingInfoBean();
					SubjectBean subject = new SubjectBean();
					TestingBean testing = new TestingBean();
					TestBean _test = new TestBean();
					subject.setId(testRes.getString("mamh"));
					subject.setName(testRes.getString("tenmh"));
					_test.setId(testRes.getString("madt"));
					_test.setName(testRes.getString("tendt"));
					_test.setStart(testRes.getString("batdauthi"));
					_test.setEnd(testRes.getString("thoihan"));
					_test.setDuration(testRes.getInt("thoigian"));
					testing.setStart(testRes.getString("ngaythi"));
					testing.setCommit(testRes.getBoolean("xacnhan"));
					testing.setTest(_test);
					testingInfo.setTesting(testing);
					testingInfo.setSubject(subject);
					testingInfo.setNumQuestion(testRes.getInt("socauhoi"));
					return testingInfo;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
	private boolean getTest(TestBean test) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement testCmd = con.prepareCall("{call sp_loadTestAndQuestions(?)}")
				) {

			testCmd.setString(1, test.getId());
			if(testCmd.execute()) {
				SecureRandom rand = new SecureRandom();
				try(ResultSet questionsRes = testCmd.getResultSet()) {
					if(questionsRes != null) {
						List<QuestionBean> questions = new ArrayList<QuestionBean>();
						while(questionsRes.next()) {
							QuestionBean question = new QuestionBean();
							question.setMapCorrectIndex(this.randomAnswers(rand, question.getMapAnswers()));
							question.setCorrect(questionsRes.getString("cautraloi"));
							question.setWrongs(questionsRes.getString("cautraloikhac"));
							question.setContent(questionsRes.getString("mota"));
							questions.add(question);
						}
						if(testCmd.getMoreResults() && testCmd.getUpdateCount() == -1
								&& questions.size() > 0) {
							try(ResultSet testRes = testCmd.getResultSet()) {
								if(testRes != null ) {
									if(testRes.next()) {
										test.setDuration(testRes.getInt("thoigian"));
										test.setStart(testRes.getString("batdauthi"));
										test.setEnd(testRes.getString("thoihan"));
										test.setName(testRes.getString("tendt"));
										test.setTeacherID(testRes.getString("magv"));
										test.setBirth(testRes.getString("ngaytao"));
										test.setQuestions(questions);
										this.randomQuestions(rand, test.getMapQuestions());
										return true;
									}
								} 
							}
						}
					} 
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	private int saveStartTesting(LoginBean user, TestBean test) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement saveCmd = con.prepareCall("{call sp_stSaveStartTesting(?,?,?)}");) {
			List<QuestionBean> questions = test.getQuestions();
			StringBuilder testData = new StringBuilder();
			int[] questionMap = test.getMapQuestions();
			int numQuestion = questions.size();
			for(int i = 0; i <numQuestion; i++) {
				QuestionBean question = questions.get(questionMap[i]);
				int[] answerMap = question.getMapAnswers();
				testData.append(
						String.format("[{0},{1},{2},{3},{4},{5}]",
		                        questionMap[i], question.getMapCorrectIndex(),
		                        answerMap[0], answerMap[1], answerMap[2], answerMap[3]));
			}
			saveCmd.setString(1, test.getId());
			saveCmd.setString(2, user.getUsername());
			saveCmd.setString(3, testData.toString());
			return saveCmd.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	private void saveTest(TestBean test) {
		
	}

	
	//Xap xep thu tu ngau nhien cac cau hoi cua mot bai thi
    private void randomQuestions(SecureRandom rand, int[] mapIndex)
    {
    	int num = mapIndex.length;
    	int maxValue = num - 1;
        HashMap<Integer, Integer> hmap = new HashMap<Integer, Integer>();
        for (int i = 0; i < num; i++)
        {
            int value;
            int randIndex;
            value = rand.nextInt(maxValue + 1);
            if (hmap.containsKey(value))
            {
                randIndex = hmap.get(value);
                mapIndex[i] = randIndex;
            }
            else
            {
                randIndex = value;
                mapIndex[i] = randIndex;
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

    //Xap xep thu tu ngau nhien cac cau tra loi cua mot cau hoi
    private int randomAnswers(SecureRandom rand, int[] mapIndex)
    {
        int num = 4;
        int maxValue = 3;
        int newCorrectIndex = 0;
        HashMap<Integer, Integer> hmap = new HashMap<Integer, Integer>();
        for (int i = 0; i < num; i++)
        {
            int value;
            int randIndex;
            value = rand.nextInt(maxValue + 1);
            if (hmap.containsKey(value))
            {
                randIndex = hmap.get(value);
                mapIndex[i] = randIndex;
            }
            else
            {
                randIndex = value;
                mapIndex[i] = randIndex;
            }
            if(randIndex == 0)
            {
                newCorrectIndex = i;
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
        return newCorrectIndex;
    }


}
