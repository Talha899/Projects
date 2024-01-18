using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_website
{
    public partial class order_confirmed : System.Web.UI.Page
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
        public static string check_order()
        {

            order_confirmed obj = new order_confirmed();
            string isPasswordverified = obj.check_orderdb();

            return isPasswordverified;
        }
        public string check_orderdb()
        {

            string isPasswordv = "1";
            //validations try catch
            try
            {
                //List to be used
                using (SqlConnection connection = new SqlConnection(connectionString))
                { int customer_id = 1;
                    if (HttpContext.Current.Session["Userid"] != null)
                    {
                        customer_id = Convert.ToInt32(HttpContext.Current.Session["Userid"]);
                    }

                    string query = "UPDATE orders SET confirmed = 1 WHERE customer_id ="+ customer_id+";";

                    //  "sp_record"
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();

                        SqlDataReader sdr = cmd.ExecuteReader();

                        if (sdr.HasRows)
                        {
                        
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