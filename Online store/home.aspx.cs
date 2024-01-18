using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
namespace project_website
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [System.Web.Services.WebMethod]
        public static string  getproductlist (string orderby)
        {

            WebForm1 obj = new WebForm1();
            List<ProductList> allproduct = new List<ProductList>();
            allproduct = obj.GetproductsfromDB();
            string json = JsonConvert.SerializeObject(allproduct);
            return json;
        }
        public List<ProductList> GetproductsfromDB()
        {
            List<ProductList> allproducts = new List<ProductList>();

            //validations try catch
            try
            {

                //List to be used

                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    string query = "Select * from products join trending  on products.id=trending.trend_id";

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
                            Pro.quantity = Convert.ToInt32(sdr["quantity"]);
                            Pro.price = Convert.ToInt32(sdr["quantity"]);
                            Pro.color = sdr["color"].ToString().Trim();
                            Pro.description = sdr["description"].ToString().Trim();
                            Pro.category_id = Convert.ToInt32(sdr["category_id"]);
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