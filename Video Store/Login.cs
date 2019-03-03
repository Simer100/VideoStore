using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Video_Store
{// connection string
    public class Login
    {

        SqlConnection Login_form = new SqlConnection("Data Source=WT135-826LSW\\SQLEXPRESS;Initial Catalog=RENT;Integrated Security=True");
        
        SqlCommand cmd_LoginForm = new SqlCommand();


       

        SqlDataReader Reader_Login;

        String Query_login;


        public bool Login_method(string username, string password)
        { //this method is used to check if the enter data exist in the user table s
            try
            {//Data confermation method from database
                cmd_LoginForm.Connection = Login_form;

                Query_login = "Select UserName, Password from userdata where UserName =  @UserName  and Password =  @password ";


                
                cmd_LoginForm.Parameters.AddWithValue("@UserName", username);
                cmd_LoginForm.Parameters.AddWithValue("@password", password);

                cmd_LoginForm.CommandText = Query_login;
                //connection opened
                Login_form.Open();

                // get data stream
                Reader_Login = cmd_LoginForm.ExecuteReader();


                if (Reader_Login.HasRows)
                {
                   
                    return true;
                }
                else
                {
                    
                    return false;
                }
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("Database Exception" + ex.Message);
                return false;
            }
            finally
            {
                if (Reader_Login != null)
                {
                    Reader_Login.Close();
                }

                // close connection
                if (Login_form != null)
                {
                    Login_form.Close();
                }
                else
                {
                    Login_form.Close();
                }
            }
        }
        
        //method used to register the values in database
        public void Regis_method(string username, string password)
        {
            try
            {
                cmd_LoginForm.Parameters.Clear();
                cmd_LoginForm.Connection = Login_form;

                Query_login = "Insert into userdata (UserName, Password) Values(@user, @pass)";
                cmd_LoginForm.Parameters.AddWithValue("@user", username);
                cmd_LoginForm.Parameters.AddWithValue("@pass", password);

                cmd_LoginForm.CommandText = Query_login;
                //connection opened
                Login_form.Open();

                // get data stream
                cmd_LoginForm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // show error Message
                MessageBox.Show("Database Exception" + ex.Message);
            }
            finally
            {
                // close connection
                if (Login_form != null)
                {
                    Login_form.Close();
                }
                else
                {
                    Login_form.Close();
                }
            }
        }
    }
}
