using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolSystem.Models.CommonFunction;

namespace SchoolSystem.Admin
{
    public partial class EmployeeAttendance : System.Web.UI.Page
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
                GetAttendance();
            }
        }

        void GetAttendance()
        {
            DataTable DataTable1 = fn.SelectData("select TeacherID , TeacherName ,TeacherPhoneNumber , TeacherEmail from Teachers");
            GVToShowAttendance.DataSource = DataTable1;
            GVToShowAttendance.DataBind();
            
        }

        protected void btnMarkAttendance_Click(object sender, EventArgs e)
        {


            DataTable DataTable1 = fn.SelectData("select * from teachersattendance where TeacherAttendanceDate = '"+DateTime.Now.ToString()+"'");

            if(DataTable1 .Rows.Count > 0)
            {
                lblMessage.Text = "Teachers has been Attended for today..!";
                lblMessage.CssClass = "alert alert-danger";
            }
            else
            {
                int Statues = 0;

                foreach (GridViewRow row in GVToShowAttendance.Rows)
                {
                    int TeacherID = Convert.ToInt32(row.Cells[1].Text);

                    RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
                    RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);

                    if (rb1.Checked)
                    {
                        Statues = 1;
                    }
                    else if (rb2.Checked)
                    {
                        Statues = 0;
                    }

                    fn.ExecuteQuery("insert into teachersattendance values('" + Statues + "' , '" + DateTime.Now.ToString("yyyy/MM/dd") +
                        "','" + TeacherID + "')");


                }
                lblMessage.Text = "Inserted done successfuly";
                lblMessage.CssClass = "alert alert-success";

            }
            


        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }
    }
}