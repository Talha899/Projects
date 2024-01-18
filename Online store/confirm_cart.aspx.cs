using Newtonsoft.Json;
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
    public partial class confirm_cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                sessionAvailable.Value = "true";
            }

        }
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        [System.Web.Services.WebMethod]
        public static string getproductlist(string orderby)
        {

            confirm_cart obj = new confirm_cart();
            List<ProductList> allproduct = new List<ProductList>();
            allproduct = obj.GetproductsfromDB();
            string json = JsonConvert.SerializeObject(allproduct);
            return json;
        }
        [System.Web.Services.WebMethod]
       
        public List<ProductList> GetproductsfromDB()
        {
            List<ProductList> allproducts = new List<ProductList>();

            //validations try catch
            try
            {

                //List to be used

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    var customerid = 1;
                    if (Session["UserName"] != null)
                    {
                        customerid = Convert.ToInt32(HttpContext.Current.Session["Userid"]);
                    }

                    string query = "SELECT products.id as id,name, orders.quantity as qunatity1, price, color, imglink  FROM orders JOIN products ON product_id = products.id where customer_id = " + customerid + " and confirmed=1";

                    //  "sp_record"
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();

                        SqlDataReader sdr = cmd.ExecuteReader();


                        while (sdr.Read())
                        {
                            ProductList Pro = new ProductList();
                            Pro.id = Convert.ToInt32(sdr["id"]);
                            Pro.name = sdr["name"].ToString().Trim();
                            Pro.quantity = Convert.ToInt32(sdr["qunatity1"]);
                            Pro.price = Convert.ToInt32(sdr["price"]);
                            Pro.color = sdr["color"].ToString().Trim();
                            Pro.imglink = sdr["imglink"].ToString().Trim();
                            allproducts.Add(Pro);
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex);
            }
            return allproducts;
        }

        
    }
}