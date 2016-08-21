using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

namespace HiralMehta_Project
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ToyDB"].ConnectionString;
        
        //On page load event, if page is not postback from server, dropdownlist will be populated with following data
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {               
            ddlType.Items.Add("Soft toy");
            ddlType.Items.Add("Doll");
            ddlType.Items.Add("Board game");
            ddlType.Items.Add("Lego");
            ddlType.Items.Add("Plastic toys");
            ddlType.Items.Add("Automobile");
            ddlType.Items.Add("VideoGame");
            ListItem liSelect = new ListItem("Select a type", "-1");
            ddlType.Items.Insert(0, liSelect);
            }
       }

        /*Author of the below method is Hiral Mehta. It is used to submit data into toy database based on data input by advertiser. Some fields are compulsory while others are not, so those data will be inserted as NULL values in database*/
        protected void btnSubmitAvail_Click(object sender, EventArgs e)
        {
            string selectQuery = "SELECT ClientName,ClientCity,ClientPhone,ClientEmail,ToyType,ToyDesc,AgeGroup,AvailabilityWeeks FROM ToyData;";

            SqlConnection conn = new SqlConnection(cs);//Establish connection

            SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn);//Instantiating new data adapter 
           
            DataSet ds = new DataSet();

            da.Fill(ds, "ToyData");//New dataset ds filled with ToyData table
            
            DataTable tblToyData = ds.Tables["ToyData"]; 
           
            DataRow newRow = tblToyData.NewRow();

            newRow["ClientName"] = txtName.Text.Trim();
            newRow["ClientCity"] = txtCity.Text.Trim().ToUpper();
            newRow["ClientPhone"] = txtPhone.Text.Trim();
            newRow["ClientEmail"] = txtEmail.Text.Trim();
            newRow["ToyType"] = ddlType.Text;
            newRow["ToyDesc"] = txtDesc.Text.Trim();
            newRow["AgeGroup"] = rblAvailAgeGroup.Text; 
            newRow["AvailabilityWeeks"] = txtAvail.Text.Trim();

            tblToyData.Rows.Add(newRow);//Insert a new row based on field values


            SqlCommandBuilder builder = new SqlCommandBuilder(da);

            int rowsInserted = da.Update(ds, "ToyData");

            if (rowsInserted > 0)//If row will be inserted, a message will be populated.
            {
               lblAvailable.Text = "Toy successfully inserted to database";
               lblAvailable.ForeColor = Color.Green;
            }
            else
            {
                lblAvailable.Text = "Toy could not be inserted to database, please try again!!";
                lblAvailable.ForeColor = Color.Red;
            }
            //All fields will be set to blank after data insertion
            txtName.Text = "";
            txtCity.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtDesc.Text = "";
            txtAvail.Text = "";
            ddlType.SelectedIndex = -1;
            
        }

        /*Author of the below method is Hiral Mehta. It is used to search existing toys from toy database based on client email provided initially when advertising a toy*/
        private bool searchToy()
        {
            string selectQueryDel =
               "Select ClientName,ToyType,ToyDesc,AgeGroup,AvailabilityWeeks from ToyData where ClientEmail=@ClientEmail1;";

            SqlConnection conn = new SqlConnection(cs);

            SqlDataAdapter da1 = new SqlDataAdapter(selectQueryDel, conn);

            da1.SelectCommand.Parameters.AddWithValue("@ClientEmail1", txtEmailDel.Text);

            DataSet ds1 = new DataSet();
            Cache["DataSet"] = ds1;

            da1.Fill(ds1, "ToyData");

            DataTable tblToy = ds1.Tables["ToyData"];

            if (tblToy.Rows.Count > 0)
            {
                gvDel.DataSource = ds1;
                gvDel.DataBind();
                return true;
            }
            else
            {
                return false;
            }
        }

        /*The below method uses search toydatabase method and if toy found, a lable will display the message*/
        protected void btnLoad_Click(object sender, EventArgs e)
        {
            if (searchToy())
            {
                lblDel.Text = "Here are your toys in the database";
                lblDel.ForeColor = System.Drawing.Color.DarkGreen; 
            }
            else
            {
                lblDel.Text = "No toy found with matching your email";
                lblDel.ForeColor = System.Drawing.Color.Red;
            }
        }

        /*The below method uses search toydatabase method and if toy found, the method will delete that toy from database and display message*/
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (searchToy())
            {
                DataSet ds1 = (DataSet)Cache["DataSet"];
                DataRow dr = ds1.Tables["ToyData"].Rows[0];                               
                dr.Delete();
                lblDel.Text = "Toy deleted";
                lblDel.ForeColor = System.Drawing.Color.Red;
                gvDel.Visible = false;
                txtEmailDel.Text = "";
            }            
            
        }
    }
}