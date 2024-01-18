using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Newtonsoft.Json;

namespace project_website
{
    public partial class create_account : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                sessionAvailable.Value = "true";
            }
        }

        [System.Web.Services.WebMethod]
        public static string checklogin (string email, string password)
        {

            create_account obj = new create_account();
            string isPasswordverified=obj.checkloginfromdb(email, password);


            return isPasswordverified;
        }
        public string checkloginfromdb(string email, string password)
        {
           

            //validations try catch
            try
            {
                //List to be used
                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    string query = "Select * from customers where email= '" + email + "' and password = '" + password+"'";

                    //  "sp_record"
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();

                        SqlDataReader sdr = cmd.ExecuteReader();

                        if (sdr.HasRows)
                        {
                            while (sdr.Read())
                            {
                                Session["UserName"] = sdr["name"].ToString().Trim();
                                Session["UserId"] = Convert.ToInt32(sdr["id"]);
                               
                            }

                            return "1";
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



        [System.Web.Services.WebMethod]
        public static string checkcreateaccount(string name1, string phone1, string email1, string password1, string address1)
        {

            create_account obj = new create_account();
            string isPasswordverified = obj.checkcreateaccountfromdb(name1, phone1,  email1,  password1,  address1);

            return isPasswordverified;
        }
        public string checkcreateaccountfromdb(string name1, string phone1 ,string email1, string password1, string address1)
        {


            //validations try catch
            try
            {
                //List to be used
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                
  
                    string query = "INSERT INTO customers (name, phone, email, billing_address, password) VALUES ('" + name1 + "','" + phone1 + "','"+ email1+ "','" + address1 + "','" + password1 + "')";

                    //  "sp_record"
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();

                        SqlDataReader sdr = cmd.ExecuteReader();
                            return "1";
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