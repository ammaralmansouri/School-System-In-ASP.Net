using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolSystem.Models.CommonFunction;

namespace SchoolSystem.Admin
{
    public partial class EmpAttendanceDetails : System.Web.UI.Page
    {
        CommonFunctionx fn = new CommonFunctionx();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {
                GetAllTeachers();
            }
        }

        private void GetAllTeachers()
        {
            DataTable DataTable1 = fn.SelectData("Select * from teachers");
            DDLTeachers.DataSource = DataTable1;

            DDLTeachers.DataTextField = "TeacherName";
            DDLTeachers.DataValueField = "TeacherID";

            DDLTeachers.DataBind();

            DDLTeachers.Items.Insert(0, "Select teachers");
        }

        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DateTime date = Convert.ToDateTime(txtMonth.Text);

            DataTable DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] ,t.TeacherName,ta.TeacherAttendanceStatus ," +
                                                 " ta.TeacherAttendanceDate from TeachersAttendance ta inner join Teachers t " +
                                                 "on ta.TeacherID = t.TeacherID where  DATEPART(yy,TeacherAttendanceDate)='"+date.Year+"' and " +
                                                 "DATEPART(M,TeacherAttendanceDate)='"+date.Month+"'  and ta.TeacherID='"+DDLTeachers.SelectedValue+"'");

            GVToShowAttendanceDetails.DataSource = DataTable1;
            GVToShowAttendanceDetails.DataBind();

        }
    }
}