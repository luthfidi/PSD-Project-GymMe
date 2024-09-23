using GymMe.Factories;
using GymMe.Models;
using GymMe.Modules;
using GymMe.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Handlers
{
    public class UserHandler
    {
        public static Response<List<MsUser>> GetAllCustomers()
        {
            List<MsUser> users = UserRepository.GetAllCustomers();

            if (users.Count == 0)
            {
                return new Response<List<MsUser>>(false, "No users were found", null);
            }

            return new Response<List<MsUser>>(true, "Users retrieved successfully", users);
        }

        public static Response<MsUser> LoginUser(string username, string password)
        {
            MsUser user = UserRepository.GetUserByUsername(username);

            if (user == null)
            {
                return new Response<MsUser>(false, "User not found", null);
            }

            if (!user.UserPassword.Equals(password))
            {
                return new Response<MsUser>(false, "Incorrect password", null);
            }

            return new Response<MsUser>(true, "Login successful", user);
        }

        public static Response<MsUser> RegisterUser(string username, string userEmail, DateTime userDOB, string userGender, string userRole, string userPassword)
        {
            MsUser user = UserFactory.CreateUser(username, userEmail, userDOB, userGender, userRole, userPassword);
            UserRepository.AddUser(user);
            return new Response<MsUser>(true, "Registration successful", user);
        }

        public static Response<MsUser> GetUserById(int id)
        {
            MsUser user = UserRepository.GetUserById(id);

            if (user == null)
            {
                return new Response<MsUser>(false, "User not found", null);
            }

            return new Response<MsUser>(true, "User found", user);
        }

        public static Response<MsUser> UpdateUserProfile(int id, string username, string email, string gender, DateTime dob)
        {
            MsUser oldUser = UserRepository.GetUserById(id);

            if (oldUser == null)
            {
                return new Response<MsUser>(false, "User not found", null);
            }

            MsUser newUser = UserFactory.CreateUser(username, email, dob, gender, oldUser.UserRole, oldUser.UserPassword);
            newUser.UserID = id;

            bool updated = UserRepository.UpdateUser(newUser);

            if (!updated)
            {
                return new Response<MsUser>(false, "Failed to update user", null);
            }

            return new Response<MsUser>(true, "User profile updated successfully", newUser);
        }

        public static Response<MsUser> UpdateUserPassword(int id, string oldPassword, string newPassword)
        {
            MsUser oldUser = UserRepository.GetUserById(id);

            if (oldUser == null)
            {
                return new Response<MsUser>(false, "User not found", null);
            }

            if (!oldUser.UserPassword.Equals(oldPassword))
            {
                return new Response<MsUser>(false, "Invalid credentials", null);
            }

            MsUser newUser = UserFactory.CreateUser(oldUser.UserName, oldUser.UserEmail, oldUser.UserDOB, oldUser.UserGender, oldUser.UserRole, newPassword);
            newUser.UserID = id;

            bool updated = UserRepository.UpdateUser(newUser);

            if (!updated)
            {
                return new Response<MsUser>(false, "Failed to update user", null);
            }

            return new Response<MsUser>(true, "Password updated successfully", newUser);
        }

        public static Response<MsUser> LoginUserByCookie(int cookieValue)
        {
            MsUser user = UserRepository.GetUserById(cookieValue);

            if (user == null)
            {
                return new Response<MsUser>(false, "User not found", null);
            }

            return new Response<MsUser>(true, "Login successful", user);
        }
    }
}
