using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_website
{
    public partial class WebForm2 : System.Web.UI.Page
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
        public static string getproduct(int product_id)
        {

            WebForm2 obj = new WebForm2();
            ProductList product= new ProductList();
            product = obj.GetproductfromDB(product_id);
            string json = JsonConvert.SerializeObject(product);
            return json;
        }
        public ProductList GetproductfromDB(int product_id)
        {
            ProductList product = new ProductList();

            //validations try catch
            try
            {

                //List to be used

                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    string query = "Select * from products where id= " + product_id;

                    //  "sp_record"
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();

                        SqlDataReader sdr = cmd.ExecuteReader();

                        while (sdr.Read())
                        {
                            product.id = Convert.ToInt32(sdr["id"]);
                            product.name = sdr["name"].ToString().Trim();
                            product.quantity = Convert.ToInt32(sdr["quantity"]);
                            product.price = Convert.ToInt32(sdr["quantity"]);
                            product.color = sdr["color"].ToString().Trim();
                            product.description = sdr["description"].ToString().Trim();
                            product.category_id = Convert.ToInt32(sdr["category_id"]);
                            product.imglink = sdr["imglink"].ToString().Trim();
                        }

                    }
                }
            }

            catch (SqlException ex)
            {
                Console.WriteLine(ex);
            }
            return product;
        }


        [System.Web.Services.WebMethod]

        public static string orderproduct(int customer_id,int product_id,int quantity,int tracking_id)
        {

            WebForm2 obj = new WebForm2();
            if (HttpContext.Current.Session["Userid"] != null)
            {
                customer_id = Convert.ToInt32(HttpContext.Current.Session["Userid"]);
            }
            string ob = obj.orderproducttoDB( customer_id,  product_id,  quantity,tracking_id).ToString();
            string json = JsonConvert.SerializeObject(ob);
            return json;
        }
        public int  orderproducttoDB(int customer_id, int product_id, int quantity, int tracking_id)
        {
            ProductList product = new ProductList();

            //validations try catch
            try
            {

                //List to be used

                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    string query = "INSERT INTO orders (customer_id,product_id,quantity,tracking_id,order_date,confirmed)  VALUES (" + customer_id+ ","+ product_id + "," +quantity + "," + tracking_id +","+ DateTime.Now.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture)+","+ 0 + ")";

                    //  "sp_record"
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();

                        SqlDataReader sdr = cmd.ExecuteReader();


                        return 1;
                    }
                }
            }

            catch (SqlException ex)
            {
                Console.WriteLine(ex);
                return 0;
            }
        }

    }
}