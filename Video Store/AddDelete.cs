using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
//SQL Connection Source allows the database to connect .
namespace Video_Store
{
    class AddDelete
    {
        SqlConnection AddDelete_con = new SqlConnection("Data Source=GILL-PC;Initial Catalog=RENT;Integrated Security=True");

        SqlCommand cmd_AddDelete = new SqlCommand();

        SqlDataReader Reader_AddDelete;

        String Add;

        public IEnumerable DefaultView { get; internal set; }




        public DataTable Show_Videos()
        {
            DataTable dt = new DataTable();
            try
            {
                cmd_AddDelete.Connection = AddDelete_con;
                Add = "Select * from Movies";

                cmd_AddDelete.CommandText = Add;
                //connection is  opened
                AddDelete_con.Open();

                // code to  get data stream 
                Reader_AddDelete = cmd_AddDelete.ExecuteReader();

                if (Reader_AddDelete.HasRows)
                {
                    dt.Load(Reader_AddDelete);
                }
                return dt;
            }
            catch (Exception ex)
            {
                // showing the error window
                MessageBox.Show("Database Exception" + ex.Message);
                return null;
            }
            finally
            {
                // reader is closed
                if (Reader_AddDelete != null)
                {
                    Reader_AddDelete.Close();
                }

                // connection is closed
                if (AddDelete_con != null)
                {
                    AddDelete_con.Close();
                }
            }

        }
        public void CustomerAdd(string FirstName, string LastName, string Address, string Phone)
        {
            try
            {
                cmd_AddDelete.Parameters.Clear();
                cmd_AddDelete.Connection = AddDelete_con;

                //insert query for add the data to database columns for customer table

                Add = "Insert into Coustmer(FirstName, LastName, Address, Phone) Values( @FirstName, @LastName, @Address, @Phone)";


                cmd_AddDelete.Parameters.AddWithValue("@FirstName", FirstName);
                cmd_AddDelete.Parameters.AddWithValue("@LastName", LastName);
                cmd_AddDelete.Parameters.AddWithValue("@Address", Address);
                cmd_AddDelete.Parameters.AddWithValue("@Phone", Phone);

                cmd_AddDelete.CommandText = Add;

                //connection is opened
                AddDelete_con.Open();

                // Query is excuted
                cmd_AddDelete.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                // showing the error window
                MessageBox.Show("Database Exception" + ex.Message);
            }
            finally
            {
                // connection is closed
                if (AddDelete_con != null)
                {
                    AddDelete_con.Close();
                }
            }
        }
        public void Video_Add(string Rating, string Title, string Year, string Rental_Cost, string Plot, string Genre, int copies)
        {
            try
            {
                cmd_AddDelete.Parameters.Clear();
                cmd_AddDelete.Connection = AddDelete_con;

                //insert query for add the data to database columns for Movies table

                Add = "Insert into Movies(Rating, Title, Year, Rental_Cost, Plot, Genre, copies) Values( @Rating, @Title, @Year, @Rental_Cost, @Plot, @Genre, @copies)";


                cmd_AddDelete.Parameters.AddWithValue("@Rating", Rating);
                cmd_AddDelete.Parameters.AddWithValue("@Title", Title);
                cmd_AddDelete.Parameters.AddWithValue("@Year", Year);
                cmd_AddDelete.Parameters.AddWithValue("@Rental_Cost", Rental_Cost);
                cmd_AddDelete.Parameters.AddWithValue("@Plot", Plot);
                cmd_AddDelete.Parameters.AddWithValue("@Genre", Genre);
                cmd_AddDelete.Parameters.AddWithValue("@copies", copies);

                cmd_AddDelete.CommandText = Add;

                //connection opened
                AddDelete_con.Open();

                // Query is exicuted
                cmd_AddDelete.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                // showing the error window
                MessageBox.Show("Database Exception" + ex.Message);
            }
            finally
            {
                // connection is closed
                if (AddDelete_con != null)
                {
                    AddDelete_con.Close();
                }
            }
        }
        public void Movie_delete(int MovieID)
        {
            try
            {
                cmd_AddDelete.Parameters.Clear();
                cmd_AddDelete.Connection = this.AddDelete_con;


                String S1 = "";
                SqlParameter[] parameterArray = new SqlParameter[] { new SqlParameter("@MovieID", MovieID) };
                cmd_AddDelete.Parameters.Add(parameterArray[0]);

                cmd_AddDelete.CommandText = S1;
                AddDelete_con.Open();

                S1 = "Delete from Movies where MovieID like @MovieID";
                cmd_AddDelete.CommandText = S1;
                cmd_AddDelete.ExecuteNonQuery();
                MessageBox.Show("Movie Deleted");


            }



            catch (Exception exception)
            {
                MessageBox.Show("Database Exception" + exception.Message);
            }
            finally
            {
                if (this.AddDelete_con != null)
                {
                    this.AddDelete_con.Close();
                }
            }
        }
        public DataTable Load_customer()
        {
            DataTable dt = new DataTable();
            try
            {
                cmd_AddDelete.Connection = AddDelete_con;
                Add = "Select * from Coustmer";

                cmd_AddDelete.CommandText = Add;
                //connection   opened
                AddDelete_con.Open();

                // get the data from stream
                Reader_AddDelete = cmd_AddDelete.ExecuteReader();

                if (Reader_AddDelete.HasRows)
                {
                    dt.Load(Reader_AddDelete);
                }
                return dt;
            }
            catch (Exception ex)
            {
                // show error window
                MessageBox.Show("Database Exception" + ex.Message);
                return null;
            }
            finally
            {
                // reader is closed
                if (Reader_AddDelete != null)
                {
                    Reader_AddDelete.Close();
                }

                // connection is closed
                if (AddDelete_con != null)
                {
                    AddDelete_con.Close();
                }
            }

        }
        public void Customer_Delete(Int32 CustID)
        {
            try
            {
                cmd_AddDelete.Parameters.Clear();
                cmd_AddDelete.Connection = this.AddDelete_con;


                String S1 = "";
                SqlParameter[] parameterArray = new SqlParameter[] { new SqlParameter("@CustID", CustID) };
                cmd_AddDelete.Parameters.Add(parameterArray[0]);

                cmd_AddDelete.CommandText = S1;
                AddDelete_con.Open();
               
                    S1 = "Delete from Coustmer where CustID like @CustID";
                    cmd_AddDelete.CommandText = S1;
                    cmd_AddDelete.ExecuteNonQuery();
                    MessageBox.Show("User Deleted");
              
               
            }



            catch (Exception exception)
            {
                MessageBox.Show("Database Exception" + exception.Message);
            }
            finally
            {
                if (this.AddDelete_con != null)
                {
                    this.AddDelete_con.Close();
                }
            }
        }
        public DataTable List_Rented()
        {
            DataTable dt = new DataTable();
            try
            {
                cmd_AddDelete.Connection = AddDelete_con;
                Add = "Select * from RentedMovies";

                cmd_AddDelete.CommandText = Add;
                //connection   opened
                AddDelete_con.Open();

                // get the  data form stream
                Reader_AddDelete = cmd_AddDelete.ExecuteReader();

                if (Reader_AddDelete.HasRows)
                {
                    dt.Load(Reader_AddDelete);
                }
                return dt;
            }
            catch (Exception ex)
            {
                // show error window
                MessageBox.Show("Database Exception" + ex.Message);
                return null;
            }
            finally
            {
                // reader is closed
                if (Reader_AddDelete != null)
                {
                    Reader_AddDelete.Close();
                }

                // connection is closed
                if (AddDelete_con != null)
                {
                    AddDelete_con.Close();
                }
            }

        }



        public void AddRented(int MovieIDFK, int CustIDFK, DateTime DateRented)
        {
            try
            {
                cmd_AddDelete.Parameters.Clear();
                cmd_AddDelete.Connection = AddDelete_con;



                Add = "Insert into RentedMovies(MovieIDFK, CustIDFK, DateRented) Values( @MovieIDFk, @CustIDFK, @DateRented)";

                cmd_AddDelete.Parameters.AddWithValue("@MovieIDFK", MovieIDFK);
                cmd_AddDelete.Parameters.AddWithValue("@CustIDFK", CustIDFK);
                cmd_AddDelete.Parameters.AddWithValue("@DateRented", DateRented);
              
                


                cmd_AddDelete.CommandText = Add;

                //connection is opened
                AddDelete_con.Open();

                // Query is exicuted
                cmd_AddDelete.ExecuteNonQuery();

                Add = "Update Movies set copies = copies-1 where MovieID = @MovieIDFK";
                cmd_AddDelete.CommandText = Add;
                cmd_AddDelete.ExecuteNonQuery();



            }
            catch (Exception ex)
            {
                // show error window
                MessageBox.Show("Database Exception" + ex.Message);
            }
            finally
            {
                // connection is closed
                if (AddDelete_con != null)
                {
                    AddDelete_con.Close();
                }
            }
        }

    }

}
