using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace project_website
{
    public partial class forgotp : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        [System.Web.Services.WebMethod]
        public static string checkfpass(string name, string phone,string email)
        {

            forgotp obj = new forgotp();
            string isPasswordverified = obj.checkfpassdb(name, phone, email);

            return isPasswordverified;
        }
        public string checkfpassdb(string name, string phone, string email)
        {

            string isPasswordv="0";
            //validations try catch
            try
            {
                //List to be used
                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    string query = "Select * from customers where name= '" + name + "' and phone = '" + phone + "' and email = '"+email+"'";

                    //  "sp_record"
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();

                        SqlDataReader sdr = cmd.ExecuteReader();

                        if (sdr.HasRows)
                        {
                            while (sdr.Read())
                            {
                                isPasswordv = sdr["password"].ToString().Trim();
                            }
                            return isPasswordv;
                        }
                        else
                            return "0";

                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex);
            }

            return "0";

        }

    }
}