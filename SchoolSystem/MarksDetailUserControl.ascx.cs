using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolSystem.Models.CommonFunction;

namespace SchoolSystem
{
    public partial class MarksDetailUserControl : System.Web.UI.UserControl
    {

        CommonFunctionx fn = new CommonFunctionx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClasses();
                GetMarks();
            }
        }

        void GetMarks()
        {
            DataTable DataTable1 = fn.SelectData("select Row_Number() OVER(order by(select 1 )) as [Sr.No],e.ExamID ," +
                    " e.ClassID,c.ClassName , e.SubjectID, s.SubjectName , e.ExamRollNumber,e.ExamTotalMarks," +
                    " e.ExamOutOfMarks from Exames e inner join classes c on c.ClassID = e.ClassID inner join " +
                    "Subjects s on s.SubjectID = e.SubjectID ");
            GVToShowMarks.DataSource = DataTable1;
            GVToShowMarks.DataBind();
        }
        void GetClasses()
        {
            DataTable DataTable1 = fn.SelectData("select * from classes");
            DDLClasses.DataSource = DataTable1;
            DDLClasses.DataTextField = "ClassName";
            DDLClasses.DataValueField = "ClassID";
            DDLClasses.DataBind();
            DDLClasses.Items.Insert(0, "select classes");
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classID = DDLClasses.SelectedValue;
                string StudentRollNumber = txtStudentRollNumber.Text.Trim();
                DataTable DataTable1 = fn.SelectData("select Row_Number() OVER(order by(select 1 )) as [Sr.No],e.ExamID ," +
                    " e.ClassID,c.ClassName , e.SubjectID, s.SubjectName , e.ExamRollNumber,e.ExamTotalMarks," +
                    " e.ExamOutOfMarks from Exames e inner join classes c on c.ClassID = e.ClassID inner join " +
                    "Subjects s on s.SubjectID = e.SubjectID where e.ClassID = '" + classID + "'  " +
                    "and e.examrollnumber = '" + StudentRollNumber + "'");
                GVToShowMarks.DataSource = DataTable1;
                GVToShowMarks.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GVToShowMarks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVToShowMarks.PageIndex = e.NewPageIndex;
        }
    }
}