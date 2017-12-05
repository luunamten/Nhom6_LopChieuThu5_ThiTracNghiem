package controller.teacher;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import dao.DBConnection;
import dao.TeacherUtil;
import model.LoginBean;
import model.PartBean;
import model.QuestionBean;
import model.SubjectBean;

/**
 * Servlet implementation class AddQuestionUsingExcel
 */
@WebServlet("/AddQuestionUsingExcel")
@MultipartConfig
public class AddQuestionUsingExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddQuestionUsingExcel() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {
				String userType = bean.getUserType();
				if(userType.equals("gv")) {
					TeacherUtil util = new TeacherUtil();
					List<SubjectBean> subjects = util.getAllSubjects();
					if(subjects != null && subjects.size() > 0) {
						List<PartBean> parts = util.getPartsOfSubject(subjects.get(0));
						if(parts != null && parts.size() > 0) {
							request.setAttribute("parts", parts);
						}
						request.setAttribute("subjects", subjects);
					}
					request.getRequestDispatcher("WEB-INF/teacher/tcAddQuestion.jsp").forward(request, response);
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
		request.setCharacterEncoding("utf-8");
		Part excelFilePart = request.getPart("excel_file");
		Part pidPart = request.getPart("excel_partID");
		StringBuilder errors = new StringBuilder("");
		String partID = "";
		boolean isError = false;
		if(excelFilePart == null) {
			isError = true;
			errors.append("> Không lấy được file Excel.<br />");
		}
		if(pidPart == null) {
			isError = true;
			errors.append("> Không lấy được mã phần.<br />");
		} else {
			partID = this.getStringFromPart(pidPart);
			if(partID == null || partID.isEmpty()) {
				isError = true;
				errors.append("> Không lấy được mã phần.<br />");
			}
		}
		if(!isError) {
			try(InputStream excelInp = excelFilePart.getInputStream();) {
				PartBean part = new PartBean();
				part.setId(partID);
				List<QuestionBean> questions = this.getQuestionsFromExcel(excelInp);

				if(questions != null) {
					int numQuestion = questions.size();
					if(numQuestion > 0) {
						if(this.addQuestions(questions, part)) {
							request.setAttribute("success",
									String.format("\u2713\u2713 Đã thêm %d câu hỏi thành công.", numQuestion));
						} else {
							errors.append("> Thêm các câu hỏi thất bại.<br />");
						}
					}
				} else {
					errors.append("> Không lấy được các câu hỏi trong file Excel.<br />");
				}
			}
		} 
		this.doGet(request, response);
	}

	private String getStringFromPart(Part part) {
		try (InputStream inp = part.getInputStream(); 
				Scanner sc = new Scanner(inp)) {
			if(sc.hasNext()) {
				return sc.nextLine().trim();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private List<QuestionBean> getQuestionsFromExcel(InputStream inp) {
		try {
			if(inp.available() == 0) {
				return null;
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return null;
		}
		try (Workbook workbook = new XSSFWorkbook(inp);) {
			List<QuestionBean> questions = new ArrayList<QuestionBean>();
			Iterator<Sheet> shIterator = workbook.sheetIterator();
			while (shIterator.hasNext()) {
				Iterator<Row> iterator = shIterator.next().iterator();
				while (iterator.hasNext()) {
					Row currentRow = iterator.next();
					List<Object> data = new ArrayList<Object>();
					Iterator<Cell> cellIterator = currentRow.iterator();
					while (cellIterator.hasNext()) {
						Cell currentCell = cellIterator.next();
						if (currentCell.getCellTypeEnum() == CellType.STRING) {
							data.add(currentCell.getStringCellValue());
						} else if (currentCell.getCellTypeEnum() == CellType.NUMERIC) {
							data.add(currentCell.getNumericCellValue());
						}
					}
					if (data.size() != 5) {
						return null;
					}
					QuestionBean question = new QuestionBean();
					question.setContent(data.get(0).toString());
					question.setCorrect(data.get(1).toString());
					question.setWrongs(String.format("[%s][%s][%s]", data.get(2), data.get(3), data.get(4)));
					questions.add(question);
				}
			}
			return questions;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return null;
	}

	public boolean addQuestions(List<QuestionBean> questions, PartBean part) {
		try (Connection con = DBConnection.getConnection();
				CallableStatement cmd = con.prepareCall("{call sp_tcAddQuestion(?,?,?,?)}");) {
			String partID = part.getId();
			con.setAutoCommit(false);
			for (QuestionBean question : questions) {
				cmd.setString(1, question.getContent());
				cmd.setString(2, question.getCorrect());
				cmd.setString(3, question.getWrongs());
				cmd.setString(4, partID);
				cmd.addBatch();
			}
			int[] results = cmd.executeBatch();
			for (int result : results) {
				if (result < 1) {
					con.rollback();
					return false;
				}
			}
			con.commit();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
