using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace CatchersCompass
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //Establishing a SQL session
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\CatcherDatabase.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //Register Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        //Login button
        protected void Button2_Click(object sender, EventArgs e)
        {
            //Setting the username and password to local variables
            string username = UsernameText.Text;

            int flag = CheckForValid();

            if (flag == 1) //Login invalid
            {
                LoginValid.Visible = true;
            }
            else if (UsernameText.Text == "")
            {

            }
            else if (PasswordText.Text == "")
            {

            }
            else if (flag == 0) //Login valid
            {
                Session["UserName"] = username;
                Response.Redirect("MapPage.aspx");
            }
        }

        private int CheckForValid()
        {
            
            string username = UsernameText.Text;
            string password = PasswordText.Text;

            //@"SELECT Count(*) FROM Users WHERE Username=@uname and Password=@pass"
            //SqlCommand cmd = new SqlCommand(query, con);
            string dat = "SELECT COUNT(*) FROM Users WHERE Username=@us AND Password=@pa";
            SqlCommand cmd = new SqlCommand(dat, con);
            cmd.Parameters.AddWithValue("@us", username);
            cmd.Parameters.AddWithValue("@pa", password);
            
            con.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            if (count == 0) //If login invalid
                return 1;
            else            //If login valid
                return 0;

        }
    }
}