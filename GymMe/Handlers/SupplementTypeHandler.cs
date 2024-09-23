using GymMe.Models;
using GymMe.Modules;
using GymMe.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Handlers
{
    public class SupplementTypeHandler
    {
        public static Response<List<MsSupplementType>> GetAllTypes()
        {
            List<MsSupplementType> types = SupplementTypeRepository.GetAllTypes();

            if (types.Count == 0)
            {
                return new Response<List<MsSupplementType>>(false, "No types were found", null);
            }

            return new Response<List<MsSupplementType>>(true, "Types were found", types);
        }
    }
}
