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
    public partial class StudentAttendanceUserControl : System.Web.UI.UserControl

    {
        CommonFunctionx fn = new CommonFunctionx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllClasses();
            }
        }

        private void GetAllClasses()
        {
            DataTable DataTable1 = fn.SelectData("Select * from Classes");
            DDLClasses.DataSource = DataTable1;

            DDLClasses.DataTextField = "ClassName";
            DDLClasses.DataValueField = "ClassID";

            DDLClasses.DataBind();

            DDLClasses.Items.Insert(0, "Select classes");
        }

        protected void DDLClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ClassID = DDLClasses.SelectedValue;

            DataTable DataTable1 = fn.SelectData("Select * from subjects where subjectclassID = '" + ClassID + "'");
            DDLSubjects.DataSource = DataTable1;

            DDLSubjects.DataTextField = "SubjectName";
            DDLSubjects.DataValueField = "subjectID";

            DDLSubjects.DataBind();

            DDLSubjects.Items.Insert(0, "Select Subjects");
        }

        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DataTable DataTable1;
            DateTime date = Convert.ToDateTime(txtMonth.Text);

            if(DDLSubjects.SelectedValue == "Select Subjects")
            {
                 DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] ,s.StudentName,sub.SubjectName , sa.StudentAttendanceStatus ," +
                                     " sa.StudentAttendanceDate from stydentsAttendance sa inner join Subjects sub on sa.SubjectID = sub.SubjectID inner join students s " +
                                     "on s.StudentRollNumber = sa.StudentAttendanceRollNumber where sa.ClassID = '"+DDLClasses.SelectedValue+ "' and  " +
                                     "sa.StudentAttendanceRollNumber = '"+txtStudentRollNumber.Text.Trim()+"' and DATEPART(yy,StudentAttendanceDate)='" + 
                                     date.Year + "' and DATEPART(M,StudentAttendanceDate)='" + date.Month + "'");
            }
            else
            {
                DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] ,s.StudentName, sub.SubjectName ,sa.StudentAttendanceStatus ," +
                                      " sa.StudentAttendanceDate from stydentsAttendance sa inner join Subjects sub on sa.SubjectID = sub.SubjectID inner join students s " +
                                      "on s.StudentRollNumber = sa.StudentAttendanceRollNumber where sa.ClassID = '" + DDLClasses.SelectedValue + "' and  " +
                                      "sa.StudentAttendanceRollNumber = '" + txtStudentRollNumber.Text.Trim() + "' and sa.SubjectID = '"+DDLSubjects.SelectedValue+"' and DATEPART(yy,StudentAttendanceDate)='" +
                                      date.Year + "' and DATEPART(M,StudentAttendanceDate)='" + date.Month + "'");
            }

            

            GVToShowAttendanceDetails.DataSource = DataTable1;
            GVToShowAttendanceDetails.DataBind();
        }
    }
}