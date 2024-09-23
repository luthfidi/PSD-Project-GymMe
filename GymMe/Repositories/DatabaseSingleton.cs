using GymMe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Repositories
{
	public class DatabaseSingleton
	{

		private static LocalDatabaseEntities3 _instance;

		public static LocalDatabaseEntities3 GetInstance()
		{
			return _instance ?? (_instance = new LocalDatabaseEntities3());
		}

	}
}