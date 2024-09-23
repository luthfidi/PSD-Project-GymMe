using GymMe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Factories
{
	public class UserFactory
	{

		public static MsUser CreateUser(string username, string userEmail, DateTime userDob, string userGender, string userRole, string userPassword)
		{
			return new MsUser()
			{
				UserName = username,
				UserEmail = userEmail,
				UserDOB = userDob,
				UserGender = userGender,
				UserRole = userRole,
				UserPassword = userPassword
			};
		}

	}
}