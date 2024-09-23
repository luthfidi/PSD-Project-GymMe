using GymMe.Handlers;
using GymMe.Models;
using GymMe.Modules;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace GymMe.Controllers
{
    public class UserController
    {
        public static Response<List<MsUser>> GetAllCustomers()
        {
            return UserHandler.GetAllCustomers();
        }

        public static Response<MsUser> LoginUser(string username, string password)
        {
            if (username == "" || password == "")
            {
                return new Response<MsUser>(false, "All fields must be filled in", null);
            }

            return UserHandler.LoginUser(username, password);
        }

        private static bool IsAlphanumeric(string password)
        {
            bool containsAlpha = false;
            bool containsNumber = false;
            foreach (char c in password)
            {
                if (char.IsLetter(c)) containsAlpha = true;
                else if (char.IsDigit(c)) containsNumber = true;
                else return false;
            }
            return (containsAlpha && containsNumber);
        }

        public static Response<MsUser> RegisterUser(string username, string userEmail, string userDob, string userGender, string userPassword, string confPassword)
        {
            string error = "";
            if (username == "" || userEmail == "" || userDob == "" || userGender == "" || userPassword == "" || confPassword == "")
            {
                error = "All fields must be filled in";
            }
            else if (username.Length < 5 || username.Length > 15)
            {
                error = "Username must be between 5 and 15 characters";
            }
            else if (!userEmail.EndsWith(".com"))
            {
                error = "Email must end with .com";
            }
            else if (userGender != "Male" && userGender != "Female")
            {
                error = "Invalid user gender";
            }
            else if (!IsAlphanumeric(userPassword))
            {
                error = "Password must be alphanumeric";
            }
            else if (userPassword != confPassword)
            {
                error = "Passwords do not match";
            }

            if (error != "")
            {
                return new Response<MsUser>(false, error, null);
            }

            return UserHandler.RegisterUser(username, userEmail, DateTime.Parse(userDob), userGender, "Customer", userPassword);
        }

        public static Response<MsUser> GetUserById(int id)
        {
            if (id == 0)
            {
                return new Response<MsUser>(false, "Invalid ID", null);
            }

            return UserHandler.GetUserById(id);
        }

        public static Response<MsUser> UpdateUserProfile(int id, string username, string email, string gender, string dob)
        {
            string error = "";
            if (id == 0 || username == "" || email == "" || gender == "" || dob == "")
            {
                error = "All fields must be filled in";
            }
            else if (username.Length < 5 || username.Length > 15)
            {
                error = "Username must be between 5 and 15 characters";
            }
            else if (!email.EndsWith(".com"))
            {
                error = "Email must end with .com";
            }
            else if (gender != "Male" && gender != "Female")
            {
                error = "Invalid user gender";
            }

            if (error != "")
            {
                return new Response<MsUser>(false, error, null);
            }

            return UserHandler.UpdateUserProfile(id, username, email, gender, DateTime.Parse(dob));
        }

        public static Response<MsUser> UpdateUserPassword(int id, string oldPassword, string newPassword)
        {
            string error = "";
            if (id == 0 || oldPassword == "" || newPassword == "")
            {
                error = "All fields must be filled in";
            }
            else if (!IsAlphanumeric(newPassword))
            {
                error = "Password must be alphanumeric";
            }

            if (error != "")
            {
                return new Response<MsUser>(false, error, null);
            }

            return UserHandler.UpdateUserPassword(id, oldPassword, newPassword);
        }

        public static Response<MsUser> LoginUserByCookie(string cookie)
        {
            if (cookie == "")
            {
                return new Response<MsUser>(false, "Invalid cookie", null);
            }

            return UserHandler.LoginUserByCookie(int.Parse(cookie));
        }
    }
}
