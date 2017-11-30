package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import model.QuestionBean;

public class CreateTestDAO {
	public CreateTestDAO() {
		
	}
	
	 //sinh so nguyen ngau nhien roi luu vao DataTable num la so luong, maxValue la random trong khoang [0;maxValue)
    private void generateRandomNumber(List<QuestionBean> questions, 
    		List<QuestionBean> questionTest,
    		String testID, int num, int maxValue)
    {
        Random ran = new Random();
        HashMap<Integer, Integer> hmap = new HashMap<Integer, Integer>();
        for (int i = 0; i < num; i++)
        {
            int value = ran.nextInt(maxValue + 1);
            if (hmap.containsKey(value))
            {
                questionTest.add(questions.get(hmap.get(value)));
            }
            else
            {
            	questionTest.add(questions.get(value));
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
    
  //Tao cac cau hoi cua mot bai thi
   /* private List<QuestionBean> createQuestionOfTest(String testID, ref string error)
    {
        DataGridViewRowCollection rows = this.atPartTable.Rows;
        if (rows.Count == 0)
        {
            error = "Hãy chọn một phần";
            return null;
        }
        //Tao mot bang de luu tru cac cau hoi cua bai thi
        DataTable questionTest = this.createQuestion_TestTable();
        foreach (DataGridViewRow row in rows)       //lap qua cac hang cua datagridview chua phan duoc them vao bai thi
        {
            int numQuestion = (int)row.Cells[2].Value;              //so cau hoi cua mot phan
            object partID = row.Cells[0].Value;                 //lay ma phan
            string partName = (string)row.Cells[1].Value;       //lay ten phan
            DataTable questions = this.bl.getAllQuestionOfPart(partID, ref error);      //lay tat ca cac cau hoi cua mot phan
            if (questions != null)
            {
                int totalQuestion = questions.Rows.Count;       //tong so cac cau hoi
                if (totalQuestion == 0)
                {
                    error = string.Format("Phần {0} không có câu hỏi", partName);
                    return null;
                }
                if (numQuestion > totalQuestion)
                {
                    DialogResult dl = MessageBox.Show(
                        string.Format(
                            "Phần {0} chỉ có {1} câu hỏi, bạn có muốn đổi thành {2} câu hỏi không ?",
                            partName, totalQuestion, totalQuestion), "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dl.ToString().Equals("No"))
                    {
                        error = "Đã ngừng.";
                        return null;
                    }
                    numQuestion = totalQuestion;
                }
                //sinh cac cau hoi ngau nhien khong trung nhau trong tat ca cac cau hoi da lay ra cua mot phan
                this.generateRandomNumber(questions, questionTest, testID, numQuestion, totalQuestion - 1);
            }
            else
            {
                return null;
            }
        }
        return questionTest;
    }
    //Tao ra bai thi
    private DataTable createTest(ref string error)
    {
        return this.bl.insertTest(
             this.atTestNameBox.Text, this.atStartDate.Value, this.atEndDate.Value,
            (int)this.atDuration.Value, ref error);
    }
    //Dua cac cau hoi vao bai thi
    private int addQuestionIntoTest(DataTable dt, ref string error)
    {
        return this.bl.addQuestionsIntoTest(dt, ref error);
    }

    //Khi nhan nut thi tao bai thi
    private void atCreateButton_Click(object sender, EventArgs e)
    {
        DialogResult res = MessageBox.Show(
            "Bạn có muốn tao bài thi ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
        if (res.ToString().Equals("No"))
        {
            return;
        }
        string error = "";
        //Lay ra id cua bai thi moi tao (index 1) va num rows affected (index 0)
        DataTable dt = this.createTest(ref error);
        if (dt != null)
        {
            //Lay id cua bai thi moi duoc tao
            object testID = dt.Rows[0][0];
            
            //Tao cac cau hoi cua bai thi
            DataTable questionTest = this.createQuestionOfTest(testID, ref error);
            if (questionTest != null && error.Equals(""))
            {
                //Dua cac cau hoi da tao vao bai thi
                int numRowAffected = this.addQuestionIntoTest(questionTest, ref error);
                if (error.Equals(""))
                {
                    MessageBox.Show(
                        string.Format("Đã thêm 1 bài thi có {0} câu hỏi", numRowAffected),
                        "Thành công", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show(error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show(error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        else
        {
            MessageBox.Show(error, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }*/
}
