using SchoolSystem.Models;
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
    public partial class AdminHome : System.Web.UI.Page
    {
        CommonFunctionx fn = new CommonFunctionx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                CountNumberOfStudents();
                CountNumberOfTeachers();
                CountNumberOfClasses();
                CountNumberOfSubjects();
            }
        }

        void CountNumberOfStudents()
        {
            DataTable DataTable1 = fn.SelectData("select count(*) from students");
            Session["Students"] = DataTable1.Rows[0][0];
        }

        void CountNumberOfTeachers()
        {
            DataTable DataTable1 = fn.SelectData("select count(*) from Teachers");
            Session["Teachers"] = DataTable1.Rows[0][0];
        }

        void CountNumberOfClasses()
        {
            DataTable DataTable1 = fn.SelectData("select count(*) from Classes");
            Session["Classes"] = DataTable1.Rows[0][0];
        }

        void CountNumberOfSubjects()
        {
            DataTable DataTable1 = fn.SelectData("select count(*) from Subjects");
            Session["Subjects"] = DataTable1.Rows[0][0];
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }
    }
}