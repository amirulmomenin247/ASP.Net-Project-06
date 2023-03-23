using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Module_06_Project_01.Reports;

namespace Module_06_Project_01.Management
{
    public partial class Report1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Books", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Books");

                    CrystalReport1 rpt = new CrystalReport1();
                    da.SelectCommand.CommandText = "SELECT * FROM Publishers";
                    da.Fill(ds, "Publishers");
                    rpt.SetDataSource(ds);
                    CrystalReportViewer1.ReportSource = rpt;
                    CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}