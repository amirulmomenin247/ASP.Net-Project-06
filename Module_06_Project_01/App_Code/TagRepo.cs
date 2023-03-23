using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Module_06_Project_01.App_Code
{
    public class TagRepo
    {
        SqlConnection con;
        public TagRepo()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public IList<Tagss> GetTagsses()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Tags", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                var data = dt.AsEnumerable()
                    .Select(x =>
                    new Tagss
                    {
                        TagId = x.Field<int>("TagId"),
                        TagName = x.Field<string>("TagName")
                    }
                    ).ToList();
                return data;
            }
        }
        public void Insert(Tagss t)
        {
            using (SqlCommand cmd = new SqlCommand("insert into Tags values (@n)", con))
            {
                cmd.Parameters.AddWithValue("@n", t.TagName);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

        }
        public void Update(Tagss t)
        {
            using (SqlCommand cmd = new SqlCommand(" iupdate  Tags set TagName=@n where TagId=@i", con))
            {
                cmd.Parameters.AddWithValue("@n", t.TagName);
                cmd.Parameters.AddWithValue("@i", t.TagId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

        }
        public void Delete(Tagss t)

        {
            using (SqlCommand cmd = new SqlCommand("delete  Tags  where TagId=@i)", con))
            {
                cmd.Parameters.AddWithValue("@i", t.TagId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

        }
        public int TagCount()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT (*) FROM Tags", con))
            {
                con.Open();
                int i = (int)cmd.ExecuteScalar();
                con.Close();
                return i;
            }
        }

    }
}