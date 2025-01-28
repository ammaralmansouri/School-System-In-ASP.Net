using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolSystem.Teacher
{
    public partial class StudentAttendanceDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Teacher"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
        }
    }
}