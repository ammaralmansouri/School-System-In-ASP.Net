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
    public partial class Login : System.Web.UI.Page
    {
        CommonFunctionx fn = new CommonFunctionx();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Email = inputEmail.Value.Trim();
            string Password = inputPassword.Value.Trim();

            DataTable DataTable1 = fn.SelectData("select * from teachers where teacherEmail = '"+Email+"' and teacherPassword= '"+Password+"'");

            if (Email == "admin12@gmail.com" && Password == "1234")
            {
                Session["Admin"] = Email;
                Response.Redirect("Admin/AdminHome.aspx");
            }
            else if(DataTable1.Rows.Count > 0)
            {
                Session["Teacher"] = Email;
                Response.Redirect("Teacher/TeacherHome.aspx");

            }
            else
            {
                lblMessage.Text = "Wrong Eamil or Password..!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}