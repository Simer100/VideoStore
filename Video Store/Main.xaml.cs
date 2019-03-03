using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Video_Store
{
    /// <summary>
    /// Interaction logic for Main.xaml
    /// </summary>
    public partial class Main : Window
    {

        AddDelete Obj_AddDelete = new AddDelete();
        UpdateTop Obj_UpdateTop = new UpdateTop();


        public int CustID;
        public int MoviedID;
        private object dialogResult;



        public Main()
        {
            InitializeComponent();
            date_issue.Text = DateTime.Now.ToString("dd-MM-yyyy");
        }
        private void Topcust_btn_Click(object sender, RoutedEventArgs e)
        {
            Obj_UpdateTop.BestCust();
        }

        private void Topmovie_Click(object sender, RoutedEventArgs e)
        {
            Obj_UpdateTop.bestMovie();
        }

        private void Update_Cuatomer(object sender, RoutedEventArgs e)
        {
            string FirstName = First_name.Text;
            string LastName = Last_name.Text;
            string Address = Address_txt.Text;
            string Phone = Phone_number.Text;
            int CustID = Convert.ToInt32(Custid.Text);
            Obj_UpdateTop.CustomerUpdate(CustID, FirstName, LastName, Address, Phone);

            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
            Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
            Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
            First_name.Text = "";
            Last_name.Text = "";
            Phone_number.Text = "";
            Address_txt.Text = "";
        }

        private void Add_Customer(object sender, RoutedEventArgs e)
        {

            if (First_name.Text != "" && Last_name.Text != "" && Address_txt.Text != "" && Phone_number.Text != "")
            {
                Obj_AddDelete.CustomerAdd(First_name.Text, Last_name.Text, Address_txt.Text, Phone_number.Text);
                Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
                Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
                Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
                Address_txt.Text = "";
                Phone_number.Text = "";
                First_name.Text = "";
                Last_name.Text = "";


            }
        }
        private void Return_Click(object sender, RoutedEventArgs e)
        {

            int RMID = Convert.ToInt32(Rmid.Text);
            dateretuned.Text = DateTime.Today.ToString("dd-MM-yyyy");
            int MoviedID = Convert.ToInt32(Videoid.Text);



            Obj_UpdateTop.UpdateRent(RMID, MoviedID, Convert.ToDateTime(date_issue.Text), DateTime.Now);

            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
            Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
            Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
            Videoid.Text = "";
            Custid.Text = "";
            Genre_Movie.Text = "";
            Year_Movie.Text = "";
            Rating_movie.Text = "";
            Videoid.Text = "";
            copies.Text = "";
            First_name.Text = "";
            Title_movie.Text = "";
            Plot_Movie.Text = "";

            Last_name.Text = "";
            Address_txt.Text = "";
            Phone_number.Text = "";


        }

        private void Deletecustomer(object sender, RoutedEventArgs e)
        {
            int CustID = Convert.ToInt32(Custid.Text);
            if (dialogResult.ToString() == "Yes")
            {
                Obj_AddDelete.Customer_Delete(CustID);
                Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
                First_name.Text = "";
                Address_txt.Text = "";
                Phone_number.Text = "";
                Last_name.Text = "";


            }
        }

        private void loaddatacustomer(object sender, RoutedEventArgs e)
        {
            Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
        }

        private void Select(object sender, MouseButtonEventArgs e)
        {
            DataRowView row = (DataRowView)Customerdatagrid.SelectedItems[0];
            Custid.Text = Convert.ToString(row["CustID"]);
            First_name.Text = Convert.ToString(row["FirstName"]);
            Last_name.Text = Convert.ToString(row["Lastname"]);
            Address_txt.Text = Convert.ToString(row["Address"]);
            Phone_number.Text = Convert.ToString(row["Phone"]);

            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
            Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
            Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
        }

        private void Add_Video(object sender, RoutedEventArgs e)

        {
            if (Rating_movie.Text != "" && Title_movie.Text != "" && Year_Movie.Text != "" && Plot_Movie.Text != "" && Genre_Movie.Text != "" && copies.Text != "")
            {
                int Movieyear = Convert.ToInt32(Year_Movie.Text);
                int copiesmovies = Convert.ToInt32(copies.Text);
                string Money;
                if (2018 - Movieyear > 5)
                {
                    Money = "2";

                }
                else
                {
                    Money = "5";
                }

                Obj_AddDelete.Video_Add(Rating_movie.Text, Title_movie.Text, Year_Movie.Text, Money, Plot_Movie.Text, Genre_Movie.Text, copiesmovies);
                Title_movie.Text = "";
                Plot_Movie.Text = "";
                Year_Movie.Text = "";
                Genre_Movie.Text = "";
                Rating_movie.Text = "";
                copies.Text = "";
                Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
                Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
                Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;

            }
        }

        private void UpdateMovies(object sender, RoutedEventArgs e)
        {
            int MoviedID = Convert.ToInt32(Videoid.Text);
            int copies = Convert.ToInt32(this.copies.Text);


            string Title = Title_movie.Text;
            string Rating = Rating_movie.Text;
            string Plot = Plot_Movie.Text;
            string Genre = Genre_Movie.Text;
            int Year = Convert.ToInt32(Year_Movie.Text);
            Obj_UpdateTop.UpdateVideo(MoviedID, Rating, Title, Year, Plot, Genre, copies);

            Title_movie.Text = "";
            Year_Movie.Text = "";
            Genre_Movie.Text = "";
            this.copies.Text = "";
            Rating_movie.Text = "";
            Plot_Movie.Text = "";
            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
            Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
            Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;

        }

        private void DeleteMovie(object sender, RoutedEventArgs e)
        {

            int movie = Convert.ToInt32(Videoid.Text);



            Obj_AddDelete.Customer_Delete(movie);
            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
            Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
            Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
            Title_movie.Text = "";
            Rating_movie.Text = "";
            Plot_Movie.Text = "";
            Year_Movie.Text = "";
            Genre_Movie.Text = "";
            Videoid.Text = "";






        }

        private void Video_Show(object sender, RoutedEventArgs e)
        {
            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
            Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
            Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;

        }

        private void SelectData(object sender, MouseButtonEventArgs e)
        {
            DataRowView row = (DataRowView)Videodatagrid.SelectedItems[0];
            Title_movie.Text = Convert.ToString(row["Title"]);
            Plot_Movie.Text = Convert.ToString(row["Plot"]);
            Genre_Movie.Text = Convert.ToString(row["Genre"]);
            Year_Movie.Text = Convert.ToString(row["Year"]);
            Rating_movie.Text = Convert.ToString(row["Rating"]);
            Videoid.Text = Convert.ToString(row["MoviedID"]);
            copies.Text = Convert.ToString(row["copies"]);

            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
            Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
            Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
        }

        private void TabControl_SelectionChanged()
        {

        }



        private void Returned_(object sender, RoutedEventArgs e)
        {
            int RMID = Convert.ToInt32(Rmid.Text);
            int MoviedID = Convert.ToInt32(Videoid.Text);



            Obj_UpdateTop.UpdateRent(RMID, MoviedID, Convert.ToDateTime(date_issue.Text), DateTime.Now);

            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
            Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
            Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
            Videoid.Text = "";
            Custid.Text = "";
            Title_movie.Text = "";
            Rating_movie.Text = "";
            Videoid.Text = "";
            copies.Text = "";
            First_name.Text = "";
            Last_name.Text = "";
            Address_txt.Text = "";
            Phone_number.Text = "";
            Plot_Movie.Text = "";
            Genre_Movie.Text = "";
            Year_Movie.Text = "";



        }



        private void Issue_btn_Click(object sender, RoutedEventArgs e)
        {
            if (copies.Text != "0")

            {
                if (Videoid.Text != "" && Custid.Text != "" && date_issue.Text != "")
                {
                    int MovieID = Convert.ToInt32(Videoid.Text);
                    int Customerid = Convert.ToInt32(Custid.Text);
                    date_issue.Text = DateTime.Today.ToString("dd-MM-yyyy");
                    int copies = Convert.ToInt32(this.copies.Text);
                    int Rent = 1;



                    Obj_AddDelete.AddRented(MovieID, Customerid, DateTime.Now, copies, Rent);
                    Videodatagrid.ItemsSource = Obj_AddDelete.Show_Videos().DefaultView;
                    Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
                    Customerdatagrid.ItemsSource = Obj_AddDelete.Load_customer().DefaultView;
                    Videoid.Text = "";
                    Custid.Text = "";
                    Year_Movie.Text = "";
                    Rating_movie.Text = "";
                    Videoid.Text = "";
                    this.copies.Text = "";
                    First_name.Text = "";
                    Title_movie.Text = "";
                    Plot_Movie.Text = "";
                    Genre_Movie.Text = "";

                    Last_name.Text = "";
                    Address_txt.Text = "";
                    Phone_number.Text = "";

                }

            }
            else
            {
                MessageBox.Show("no more copies left");
            }

        }



        private void Rented(object sender, MouseButtonEventArgs e)
        {
            DataRowView row = (DataRowView)Rentaldatagrid.SelectedItems[0];
            Videoid.Text = Convert.ToString(row["MovieIDFK"]);
            Custid.Text = Convert.ToString(row["CustIDFK"]);
            Rmid.Text = Convert.ToString(row["RMID"]);
            date_issue.Text = Convert.ToString(row["DateRented"]);
            dateretuned.Text = DateTime.Now.ToString("dd-MM-yyyy");



            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
        }

        private void video_load(object sender, RoutedEventArgs e)
        {
            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;

        }

        private void rented(object sender, RoutedEventArgs e)
        {
            Rentaldatagrid.ItemsSource = Obj_AddDelete.List_Rented().DefaultView;
        }




    }
}
