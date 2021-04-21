using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CatchersCompass
{
    public partial class Registration : System.Web.UI.Page
    {
        //Establishing the SQL connection
        SqlConnection con = new SqlConnection("Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\CatcherDatabase.mdf;Integrated Security = True");

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //Submit button
        protected void Button1_Click(object sender, EventArgs e)
        {

            //Setting the inputs from the user to local variables to be sent to the SQL database
            string email = EmailText.Text;
            string username = UsernameText.Text;
            string password = PasswordText.Text;

            //Checking if the password meets the requirements
            int test = CheckForPasswordReq(password);
            if (test == 1) //Requires capital letter
            {
                PasswordStrength.Text = "Password requires capital letter";
                PasswordStrength.Visible = true;
            }
            else if (test == 2) //Requires a digit
            {
                PasswordStrength.Text = "Password requires a digit (1 - 9)";
                PasswordStrength.Visible = true;
            }
            else if (test == 3) //Requires a punctuation
            {
                PasswordStrength.Text = "Password requires a symbol (!, @, #, $)";
                PasswordStrength.Visible = true;
            }
            else if (test == 4) //Requires longer length
            {
                PasswordStrength.Text = "Password requires a minimum of 8 characters";
                PasswordStrength.Visible = true;
            }
            else
            {
                //Checking for duplicate inputs
                if (CheckForUser() == 1 || CheckForEmail() == 1)
                {
                    if (CheckForUser() == 1)
                        UserTaken.Visible = true;
                    if (CheckForEmail() == 1)
                        EmailTaken.Visible = true;

                }
                else
                {
                    //Storing the variables into the SQL database
                    string dat = "INSERT INTO [Users](Email, Username, Password) VALUES (@em, @us, @pa)";
                    SqlCommand com = new SqlCommand(dat, con);
                    com.Parameters.AddWithValue("@em", email);
                    com.Parameters.AddWithValue("@us", username);
                    com.Parameters.AddWithValue("@pa", password);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();

                    //pass username to login page
                    Session["UserName"] = username;

                    //Sending the user back to the login page
                    Response.Redirect("Login.aspx");
                }         }
        }

        //Back button
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }

        //Checking if the username is already in use
        protected int CheckForUser()
        {
            string username = UsernameText.Text;
            string dat = "SELECT COUNT(*) FROM Users WHERE Username = @user";
            SqlCommand cmd = new SqlCommand(dat, con);
            cmd.Parameters.AddWithValue("@user", username);
            con.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            if (count == 0) //If the username is available
                return 0;
            else            //If the username is already taken
                return 1;
        }

        //Checking is the email is already in use
        protected int CheckForEmail()
        {
            string email = EmailText.Text;
            string dat = "SELECT COUNT(*) FROM Users WHERE Email = @em";
            SqlCommand cmd = new SqlCommand(dat, con);
            cmd.Parameters.AddWithValue("@em", email);
            con.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            if (count == 0) //If the email is available
                return 0;
            else            //If the email is already taken
                return 1;
        }

        protected int CheckForPasswordReq(string password)
        {
            //Flags for each requirement to be met
            int upperFlag = 0;
            int puncFlag = 0;
            int digitFlag = 0;

            if (password.Length < 8) //Checking length
            { 
                return 4;
            }
            for (int i = 0; i < password.Length; i++)
            {
                if (Char.IsUpper(password, i)) //Checking for uppercase
                    upperFlag = 1;
                else if (Char.IsPunctuation(password, i) || Char.IsSymbol(password, i)) //Checking for symbols and punctuation
                    puncFlag = 1;
                else if (Char.IsDigit(password, i)) //Checking for a numerical digit
                    digitFlag = 1;

            }
            if (upperFlag != 1)
                return 1;
            if (digitFlag != 1)
                return 2;
            if (puncFlag != 1)
                return 3;
            else
                return 0;
        }

        protected void UsernameText_TextChanged(object sender, EventArgs e)
        {

        }

        protected void EmailText_TextChanged(object sender, EventArgs e)
        {
          
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}