﻿using System;
using System.Collections.Generic;
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
    /// Interaction logic for LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Window
    {
        Login Obj_Login = new Login();
        public LoginPage()
        { 
            InitializeComponent();
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
        }

      
        private void rg_button(object sender, RoutedEventArgs e)
        {

            (new Window1()).Show();
            this.Close();
        }

        private void Login_btn(object sender, RoutedEventArgs e)
        {
<<<<<<< HEAD:Video Store/LoginForm.xaml.cs
            if (Obj_Login.Login_method(Username_tb.Text, Password_tb.Text))
=======
            if (Obj_Login.Login_method(Username_txtbox.Text, Password_txtbox.Text))//this code passes the variable to Login_method in Login Class 

>>>>>>> c5a159102339b0d23ef6773b6d5653909ccff2d0:Video Store/LoginPage.xaml.cs
            {
                MessageBox.Show("Welcome");
                (new Main()).Show();
                this.Hide();
                
            }
            else
            {
                MessageBox.Show("Invalid User Name or Password");
                (new LoginPage()).Show();
                this.Close();
            }

        }
    }
}
