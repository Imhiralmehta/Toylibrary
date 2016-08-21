using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace HiralMehta_Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ToyDB"].ConnectionString;

        //On page load event, if page is not postback from server, dropdownlist will be populated with following data
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddlTypeHome.Items.Add("Soft toy");
                ddlTypeHome.Items.Add("Doll");
                ddlTypeHome.Items.Add("Board game");
                ddlTypeHome.Items.Add("Lego");
                ddlTypeHome.Items.Add("Plastic toy");
                ddlTypeHome.Items.Add("Automobile");
                ddlTypeHome.Items.Add("VideoGame");
                ListItem liSelect = new ListItem("Select a type", "-1");
                ddlTypeHome.Items.Insert(0, liSelect);
            }            
        }
        /*Author of the below method is Hiral Mehta. It is used to search data from toy database based on query of toy seeker. All fields in search query are compulsory, so query will only be executed if all field has some value*/
        protected void btnSubmitHome_Click(object sender, EventArgs e)
        {
            string selectQuery =
                "Select ClientName,ClientCity,ClientPhone,ClientEmail,ToyType,ToyDesc,AgeGroup,AvailabilityWeeks from ToyData where ClientCity=@ClientCity AND ToyType=@ToyType AND AgeGroup=@AgeGroup AND AvailabilityWeeks=@AvailabilityWeeks;";
            
            SqlConnection conn = new SqlConnection(cs);//Establish connection

            SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn);//Instantiating new data adapter object

            da.SelectCommand.Parameters.AddWithValue("@AvailabilityWeeks", txtAvailHome.Text.Trim());
            da.SelectCommand.Parameters.AddWithValue("@ToyType", ddlTypeHome.Text);
            da.SelectCommand.Parameters.AddWithValue("@ClientCity", txtCityHome.Text.Trim());
            da.SelectCommand.Parameters.AddWithValue("@AgeGroup", rblHomeAgeGroup.Text);
            
            DataSet ds = new DataSet();

            da.Fill(ds, "ToyData");//New dataset ds filled with ToyData table
           
            DataTable tblToy = ds.Tables["ToyData"];

            if (tblToy.Rows.Count > 0)//If matching toy will be found, table will be populated
            {
                gvHome.DataSource = ds;
                gvHome.DataBind();
               
                lblHome.Text = "Following Toys are found";
                lblHome.ForeColor = System.Drawing.Color.DarkGreen;
            }
            else
            {
                lblHome.Text = "No toy found with matching your queries, please try different search!!";
                lblHome.ForeColor = System.Drawing.Color.Red;
                gvHome.Visible = false;
            }

        }
        
    }
}