using GymMe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Repositories
{
	public class UserRepository
	{
		public static List<MsUser> GetAllCustomers()
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.MsUsers.Where(u => u.UserRole.Equals("Customer")).ToList();
		}

		public static MsUser GetUserByUsername(string username)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.MsUsers.Where(u => u.UserName.Equals(username)).ToList().FirstOrDefault();
		}

		public static void AddUser(MsUser user)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			db.MsUsers.Add(user);
			db.SaveChanges();
		}

		public static MsUser GetUserById(int id)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.MsUsers.Find(id);
		}

		public static bool UpdateUser(MsUser newUser)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			MsUser oldUser = db.MsUsers.Find(newUser.UserID);

			if (oldUser == null)
			{
				return false;
			}

			oldUser.UserName = newUser.UserName;
			oldUser.UserEmail = newUser.UserEmail;
			oldUser.UserDOB = newUser.UserDOB;
			oldUser.UserGender = newUser.UserGender;
			oldUser.UserRole = newUser.UserRole;
			oldUser.UserPassword = newUser.UserPassword;
			db.SaveChanges();

			return true;
		}


	}
}