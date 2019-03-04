using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
//connection quries
namespace Video_Store

{
    class UpdateTop
    {
        SqlConnection Update_con = new SqlConnection("Data Source=GILL-PC;Initial Catalog=RENT;Integrated Security=True");

        SqlCommand cmd_Update = new SqlCommand();

        SqlDataReader Reader_Update;

        String Update;

        public IEnumerable DefaultView { get; internal set; }
        public string S2 { get; private set; }
        public string Strr { get; private set; }

        public void UpdateRent(int RMID, int MovieID, DateTime DateRent, DateTime DateReturned)
        {
            try
            {
                cmd_Update.Parameters.Clear();
                cmd_Update.Connection = Update_con;
                int RentTotal = 0, Cost = 0;
                double days = (DateReturned - DateRent).TotalDays;

                string S1 = "Select Rental_Cost from Movies where MovieID = @MovieIDFK";
                cmd_Update.Parameters.AddWithValue("@MovieIDFK", MovieID);

                cmd_Update.CommandText = S1;
                Update_con.Open();
                Cost = Convert.ToInt32(cmd_Update.ExecuteScalar());

                if (Convert.ToInt32(days) == 0)
                {
                    RentTotal = Cost;
                }
                else
                {
                    RentTotal = Cost * Convert.ToInt32(days);
                }

                
                S2 = "Update RentedMovies Set DateReturned='" + DateReturned + "' where RMID = @RMID";
                cmd_Update.Parameters.AddWithValue("@DateReurned", DateReturned);
                cmd_Update.Parameters.AddWithValue("@RMID", RMID);

                cmd_Update.CommandText = S2;

                cmd_Update.ExecuteNonQuery();


                

               

                MessageBox.Show("Total Rent is " + RentTotal);
            }
            catch (Exception exception)
            {
                MessageBox.Show("Database Exception " + exception.Message);
            }
            finally
            {
                if (Update_con != null)
                {
                    Update_con.Close();
                }
            }


        }

        public void BestCust()
        {
            int BestID = 0, Max = 0, Total = 0;
            string a = "";
            try
            {//below code is the method to choose the top customer 
                cmd_Update.Parameters.Clear();
                cmd_Update.Connection = Update_con;
                string a1 = "Select IDENT_CURRENT('Coustmer')";

                cmd_Update.CommandText = a1;
                Update_con.Open();
                Total = Convert.ToInt32(cmd_Update.ExecuteScalar());

                for (int i = 1; i <= Total; i++)
                {

                    a = "select Count(*) from RentedMovies where CustIDFK= '" + i + "'";


                    cmd_Update.CommandText = a;
                    int count = Convert.ToInt32(cmd_Update.ExecuteScalar());
                    if (count > Max)
                    {
                        Max = count;
                        BestID = i;
                    }
                }
                this.S2 = "Select FirstName from Coustmer where CustID ='" + BestID + "'";
                this.cmd_Update.CommandText = this.S2;
                String FirstName = Convert.ToString(cmd_Update.ExecuteScalar());
                MessageBox.Show(FirstName + " (CustID " + BestID + " ) is maximum movie buyer with " + Max + " times");
            }
            catch (Exception exception)
            {
                MessageBox.Show("Database Exception " + exception.Message);
            }
            finally
            {
                if (Update_con != null)
                {
                    Update_con.Close();
                }
            }

        }

        // below mwthod is used to select the best movie among all
        public void bestMovie()
        {
            int Top = 0, Maxed = 0, TotalVideos = 0;
            string a = "";
            try
            {
                cmd_Update.Parameters.Clear();
                cmd_Update.Connection = Update_con;
                string Strr1 = "Select IDENT_CURRENT('Movies')";

                cmd_Update.CommandText = Strr1;
                Update_con.Open();
                TotalVideos = Convert.ToInt32(cmd_Update.ExecuteScalar());

                for (int i = 1; i <= TotalVideos; i++)
                {

                    a = "select Count(*) from RentedMovies where MovieIDFK= '" + i + "'";


                    cmd_Update.CommandText = a;
                    int All = Convert.ToInt32(cmd_Update.ExecuteScalar());
                    if (All > Maxed)
                    {
                        Maxed = All;
                        Top = i;
                    }
                }


                this.Strr = "Select Title from Movies where MovieID ='" + Top + "'";
                this.cmd_Update.CommandText = this.Strr;
                String Title = Convert.ToString(cmd_Update.ExecuteScalar());
                MessageBox.Show(Title + " (MovieID " + Top + " ) is maximum rented movie with " + Maxed +
                                " times");
            }
            catch (Exception exception)
            {
                MessageBox.Show("Database Exception " + exception.Message);
            }
            finally
            {
                if (Update_con != null)
                {
                    Update_con.Close();
                }
            }


        }//below method is used to update the data in video section
        public void UpdateVideo(int MovieID, string Rating, string Title, int Year, string Plot, string Genre, int copies)
        {
            try
            {
                cmd_Update.Parameters.Clear();
                cmd_Update.Connection = Update_con;
                Update = "Update Movies Set Rating = @Rating, Title = @Title, Year = @Year,  Plot = @Plot, Genre = @Genre, copies = @copies where MovieID like @MovieID";


                cmd_Update.Parameters.AddWithValue("@MovieID", MovieID);
                cmd_Update.Parameters.AddWithValue("@Rating", Rating);
                cmd_Update.Parameters.AddWithValue("@Title", Title);
                cmd_Update.Parameters.AddWithValue("@Year", Year);
                cmd_Update.Parameters.AddWithValue("@Plot", Plot);
                cmd_Update.Parameters.AddWithValue("@Genre", Genre);
                cmd_Update.Parameters.AddWithValue("@copies", copies);


                cmd_Update.CommandText = Update ;

                //connection opened
                Update_con.Open();

                // Executed query
                cmd_Update.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // show error Message
                MessageBox.Show("Database Exception" + ex.Message);
            }
            finally
            {
                // close connection
                if (Update_con != null)
                {
                    Update_con.Close();
                }
            }
        }// below method is used to to update the data in customer section
        public void CustomerUpdate(int CustID, string FirstName, string LastName, string Address, string Phone)
        {
            try
            {
                cmd_Update.Parameters.Clear();
                cmd_Update.Connection = Update_con;
                Update = "Update Coustmer Set FirstName = @FirstName, LastName = @LastName, Address = @Address, Phone = @Phone where CustID = @CustID";


                cmd_Update.Parameters.AddWithValue("@CustID", CustID);
                cmd_Update.Parameters.AddWithValue("@FirstName", FirstName);
                cmd_Update.Parameters.AddWithValue("@LastName", LastName);
                cmd_Update.Parameters.AddWithValue("@Address", Address);
                cmd_Update.Parameters.AddWithValue("@Phone", Phone);

                cmd_Update.CommandText = Update;

                //connection opened
                Update_con.Open();

                // Executed query
                cmd_Update.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // show error Message
                MessageBox.Show("Database Exception" + ex.Message);
            }
            finally
            {
                // close connection
                if (Update_con != null)
                {
                    Update_con.Close();
                }
            }
        }
    }
 }
