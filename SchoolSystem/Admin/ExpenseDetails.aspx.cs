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
    public partial class ExpenseDetails : System.Web.UI.Page
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
                GetExpenseDetalis();
            }

        }

        private void GetExpenseDetalis()
        {
            
            DataTable DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] , e.ExpenseID , " +
                "e.ClassID ,  c.ClassName , e.SubjectID , s.SubjectName , e.ExpenseChargeAmount from Expenses e " +
                "inner join classes c on e.ClassID = c.ClassID inner join Subjects s on e.SubjectID = s.SubjectID");

            GVToShowExpenseDetails.DataSource = DataTable1;
            GVToShowExpenseDetails.DataBind();
            

        }
    }
}