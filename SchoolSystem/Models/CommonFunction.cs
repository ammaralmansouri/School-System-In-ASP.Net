using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace SchoolSystem.Models
{
    public class CommonFunction
    {
        public class CommonFunctionx
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolCS"].ConnectionString);
            SqlCommand cmd;
            public void ExecuteQuery(string QueryText)
            {
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                cmd = new SqlCommand(QueryText, con);
                cmd.ExecuteNonQuery();

                con.Close();
            }

            public DataTable SelectData(string QueryText)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                cmd = new SqlCommand(QueryText, con);

                SqlDataAdapter DataAdapter1 = new SqlDataAdapter(cmd);

                DataTable DataTable1 = new DataTable();

                DataAdapter1.Fill(DataTable1);

                con.Close();

                return DataTable1;
            }
        }
    }
}