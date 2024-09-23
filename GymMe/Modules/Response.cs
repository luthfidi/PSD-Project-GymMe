using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Modules
{
	public class Response<T>
	{
		public bool Success { get; set; }
		public string Message { get; set; }
		public T Data { get; set; }

		public Response(bool success, string message, T data)
		{
			Success = success;
			Message = message;
			Data = data;
		}
	}
}