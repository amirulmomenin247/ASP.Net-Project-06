using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Module_06_Project_01.Reports
{
    public partial class Report5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Books", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Books1");
                    ds.Tables["Books1"].Columns.Add(new DataColumn("image", typeof(System.Byte[])));
                    for (var i = 0; i < ds.Tables["Books1"].Rows.Count; i++)
                    {
                        ds.Tables["Books1"].Rows[i]["image"] = File.ReadAllBytes(Path.Combine(Server.MapPath(@"~\Pictures"), ds.Tables["Books1"].Rows[i]["BookImg"].ToString()));
                    }

                    CrystalReport5 rtp = new CrystalReport5();
                    rtp.SetDataSource(ds);
                    CrystalReportViewer1.ReportSource = rtp;
                    CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}